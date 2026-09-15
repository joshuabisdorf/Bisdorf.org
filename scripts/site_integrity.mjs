#!/usr/bin/env node

import { existsSync, readdirSync, readFileSync, statSync } from 'node:fs';
import { dirname, extname, join, normalize } from 'node:path';

const DIST = 'dist';
const REQUIRED_OUTPUTS = [
  'index.html',
  '404.html',
  'about/index.html',
  'contact/index.html',
  'projects/index.html',
  'resume/index.html',
  'sitemap.xml',
  'robots.txt',
  '_headers',
];

/**
 * Recursively list regular files below a directory.
 *
 * Requires: directory exists and is readable.
 * Modifies: Nothing.
 * Effects: Reads directory metadata.
 * Inputs: Directory path.
 * Outputs: Array of regular file paths.
 */
function walk(directory) {
  const files = [];
  for (const entry of readdirSync(directory)) {
    const path = join(directory, entry);
    if (statSync(path).isDirectory()) files.push(...walk(path));
    else files.push(path);
  }
  return files;
}

/**
 * Determine whether a built-site URL resolves to a generated file.
 *
 * Requires: urlPath is an absolute site-local path.
 * Modifies: Nothing.
 * Effects: Reads filesystem metadata.
 * Inputs: Site-local URL path.
 * Outputs: True when a matching generated file exists.
 */
function resolves(urlPath) {
  const decoded = decodeURIComponent(urlPath.split(/[?#]/, 1)[0]);
  const relative = normalize(decoded.replace(/^\/+/, ''));
  if (relative.startsWith('..')) return false;

  if (relative === '') return existsSync(join(DIST, 'index.html'));

  const direct = join(DIST, relative);
  if (existsSync(direct) && statSync(direct).isFile()) return true;
  if (existsSync(join(direct, 'index.html'))) return true;
  if (!extname(relative) && existsSync(`${direct}.html`)) return true;
  return false;
}

/**
 * Validate generated pages, static assets, internal links, and sitemap routes.
 *
 * Requires: `npm run build` completed successfully.
 * Modifies: Nothing in the generated site.
 * Effects: Reads files under dist and exits nonzero on broken references.
 * Inputs: Generated Astro output.
 * Outputs: A concise integrity pass/fail report.
 */
function main() {
  const errors = [];

  for (const output of REQUIRED_OUTPUTS) {
    if (!existsSync(join(DIST, output))) errors.push(`missing generated output: ${output}`);
  }

  const htmlFiles = walk(DIST).filter((file) => file.endsWith('.html'));
  const referencePattern = /(?:href|src)=["']([^"']+)["']/g;

  for (const file of htmlFiles) {
    const html = readFileSync(file, 'utf8');
    for (const match of html.matchAll(referencePattern)) {
      const reference = match[1];
      if (!reference.startsWith('/') || reference.startsWith('//')) continue;
      if (!resolves(reference)) {
        errors.push(`${file}: unresolved internal reference ${reference}`);
      }
    }
  }

  const sitemap = readFileSync(join(DIST, 'sitemap.xml'), 'utf8');
  const locPattern = /<loc>(https:\/\/www\.bisdorf\.org[^<]*)<\/loc>/g;
  const sitemapUrls = [...sitemap.matchAll(locPattern)].map((match) => match[1]);
  if (sitemapUrls.length === 0) errors.push('sitemap contains no canonical site URLs');

  for (const url of sitemapUrls) {
    const path = new URL(url).pathname;
    if (!resolves(path)) errors.push(`sitemap route does not resolve in build: ${path}`);
  }

  const robots = readFileSync(join(DIST, 'robots.txt'), 'utf8');
  if (!robots.includes('Sitemap:')) errors.push('robots.txt does not advertise a sitemap');

  if (errors.length > 0) {
    for (const error of errors) console.error(`integrity: ${error}`);
    process.exit(1);
  }

  console.log(`integrity: OK (${htmlFiles.length} HTML files, ${sitemapUrls.length} routes)`);
}

main();
