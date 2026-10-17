# Portfolio

Static site in `site/`. Plain HTML, CSS and a little JS, no build step.

## Updating

| To add | Edit | Copy an existing |
| --- | --- | --- |
| A certificate | `site/index.html`, "Certificates" table | `<tr>` row. Link to the Credly badge, or drop the PDF in `site/assets/` |
| Something you're doing now | `site/index.html`, "Currently" list | `<li>` |
| A job | `site/index.html`, "Work" table | `<tr>` row |
| A new CV | Replace `site/assets/Mercy-Robert-CV.pdf` | Keep the filename so the link still works |
| A case study | New file in `site/systems/` | Any existing case study page, then add a row to "01 / Systems" and fix the ← → links |

Newest items go first in each table.

## Preview

```
cd site && python3 -m http.server 8000
```

Then open http://localhost:8000.
