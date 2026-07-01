import { projects } from '../data/projects';
import type { Project } from '../data/projects';

type SitemapRoute = {
  path: string;
  changefreq: 'monthly' | 'weekly' | 'yearly';
  priority: number;
};

const site = 'https://www.bisdorf.org';

const baseRoutes: SitemapRoute[] = [
  { path: '/', changefreq: 'monthly', priority: 1.0 },
  { path: '/about', changefreq: 'monthly', priority: 0.8 },
  { path: '/projects', changefreq: 'weekly', priority: 0.9 },
  { path: '/resume', changefreq: 'monthly', priority: 0.8 },
  { path: '/contact', changefreq: 'yearly', priority: 0.6 },
];

const getSitemapRoutes = (projectData: Project[]): SitemapRoute[] =>
  [
    ...baseRoutes,
    ...projectData.map((project) => ({
      path: project.detail.path,
      changefreq: 'monthly' as const,
      priority: project.featured ? 0.85 : 0.7,
    })),
  ].sort((a, b) => a.path.localeCompare(b.path));

const toAbsoluteUrl = (path: string) => new URL(path, site).toString();

const escapeXml = (value: string) =>
  value
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;')
    .replaceAll("'", '&apos;');

export async function GET() {
  const sitemapRoutes = getSitemapRoutes(projects);

  const body = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${sitemapRoutes
  .map(
    (route) => `  <url>
    <loc>${escapeXml(toAbsoluteUrl(route.path))}</loc>
    <changefreq>${route.changefreq}</changefreq>
    <priority>${route.priority.toFixed(1)}</priority>
  </url>`,
  )
  .join('\n')}
</urlset>`;

  return new Response(body, {
    headers: {
      'Content-Type': 'application/xml; charset=utf-8',
    },
  });
}
