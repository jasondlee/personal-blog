# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal blog built with **Quarkus Roq** (a Quarkus-based static site generator). Content is written in AsciiDoc, templates use Qute, and the site deploys to GitHub Pages.

## Development Commands

```bash
./mvnw quarkus:dev          # Dev server at http://localhost:8080 (live reload)
./mvnw clean package        # Build static site → target/roq/
./mvnw test                 # Run tests (validates all pages generate successfully)
```

There is no linter or type-checker beyond Maven compilation. The project has no `eslint`, `tsc`, or equivalent configured.

**Maven profiles:**
- `-Psnapshot` — uses `999-SNAPSHOT` Roq version for testing unreleased Roq changes
- `-Pnative` — enables GraalVM native image build

## Architecture

### Content → Template → Static Site Pipeline

1. **Content** (`content/posts/YYYY/<slug>/index.adoc`) — AsciiDoc posts with YAML frontmatter
2. **Data** (`data/*.yml`) — structured data mapped to Java records via `@DataMapping`
3. **Templates** (`templates/`) — Qute templates render content + data into HTML
4. **Extensions** (`src/main/java/ee/jasondl/blog/Extensions.java`) — custom Qute template methods
5. **Static output** — Roq generates the final site to `target/roq/`

### Blog Post Frontmatter

```yaml
---
title: "Post Title"
date: 2025-01-15
tags: [Java, Quarkus]
type: post
link: /:year/:slug
status: published
image: optional-image.jpg
series: "Optional Series Name"
seriesOrder: 1
---
```

Posts live in `content/posts/YYYY/<slug>/index.adoc`. Images referenced by `image:` go in the same directory.

### Data Mappings (`data/*.yml` → Java Records)

YAML files in `data/` are mapped to Java records annotated with `@DataMapping`:

| File | Record | Template access |
|------|--------|-----------------|
| `links.yml` | `Links(List<Link> list)` | `{global:links.list}` |
| `publications.yml` | `Publications(List<Publication> list)` | `{global:publications.list}` |
| `whatiuse.yml` | `WhatIUse(List<Tech> techs)` | `{global:whatiuse.techs}` |
| `whatido.yml` | accessed directly in template | `{global:whatido.items}` |

### Template Extensions (`Extensions.java`)

Static methods available in all Qute templates:

- `{date.format("EEEE, MMM d, YYYY")}` — format dates via `SimpleDateFormat`
- `{html.removeToc()}` — strip `<div id="toc">` from rendered HTML (uses jsoup)
- `{post.excerpt(150)}` — word-limited plain-text excerpt from post content; has retry logic for a race condition where `content()` can return empty
- `{page.homePageLink("#section")}` — generates `#section` on home page, `/path#section` on other pages

### Template Layouts

- `base.html` — main site layout (nav, footer, SEO meta, GA4 analytics, jQuery, highlight.js)
- `post.html` — blog post layout (extends `base`); URL pattern `/:year/:month/:day/:slug`
- `tag.html` — tag listing with pagination
- `none.html` — raw content passthrough (no layout wrapper)
- `redhat.ftl` — FreeMarker template generating an Atom XML feed filtered to Red Hat-related technologies

### Tests

The single test class (`RoqSiteTest.java`) uses `@QuarkusTest` + `@RoqAndRoll`. The test method body is empty — the `@RoqAndRoll` annotation itself triggers full site generation during test setup, which validates that all pages render without errors.

### Styling

Tailwind CSS via `quarkus-web-bundler-tailwindcss`. Custom styles are split across:
- `src/main/resources/web/app/new.css` — series, code blocks, TOC
- `src/main/resources/web/app/navigation.css` — sticky nav, mobile menu, animations
- `src/main/resources/web/app/includes/main.css` — Tailwind config, typography
- `src/main/resources/web/app/includes/colors.css` — color utility classes

### Deployment

GitHub Actions (`.github/workflows/deploy.yml`) triggers on push to `master` or manual dispatch. Uses `quarkiverse/quarkus-roq@v1` action to build, then deploys to GitHub Pages. The `gh-pages` branch is the deployment target.

### Configuration

- `src/main/resources/application.properties` — production config (site URL, timezone, AsciiDoc settings)
- `config/application.properties` — local dev override (sets `site.url=http://localhost:8080`)

## Key Dependencies

- **Java**: 21
- **Quarkus Platform**: 3.35.1
- **Quarkus Roq**: 2.1.1
- **Quarkus Web Bundler**: 2.3.1
- **jsoup**: 1.22.1 (HTML manipulation in Extensions.java)
- **highlight.js**: 11.11.1 (code syntax highlighting)

## Roq Plugins (configured in pom.xml)

- **asciidoc-jruby** — AsciiDoc rendering
- **aliases** — URL alias/redirect support
- **sitemap** — automatic sitemap.xml generation
- **lunr** — client-side search index generation
- **series** — blog post series grouping via `series`/`seriesOrder` frontmatter
