# Reliable Professional Services

The site is built with [Hugo](https://gohugo.io/). Edit a text file, then compile.

## Commands

From this folder:

```
hugo server
```

Opens a local preview. Hugo rebuilds when you save a file.

```
hugo
```

Writes the finished site into `public/`. Publish that folder.

## Where to edit

- A landing page is one Markdown file in `content/`, for example `content/process-server-charlotte-nc.md`. The title, description, hero heading, and intro are at the top of the file. The paragraphs below that are the unique section.
- The homepage is `content/_index.md`.
- Phone, email, PayPal, navigation, and the directory of pages are in `data/site.yaml`.
- Colors and layout rules for every page are in `assets/css/site.css`. The colors at the top (`--navy`, `--ink`, `--copper`, `--light`) apply across the site.
- The header, footer, contact form, and review invitation are in `layouts/partials/`.
