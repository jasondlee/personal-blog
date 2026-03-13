# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal blog built with **Quarkus Roq**, a static site generator for Quarkus. The site is written in Java 17, uses AsciiDoc for content, Qute for templating, and is deployed to GitHub Pages.

## Development Commands

### Running the Development Server
```bash
./mvnw quarkus:dev
```
This starts Quarkus in dev mode with live reload. The site will be available at `http://localhost:8080`.

### Building the Site
```bash
./mvnw clean package
```
Generates the static site in `target/roq/`.

### Running Tests
```bash
./mvnw test
```
The test suite validates that all pages can be generated successfully using the `@RoqAndRoll` annotation.

### Deploying
Deployment happens automatically via GitHub Actions when changes are pushed to the `master` branch. The workflow builds the site and deploys to the `gh-pages` branch.

## Project Structure

### Content Organization
- **`content/posts/YYYY/`** - Blog posts organized by year, each in its own directory with an `index.adoc` file
- **`content/`** - Site root pages (presentations, projects, etc.)
- **`public/`** - Static assets (images, PDFs, presentations)
- **`data/*.yml`** - YAML data files consumed by Java records (links, publications, whatido, whatiuse)

### Templates
- **`templates/layouts/`** - Page layouts using Qute templating
  - `base2.html` - Main site layout with navigation and footer
  - `post.html` - Blog post layout
  - `tag.html` - Tag listing layout
- **`templates/partials/`** - Reusable template fragments (share-page, pagination, about)

### Java Code
- **`src/main/java/ee/jasondl/blog/`**
  - `Extensions.java` - Qute template extensions (date formatting, HTML processing, excerpts)
  - `Links.java`, `Publications.java`, `WhatIUse.java` - `@DataMapping` records for YAML data files
- **`src/main/resources/web/app/`** - JavaScript and CSS bundled via quarkus-web-bundler
- **`src/main/resources/application.properties`** - Quarkus configuration (site URL, timezone, AsciiDoc settings)

### Configuration
- **`config/application.properties`** - Override for local development (sets site.url to localhost)
- **`pom.xml`** - Maven dependencies including Quarkus Roq plugins (asciidoc-jruby, aliases, sitemap, lunr, series)

## Blog Post Format

Posts use AsciiDoc with YAML frontmatter:
```yaml
---
title: "Post Title"
date: 2025-01-15
tags: [Java, Quarkus]
type: post
link: /:year/:slug
status: published
image: optional-image.jpg
---
```

Posts can be part of a series using the `series` and `seriesOrder` frontmatter fields (handled by quarkus-roq-plugin-series).

## Template Extensions

Custom template extensions in `Extensions.java`:
- `{date.format("EEEE, MMM d, YYYY")}` - Format dates
- `{post.excerpt(150)}` - Generate post excerpts with word limit
- `{html.removeToc()}` - Strip table of contents from HTML
- `{page.homePageLink("#section")}` - Generate links that work on both home and detail pages

## Data Mappings

YAML files in `data/` are automatically mapped to Java records via `@DataMapping`:
- `links.yml` → `Links` record (list of title/link pairs)
- `publications.yml` → `Publications` record (list of publications with title/link/text)
- `whatiuse.yml` → `WhatIUse` record
- `whatido.yml` - Similar pattern (no Java class visible but likely exists)

Access in templates with: `{global:links.list}`, `{global:publications.list}`, etc.

## Styling

The project uses Tailwind CSS classes directly in templates. The `quarkus-web-bundler` handles JavaScript bundling and CSS processing. Custom styles are inline in `base2.html` for animations and component-specific styling.

## GitHub Actions Workflow

`.github/workflows/deploy.yml` runs on push to `master`:
1. Checks out code
2. Generates static site using `quarkiverse/quarkus-roq@v1` action
3. Deploys to GitHub Pages (requires `pages: write` and `id-token: write` permissions)

The `gh-pages` branch is the deployment target (not `master`).

## Roq Plugins

The site uses several Roq plugins (configured in pom.xml):
- **asciidoc-jruby** - AsciiDoc rendering
- **aliases** - URL alias support
- **sitemap** - Automatic sitemap generation
- **lunr** - Search index generation
- **series** - Blog post series support

## Key Dependencies

- **Quarkus Platform**: 3.31.2
- **Quarkus Roq**: 2.1.0.BETA2
- **Quarkus Web Bundler**: 2.2.1
- **Java**: 17
- **highlight.js**: 11.11.1 (for code syntax highlighting)
