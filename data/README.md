# SQL-backed project content

Bisdorf.org generates its project index, project detail pages, and sitemap from SQL seed files
loaded during the Astro build. This is a **build-time content source**, not a live SQL server.

| File | Tables and content |
| --- | --- |
| **data/projects.sql** | projects, project_technologies, project_resources |
| **data/project-details.sql** | project_page_copy, project_highlights, project_extra_details, project_extra_sections, project_embedded_videos |

**src/data/projects.ts** reads the two seeds into typed project objects and sorts resources,
technologies, highlights, and detail rows by their numeric **position** field. The shared
template **src/components/ProjectDetailPage.astro** renders the data, while
**src/pages/projects/[...slug].astro** generates routes from the project **detail_path**.
The project index and sitemap use the same loaded project collection.

## Editing a project

1. In **data/projects.sql**, edit its core record (ID, title, classification, summary, route,
   featured state, and image metadata). Update technologies and repository/release links.
2. In **data/project-details.sql**, edit its overview, “What I Built” description, highlights,
   labeled metadata, longer sections, and embedded videos.
3. Reuse the same project ID in both files. Keep **position** values unique within each
   project/table so display order stays predictable.
4. Preserve SQL string syntax: wrap text in single quotes and represent an apostrophe as two
   single quotes. The TypeScript loader parses simple INSERT statements, not arbitrary SQL.
5. Add missing images to **public/images/project-card-thumbnails/**, or use explicit image
   metadata pointing to another existing static asset.

After editing, run:

~~~bash
npm ci
npm run check
~~~

Confirm the project appears in **/projects**, that the shared project route builds and renders,
and that every site-local artifact link resolves. The site-integrity script validates generated
site paths; it does not verify the availability of external GitHub or video URLs.

## Maintaining release references

For projects with public releases (for example, Secure AI Gateway), update the current
release's version, description, and versioned resource links together in the two seed files.
Keep an old release link only if clearly labeled as historical. Link to a published GitHub
Release rather than an unverified branch or candidate tag.

The old **static/dynamic** project detail distinction is no longer used for routing;
all project detail pages use the shared dynamic route. The legacy **body_markdown** field in
the SQL data is not displayed by the current template.
