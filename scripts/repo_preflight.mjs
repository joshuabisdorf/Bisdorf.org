#!/usr/bin/env node

import { execFileSync } from 'node:child_process';
import { existsSync, readFileSync, statSync } from 'node:fs';
import { extname } from 'node:path';

const REQUIRED_FILES = [
  'LICENSE',
  'NOTICE',
  'README.md',
  'SECURITY.md',
  'STYLE.md',
  'package.json',
  'package-lock.json',
  'astro.config.mjs',
  '.github/dependabot.yml',
  'public/_headers',
  'public/robots.txt',
];

const FORBIDDEN_PREFIXES = ['node_modules/', 'dist/', '.astro/'];
const BINARY_EXTENSIONS = new Set([
  '.avif',
  '.gif',
  '.ico',
  '.jpeg',
  '.jpg',
  '.pdf',
  '.png',
  '.webp',
  '.woff',
  '.woff2',
]);

const SECRET_PATTERNS = [
  ['private key', /-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----/],
  ['GitHub token', /\bgh[opusr]_[A-Za-z0-9_]{20,}\b/],
  ['AWS access key', /\bAKIA[0-9A-Z]{16}\b/],
  ['npm token', /\bnpm_[A-Za-z0-9]{36}\b/],
];

/**
 * List tracked repository paths using Git.
 *
 * Requires Git and a readable working tree; invokes a read-only Git command.
 * @returns {string[]} Repository-relative paths of tracked files.
 */
function trackedFiles() {
  return execFileSync('git', ['ls-files', '-z'], { encoding: 'utf8' }).split('\0').filter(Boolean);
}

/**
 * Record a failed repository preflight condition.
 *
 * @param {string} message - Description of the violation.
 * @param {string[]} errors - Mutable list of violations.
 */
function fail(message, errors) {
  errors.push(message);
}

/**
 * Inspect tracked text files for high-confidence credential patterns.
 *
 * Skips known binary extensions and oversized files; appends findings to errors.
 * @param {string[]} files - Tracked paths to inspect.
 * @param {string[]} errors - Mutable list of violations.
 */
function scanCurrentSecrets(files, errors) {
  for (const file of files) {
    if (BINARY_EXTENSIONS.has(extname(file).toLowerCase())) continue;
    if (!existsSync(file) || !statSync(file).isFile()) continue;
    if (statSync(file).size > 2_000_000) continue;

    const text = readFileSync(file, 'utf8');
    for (const [label, pattern] of SECRET_PATTERNS) {
      if (pattern.test(text)) {
        fail(`possible ${label} in tracked file: ${file}`, errors);
      }
    }
  }
}

/**
 * Inspect the Git patch history for high-confidence credential patterns.
 *
 * Executes a read-only full-history Git log and appends findings to errors.
 * @param {string[]} errors - Mutable list of violations.
 */
function scanHistory(errors) {
  const history = execFileSync(
    'git',
    ['log', '--all', '-p', '--no-ext-diff', '--no-textconv', '--format=commit:%H'],
    { encoding: 'utf8', maxBuffer: 128 * 1024 * 1024 },
  );

  for (const [label, pattern] of SECRET_PATTERNS) {
    if (pattern.test(history)) {
      fail(`possible ${label} found in Git history`, errors);
    }
  }
}

/**
 * Check required files, tracked-file hygiene, secrets, and security headers.
 *
 * Run from the repository root with Node.js 22 or newer. Pass --history to
 * include history scanning. Exits with a nonzero status on violations.
 */
function main() {
  const errors = [];
  const files = trackedFiles();

  for (const file of REQUIRED_FILES) {
    if (!existsSync(file)) fail(`missing required file: ${file}`, errors);
  }

  for (const file of files) {
    if (FORBIDDEN_PREFIXES.some((prefix) => file.startsWith(prefix))) {
      fail(`generated/dependency path is tracked: ${file}`, errors);
    }
    if (/^\.env(?:\.|$)/.test(file) && file !== '.env.example') {
      fail(`environment file is tracked: ${file}`, errors);
    }
  }

  scanCurrentSecrets(files, errors);

  const headers = readFileSync('public/_headers', 'utf8');
  for (const header of [
    'Content-Security-Policy:',
    'X-Content-Type-Options:',
    'Referrer-Policy:',
    'Permissions-Policy:',
    'X-Frame-Options:',
  ]) {
    if (!headers.includes(header)) fail(`security header missing: ${header}`, errors);
  }

  const packageJson = JSON.parse(readFileSync('package.json', 'utf8'));
  const lock = JSON.parse(readFileSync('package-lock.json', 'utf8'));
  if (packageJson.name !== lock.name || packageJson.version !== lock.version) {
    fail('package.json and package-lock.json identity/version differ', errors);
  }

  if (process.argv.includes('--history')) scanHistory(errors);

  if (errors.length > 0) {
    for (const error of errors) console.error(`preflight: ${error}`);
    process.exit(1);
  }

  console.log(
    `preflight: OK (${files.length} tracked files${
      process.argv.includes('--history') ? ', history scanned' : ''
    })`,
  );
}

main();
