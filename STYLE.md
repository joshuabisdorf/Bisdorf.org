# Repository Style Standard

Prettier is the formatter for the Astro, TypeScript, JavaScript, JSON, and Markdown source
files it supports. Follow the established print width of 100 characters, UTF-8, LF line
endings, final newlines, and spaces instead of tabs.

## Astro, JavaScript, and TypeScript

- Keep modules focused, with explicit data flow and descriptive names.
- Use TypeScript annotations for typed project data and component interfaces.
- Document non-trivial functions and boundary conditions using **JSDoc**, the conventional
  documentation syntax for JavaScript and TypeScript.
- Prefer brief summaries; use **@param**, **@returns**, or **@throws** when they explain
  meaningful behavior. Avoid repeating obvious types already expressed in TypeScript.
- Use ordinary JSDoc paragraphs to document non-obvious side effects, environment
  expectations, accessibility behavior, storage failures, and security boundaries.
- Do not preserve legacy RMEIO field lists in new documentation.
- Treat user-controlled DOM, URL, and storage values as untrusted input.
- Do not suppress build or type errors merely to satisfy CI.

Example:

```js
/**
 * Resolve whether a site-local URL exists in the generated output.
 *
 * @param {string} urlPath - Absolute site-local URL path.
 * @returns {boolean} Whether the generated file or index page exists.
 */
function resolves(urlPath) {
  // Implementation.
}
```

Pure helpers with obvious behavior may use a one-sentence comment or no comment. When a
function operates on browser storage, DOM attributes, Git history, or filesystem content,
explain the behavior that a caller cannot infer from its name.

## Project data and documentation

- Treat **data/projects.sql** and **data/project-details.sql** as authoritative for the
  portfolio's project content. See [data/README.md](data/README.md).
- Keep displayed release metadata and versioned resource links aligned with a verified
  published release; preserve older links only when labeled as historical.
- Use descriptive thumbnail alt text and verified internal artifact paths.
- Keep **README.md** aligned with the SQL-backed project loader and generated routes.

## Repository policy

- **npm ci** is the reproducible install path used by CI.
- **npm run check** is the local source and generated-site verification gate.
- GitHub Actions dependencies must be pinned to immutable commit SHAs.
- New automation must use minimum practical permissions.
- Do not combine visual redesigns with code-style or documentation maintenance unless
  required to correct a verified defect.
