# Repository Style Standard

This repository uses a project-owned style policy. It does not adopt an external
style guide as the repository's governing policy.

## Formatting

- Prettier is the authoritative formatter for supported source files.
- The configured print width is 100 characters.
- UTF-8, LF line endings, final newlines, and spaces instead of tabs are the
  repository defaults.
- Generated files and binary portfolio artifacts are not manually reformatted.

## Astro, JavaScript, and TypeScript

- Prefer small modules with explicit data flow and descriptive names.
- Avoid hidden global state and unnecessary side effects.
- Keep browser-only behavior scoped to the component or page that owns it.
- Treat user-controlled URL, DOM, and storage values as untrusted input.
- Do not suppress type or build errors merely to satisfy CI.

## RMEIO contracts

Non-trivial maintenance scripts and security-sensitive helper functions should
use concise contracts when the behavior is not obvious:

- Requires
- Modifies
- Effects
- Inputs
- Outputs

Simple markup, obvious callbacks, and declarative configuration do not need
ceremonial contracts.

## Repository policy

- `npm ci` is the reproducible installation path used by CI.
- `npm run check` is the local repository gate.
- GitHub Actions must be pinned to immutable commit SHAs.
- New automation should use the minimum practical permissions.
- Site content and design changes should not be mixed into repository-hardening
  work unless the change is required to fix a verified defect.
