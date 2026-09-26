# Portfolio Website (Flutter)

**Chenyu Lu's personal portfolio**, built entirely in Flutter and Dart and compiled to the web. Instead of a template, every visual effect is hand-painted on the Flutter canvas: a live starfield, a cursor-following glow that changes colour per page and animated app-bar lighting, wrapped around a projects gallery, an awards record and a skills showcase. Deployed to [chenyulu.dev](https://chenyulu.dev).

## Core Philosophy: A Portfolio That Is Itself a Project

A portfolio built with a site builder says little about the person who made it. This one is written from scratch in the same framework used for [Vera](https://veraphysics.com), so the site doubles as a demonstration of custom painting, animation and responsive layout in Flutter Web.

## Key Milestones Completed

- [x] **Custom Starfield:** A `CustomPainter` renders a field of stars with per-star position, radius and alpha, driven by a ticker for continuous animation.
- [x] **Per-Page Cursor Glow:** A pointer-tracking glow wraps every route and changes colour to match the page (teal for projects, gold for awards, deep violet for skills).
- [x] **Glow App Bar:** An animated, lit navigation bar shared across all pages.
- [x] **Projects Gallery:** Cards with image scrollers, technology tags and GitHub or live links for Vera, Pocket Pilot, this portfolio, an integrals buoyancy simulator, competitive programming and more.
- [x] **Sortable Awards Record:** Math and physics contest results, AP scores and extracurriculars, sortable by relevance or date with a "show all" toggle.
- [x] **Skills Showcase:** Animated skill cards (`flutter_animate`) with custom icons from `images/skill_icons/`.
- [x] **Downloadable Resume:** A one-click link to the resume PDF served alongside the site.
- [x] **Continuous Deployment:** Every push to `main` builds the web release and publishes it to GitHub Pages under a custom domain.

## Architecture

| Component | Description |
| --- | --- |
| `lib/main.dart` | App entry point and route table, including each route's glow colour. |
| `lib/core/models/` | Plain data models for projects, awards, skills and stars. |
| `lib/core/theme/app_theme.dart` | Colours, typography and shared styling. |
| `lib/presentation/screens/` | The four pages: home (`portfolio_screen`), projects, awards and skills. |
| `lib/presentation/widgets/home_section/` | Hero and About Me content, including the resume link. |
| `lib/presentation/widgets/projects_section/` | Project data and project cards. |
| `lib/presentation/widgets/awards_section/` | Contest results and extracurriculars. |
| `lib/presentation/widgets/skills_section/` | Skill cards and layout. |
| `lib/presentation/widgets/shared/aesthetics/` | The visual engine: animated background, starfield painter, cursor glow and glow app bar. |
| `lib/presentation/widgets/shared/` | Footer, logo, contact bar and the project image scroller. |
| `web/` | Web shell, icons, manifest and `resume.pdf`. |
| `.github/workflows/deploy.yml` | Build and GitHub Pages deployment. |

## Quick Start

### Requirements

- Flutter (stable channel, Dart 3.9.2 or newer)

### Run Locally

```bash
flutter pub get
flutter run -d chrome
```

### Build

```bash
flutter build web --release   # output in build/web
```

### Deploy

Pushing to `main` runs `.github/workflows/deploy.yml`, which builds the web release, removes Flutter's default restrictive CSP meta tag and publishes `build/web` to GitHub Pages with the `chenyulu.dev` CNAME.

### Updating Content

Projects, awards and skills are plain Dart data in their section widgets. Add an entry there and drop any images into the matching `images/` subfolder (already registered in `pubspec.yaml`).
