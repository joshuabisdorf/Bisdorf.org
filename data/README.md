# Project database

Project metadata is stored in SQLite-compatible SQL seed files:

```text
data/projects.sql
data/project-details.sql
```

The SQL seed uses these tables:

```text
projects
project_technologies
project_resources
project_page_copy
project_highlights
project_extra_details
project_extra_sections
project_embedded_videos
```

The public site reads project metadata and detail-page copy directly from these SQL files at Astro build time through `src/data/projects.ts`. There is no generated `src/content/projects` metadata layer and no export script required for normal builds.

## Updating projects

Edit `data/projects.sql` when adding or changing core project metadata, technologies, or resources.

Edit `data/project-details.sql` when adding or changing project detail-page copy, highlights, extra details, extra sections, or embedded videos.

Then run:

```bash
npm run build
```

All project detail pages are rendered by the shared template route at `src/pages/projects/[...slug].astro`. The older `static` / `dynamic` detail mode distinction is no longer used by the routing code.
