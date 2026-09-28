# Mechanistic Explainability in Reinforcement Learning — PhD Thesis



## 📁 Project Structure

The manuscript is organized as follows:

* `manuscript.tex`
  Main entry point of the document.

* `packages.tex`
  All LaTeX packages and dependencies.

* `setup/setup.tex`
  Global configuration, split by topic into the other files of `setup/`:
  `colors`, `links`, `draft`, `boxes`, `names`, `glossary`, `notation`,
  `environments`, `timeline`, `plots`, `floats`, `appendix_tables`.

* `chapters/`, `appendix/`
  One folder per chapter, holding the chapter file and one file per section.

* `figures/`, `tables/`, `algorithms/`
  One folder per chapter, holding the floats included by that chapter.

* `references/`
  Bibliography files (biblatex + biber).

### Naming rules

The names are derived mechanically from the titles, with no exception:

* A chapter folder and its main file are named after the chapter title in
  `snake_case` (e.g. "The Golem Myth" → `chapters/the_golem_myth/the_golem_myth.tex`).
* A section file is named after the section title in `snake_case`
  (e.g. "Evaluation Metrics" → `evaluation_metrics.tex`).
* Labels follow the files: `chap:<chapter folder>` and
  `sec:<chapter folder>_<section file>`.
* A figure, table or algorithm lives in the folder of the chapter that
  includes it, and its file is named after its label without the prefix
  (e.g. `fig:car_pipeline` → `figures/experiments/car_pipeline.tex`).


## ⚙️ Dependencies

To compile this project, install a full LaTeX distribution with LuaLaTeX support:

```bash
sudo apt install texlive-luatex texlive-fonts-recommended texlive-fonts-extra fonts-lmodern
```

---

## 🛠️ Compilation

Always compile with **`latexmk`**:

```bash
latexmk manuscript.tex
```

`latexmk` automatically runs LuaLaTeX, `bibtex`/biber, and `makeglossaries` as
many times as needed, in the right order, and stops on its own. A `.latexmkrc`
file at the repo root pins the engine to LuaLaTeX and forces non-interactive
mode, so this single command is always enough — no extra flags required.

⚠️ **Do not run `lualatex manuscript.tex` directly.** Without `-interaction=nonstopmode`,
LuaLaTeX stops and silently waits for keyboard input on the first warning,
which looks exactly like the terminal being frozen.

To clean up generated build files (`.aux`, `.log`, `.bbl`, ...) without
touching the PDF:

```bash
latexmk -c manuscript.tex
```

---

## 🩹 Troubleshooting: "nothing is happening" / compilation seems stuck

This almost always means **two compilations are running at the same time**
(e.g. one from a terminal and one triggered by the VSCode/VSCodium "LaTeX
Workshop" green ▶ button) and they are fighting over the same `manuscript.aux`
/ `.log` files. LaTeX Workshop's own build never truly "does nothing" either —
it just doesn't show progress in the editor.

1. **Check what is actually running:**

   ```bash
   pgrep -af "latexmk|lualatex"
   ```

   If this lists more than one `latexmk`/`lualatex` process (ignore the
   `pgrep` line itself), that's the problem.

2. **Stop everything LaTeX-related:**

   ```bash
   pkill -f "latexmk|lualatex"
   ```

   (Or click the red ■ stop button next to the green ▶ in VSCode/VSCodium if
   the stuck build is the editor's own.)

3. **If it still won't build cleanly afterwards**, the `.aux` file may have
   been left half-written by the interrupted run — clean and rebuild:

   ```bash
   latexmk -c manuscript.tex
   latexmk manuscript.tex
   ```

4. **Going forward, compile from only one place at a time**: either the
   terminal *or* the editor's build button, never both at once.
