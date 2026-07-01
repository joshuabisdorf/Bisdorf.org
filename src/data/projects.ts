import fs from 'node:fs';
import path from 'node:path';

export type ProjectResourceKind = 'artifact' | 'repository' | 'specification' | 'website' | 'video' | 'resource';

export type ProjectResource = {
  label: string;
  href?: string;
  note?: string;
  kind: ProjectResourceKind;
};

export type ProjectImage = {
  src: string;
  alt: string;
  label: string;
  accent: string;
};

export type ProjectExtraDetail = {
  label: string;
  value: string;
};

export type ProjectExtraSection = {
  title: string;
  content: string;
};

export type ProjectEmbeddedVideo = {
  title: string;
  src: string;
};

export type Project = {
  id: string;
  title: string;
  organization: string;
  classification: string;
  courseCode?: string;
  season?: string;
  summary: string;
  technologies: string[];
  detail: {
    slug: string;
    path: string;
  };
  resources?: ProjectResource[];
  image?: Partial<ProjectImage>;
  featured?: boolean;
  overview?: string;
  whatBuilt?: string;
  highlights?: string[];
  extraDetails?: ProjectExtraDetail[];
  extraSections?: ProjectExtraSection[];
  embeddedVideos?: ProjectEmbeddedVideo[];
};

export type ProjectCourseClassificationOption = {
  value: string;
  slug: string;
  label: string;
  organization: string;
  classification: string;
  courseCode?: string;
};

type SqlValue = string | number | null;
type ResourceRow = ProjectResource & { position: number };
type TechnologyRow = { technology: string; position: number };
type HighlightRow = { body: string; position: number };
type ExtraDetailRow = ProjectExtraDetail & { position: number };
type ExtraSectionRow = ProjectExtraSection & { position: number };
type EmbeddedVideoRow = ProjectEmbeddedVideo & { position: number };

type ProjectDraft = Project & {
  resourceRows: ResourceRow[];
  technologyRows: TechnologyRow[];
  highlightRows: HighlightRow[];
  extraDetailRows: ExtraDetailRow[];
  extraSectionRows: ExtraSectionRow[];
  embeddedVideoRows: EmbeddedVideoRow[];
};

const fallbackAccent = '#8ab4ff';
const restrictedCourseworkRepositoryLabel = 'School-restricted GitHub repository';
const restrictedCourseworkRepositoryNote = 'Private coursework repository; access is restricted. Contact me for more details.';
const courseRepositoryOwner = 'joshuabisdorf';

const seasonOrder: Record<string, number> = {
  Winter: 1,
  Spring: 2,
  Summer: 3,
  Fall: 4,
};

export const projects = loadProjectsFromSql();

export function getProjectById(id: string): Project {
  const project = projects.find((candidate) => candidate.id === id);

  if (!project) {
    throw new Error(`Missing project in SQL data: ${id}`);
  }

  return project;
}

export function getProjectImage(project: Project): ProjectImage {
  return {
    src: project.image?.src || `/images/project-card-thumbnails/${project.id}.webp`,
    alt: project.image?.alt || `${project.title} project thumbnail`,
    label: project.image?.label || project.title,
    accent: project.image?.accent || fallbackAccent,
  };
}

export function getProjectSeason(project: Pick<Project, 'season'>): string {
  return project.season || '';
}

export function getSeasonSortValue(project: Pick<Project, 'season'>): number {
  if (!project.season) {
    return 0;
  }

  const [season, yearString] = project.season.split(/\s+/);
  const year = Number.parseInt(yearString || '', 10);

  if (!Number.isFinite(year)) {
    return 0;
  }

  return year * 10 + (seasonOrder[season] || 0);
}

export function getProjectClassificationSlug(
  project: Pick<Project, 'detail' | 'classification'> | string | undefined | null,
): string {
  if (!project) {
    return '';
  }

  if (typeof project === 'string') {
    return slugify(project);
  }

  return project.detail?.slug || slugify(project.classification);
}

export function getProjectClassificationValue(project: Pick<Project, 'classification' | 'detail'>): string {
  return getProjectClassificationSlug(project);
}

export function getProjectClassificationLabel(project: Pick<Project, 'courseCode' | 'classification'>): string {
  return project.courseCode ? `${project.courseCode} — ${project.classification}` : project.classification;
}

export function getProjectCourseClassificationOptions(projectsToGroup: Project[]): ProjectCourseClassificationOption[] {
  const options = new Map<string, ProjectCourseClassificationOption>();

  for (const project of projectsToGroup) {
    const slug = getProjectClassificationSlug(project);
    const key = `${project.organization}:${slug}`;

    if (!options.has(key)) {
      options.set(key, {
        value: slug,
        slug,
        label: getProjectClassificationLabel(project),
        organization: project.organization,
        classification: project.classification,
        courseCode: project.courseCode,
      });
    }
  }

  return [...options.values()].sort((a, b) => {
    const orgCompare = a.organization.localeCompare(b.organization);

    if (orgCompare !== 0) {
      return orgCompare;
    }

    return a.label.localeCompare(b.label);
  });
}

function loadProjectsFromSql(): Project[] {
  const sql = readSqlSeed('data/projects.sql', true) + '\n' + readSqlSeed('data/project-details.sql', false);
  const drafts = new Map<string, ProjectDraft>();

  for (const values of matchInsertValues(sql, 'projects')) {
    const row = parseSqlValues(values);
    const id = asString(row[0]);
    const title = asString(row[1]);
    const organization = asString(row[2]);
    const classification = asString(row[3]);
    const courseCode = asOptionalString(row[4]);
    const season = asOptionalString(row[5]);
    const summary = asString(row[6]);
    const detailSlug = asString(row[7]);
    const detailPath = asString(row[8]);
    const featured = Boolean(asNumber(row[10]));
    const imageSrc = asOptionalString(row[11]);
    const imageAlt = asOptionalString(row[12]);
    const imageLabel = asOptionalString(row[13]);
    const imageAccent = asOptionalString(row[14]);
    const image = buildImage({ imageSrc, imageAlt, imageLabel, imageAccent });

    drafts.set(id, {
      id,
      title,
      organization,
      classification,
      ...(courseCode ? { courseCode } : {}),
      ...(season ? { season } : {}),
      summary,
      technologies: [],
      detail: {
        slug: detailSlug,
        path: detailPath,
      },
      ...(Object.keys(image).length > 0 ? { image } : {}),
      ...(featured ? { featured } : {}),
      resourceRows: [],
      technologyRows: [],
      highlightRows: [],
      extraDetailRows: [],
      extraSectionRows: [],
      embeddedVideoRows: [],
    });
  }

  for (const values of matchInsertValues(sql, 'project_technologies')) {
    const row = parseSqlValues(values);
    const project = drafts.get(asString(row[0]));

    if (!project) {
      continue;
    }

    project.technologyRows.push({
      technology: asString(row[1]),
      position: asNumber(row[2]),
    });
  }

  for (const values of matchInsertValues(sql, 'project_resources')) {
    const row = parseSqlValues(values);
    const project = drafts.get(asString(row[0]));

    if (!project) {
      continue;
    }

    const href = asOptionalString(row[2]);
    const note = asOptionalString(row[4]);
    const resource = normalizeProjectResource(project, {
      label: asString(row[1]),
      ...(href ? { href } : {}),
      kind: asString(row[3]) as ProjectResourceKind,
      ...(note ? { note } : {}),
      position: asNumber(row[5]),
    });

    project.resourceRows.push(resource);
  }

  for (const values of matchInsertValues(sql, 'project_page_copy')) {
    const row = parseSqlValues(values);
    const project = drafts.get(asString(row[0]));

    if (!project) {
      continue;
    }

    project.overview = asOptionalString(row[1]);
    project.whatBuilt = asOptionalString(row[2]);
  }

  for (const values of matchInsertValues(sql, 'project_highlights')) {
    const row = parseSqlValues(values);
    const project = drafts.get(asString(row[0]));

    if (!project) {
      continue;
    }

    project.highlightRows.push({
      body: asString(row[1]),
      position: asNumber(row[2]),
    });
  }

  for (const values of matchInsertValues(sql, 'project_extra_details')) {
    const row = parseSqlValues(values);
    const project = drafts.get(asString(row[0]));

    if (!project) {
      continue;
    }

    project.extraDetailRows.push({
      label: asString(row[1]),
      value: asString(row[2]),
      position: asNumber(row[3]),
    });
  }

  for (const values of matchInsertValues(sql, 'project_extra_sections')) {
    const row = parseSqlValues(values);
    const project = drafts.get(asString(row[0]));

    if (!project) {
      continue;
    }

    project.extraSectionRows.push({
      title: asString(row[1]),
      content: asString(row[2]),
      position: asNumber(row[3]),
    });
  }

  for (const values of matchInsertValues(sql, 'project_embedded_videos')) {
    const row = parseSqlValues(values);
    const project = drafts.get(asString(row[0]));

    if (!project) {
      continue;
    }

    project.embeddedVideoRows.push({
      title: asString(row[1]),
      src: asString(row[2]),
      position: asNumber(row[3]),
    });
  }

  return [...drafts.values()]
    .map(
      ({
        resourceRows,
        technologyRows,
        highlightRows,
        extraDetailRows,
        extraSectionRows,
        embeddedVideoRows,
        ...project
      }) => {
        const technologies = technologyRows
          .sort((a, b) => a.position - b.position)
          .map(({ technology }) => technology);
        const resources = resourceRows
          .sort((a, b) => a.position - b.position)
          .map(({ position: _position, ...resource }) => resource);
        const highlights = highlightRows
          .sort((a, b) => a.position - b.position)
          .map(({ body }) => body);
        const extraDetails = extraDetailRows
          .sort((a, b) => a.position - b.position)
          .map(({ position: _position, ...detail }) => detail);
        const extraSections = extraSectionRows
          .sort((a, b) => a.position - b.position)
          .map(({ position: _position, ...section }) => section);
        const embeddedVideos = embeddedVideoRows
          .sort((a, b) => a.position - b.position)
          .map(({ position: _position, ...video }) => video);

        return {
          ...project,
          technologies,
          ...(resources.length > 0 ? { resources } : {}),
          ...(highlights.length > 0 ? { highlights } : {}),
          ...(extraDetails.length > 0 ? { extraDetails } : {}),
          ...(extraSections.length > 0 ? { extraSections } : {}),
          ...(embeddedVideos.length > 0 ? { embeddedVideos } : {}),
        };
      },
    )
    .sort((a, b) => a.title.localeCompare(b.title));
}

function normalizeProjectResource(project: ProjectDraft, resource: ResourceRow): ResourceRow {
  if (!isRestrictedCourseworkRepository(project, resource)) {
    return resource;
  }

  return {
    ...resource,
    label: restrictedCourseworkRepositoryLabel,
    note: resource.note || restrictedCourseworkRepositoryNote,
  };
}

function isRestrictedCourseworkRepository(project: Pick<Project, 'organization' | 'courseCode'>, resource: ProjectResource): boolean {
  return (
    project.organization === 'University of Michigan' &&
    Boolean(project.courseCode?.startsWith('EECS')) &&
    resource.kind === 'repository' &&
    Boolean(resource.href?.includes(courseRepositoryOwner))
  );
}

function readSqlSeed(relativeFilePath: string, required: boolean): string {
  const candidatePaths = [path.join(process.cwd(), relativeFilePath), path.resolve(relativeFilePath)];
  const sqlPath = candidatePaths.find((candidatePath) => fs.existsSync(candidatePath));

  if (!sqlPath) {
    if (required) {
      throw new Error(`Missing project SQL seed: ${relativeFilePath}`);
    }

    return '';
  }

  return fs.readFileSync(sqlPath, 'utf8');
}

function buildImage({
  imageSrc,
  imageAlt,
  imageLabel,
  imageAccent,
}: {
  imageSrc?: string;
  imageAlt?: string;
  imageLabel?: string;
  imageAccent?: string;
}): Partial<ProjectImage> {
  return {
    ...(imageSrc ? { src: imageSrc } : {}),
    ...(imageAlt ? { alt: imageAlt } : {}),
    ...(imageLabel ? { label: imageLabel } : {}),
    ...(imageAccent ? { accent: imageAccent } : {}),
  };
}

function matchInsertValues(sql: string, tableName: string): string[] {
  const insertPattern = new RegExp(
    `INSERT\\s+INTO\\s+${tableName}\\s*\\([^)]*\\)\\s+VALUES\\s*\\(([\\s\\S]*?)\\);`,
    'g',
  );
  const values: string[] = [];

  for (const match of sql.matchAll(insertPattern)) {
    values.push(match[1]);
  }

  return values;
}

function parseSqlValues(values: string): SqlValue[] {
  const parsed: SqlValue[] = [];
  let token = '';
  let inString = false;

  for (let index = 0; index < values.length; index += 1) {
    const character = values[index];
    const nextCharacter = values[index + 1];

    if (inString) {
      if (character === "'" && nextCharacter === "'") {
        token += "'";
        index += 1;
        continue;
      }

      if (character === "'") {
        inString = false;
        continue;
      }

      token += character;
      continue;
    }

    if (character === "'") {
      inString = true;
      continue;
    }

    if (character === ',') {
      parsed.push(parseSqlToken(token));
      token = '';
      continue;
    }

    token += character;
  }

  parsed.push(parseSqlToken(token));

  return parsed;
}

function parseSqlToken(token: string): SqlValue {
  const trimmed = token.trim();

  if (!trimmed || trimmed.toUpperCase() === 'NULL') {
    return null;
  }

  const numericValue = Number(trimmed);

  if (Number.isFinite(numericValue)) {
    return numericValue;
  }

  return trimmed;
}

function asString(value: SqlValue): string {
  if (typeof value === 'string') {
    return value;
  }

  if (typeof value === 'number') {
    return String(value);
  }

  return '';
}

function asOptionalString(value: SqlValue): string | undefined {
  const stringValue = asString(value).trim();

  return stringValue || undefined;
}

function asNumber(value: SqlValue): number {
  if (typeof value === 'number') {
    return value;
  }

  const numberValue = Number(value);

  return Number.isFinite(numberValue) ? numberValue : 0;
}

function slugify(value: string): string {
  return value
    .toLowerCase()
    .replace(/&/g, 'and')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');
}
