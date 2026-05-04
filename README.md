# Yangyi Wu Academic Homepage

This repository hosts the bilingual academic homepage for Yangyi Wu (伍杨屹):

<https://yangyi-wu.github.io/>

The site is based on Jekyll and AcademicPages, with English pages at the root paths and Chinese pages under `/zh/`.

## Main Pages

- English: `/`, `/publications/`, `/talks/`, `/teaching/`, `/cv/`
- 中文: `/zh/`, `/zh/publications/`, `/zh/talks/`, `/zh/teaching/`, `/zh/cv/`

The site detects the browser language on first visit. Chinese browsers are redirected from English entry pages to the matching `/zh/` page. Manual language choices are stored in `localStorage` and take priority over automatic detection.

## Deployment

The repository includes a GitHub Actions workflow at `.github/workflows/pages.yml`.

- Pull requests to `master` run a Jekyll build check.
- Pushes to `master` build and deploy the site to GitHub Pages.
- The workflow can also be triggered manually from the GitHub Actions tab.

In GitHub repository settings, set:

1. `Settings` -> `Pages`
2. `Build and deployment`
3. `Source`: `GitHub Actions`

## Local Preview

Install Ruby and Bundler, then run:

```bash
bundle install
bundle exec jekyll serve -l -H localhost
```

The local site will be available at:

```text
http://localhost:4000
```

### Windows Notes

This workspace has been tested with a portable Ruby at:

```text
%LOCALAPPDATA%\Ruby32-x64
```

Use the helper scripts to keep Ruby gems out of non-ASCII project paths:

```powershell
.\scripts\jekyll-build.ps1
.\scripts\jekyll-serve.ps1
```

If PowerShell script execution is restricted, use the `.cmd` wrappers:

```powershell
.\scripts\jekyll-build.cmd
.\scripts\jekyll-serve.cmd
```

The scripts install gems into `%LOCALAPPDATA%\Ruby32-x64\bundle\Yangyi-Wu.github.io` and then run Jekyll.

For a lightweight static preview after building, use Python to serve the generated `_site` directory:

```powershell
.\scripts\preview-static.cmd
```

In Codex, this script automatically uses the bundled Python runtime when system Python is not on `PATH`.

## Content Editing

- Site-wide settings: `_config.yml`
- Navigation: `_data/navigation.yml`
- English pages: `_pages/about.md`, `_pages/publications.html`, `_pages/talks.html`, `_pages/teaching.html`, `_pages/cv.md`
- Chinese pages: `_pages/zh-about.md`, `_pages/zh-publications.md`, `_pages/zh-talks.md`, `_pages/zh-teaching.md`, `_pages/zh-cv.md`
- Publications: `_publications/`
- Talks and sessions: `_talks/`
- Teaching and supervision: `_teaching/`
- Structured CV data: `_data/cv.json`
