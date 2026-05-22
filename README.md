# Deep Learning & Latent Space Manuscript



## 📁 Project Structure

The manuscript is organized as follows:

* `manuscript.tex`
  Main entry point of the document.

* `packages.tex`
  All LaTeX packages and dependencies.

* `setup.tex`
  Glossary definitions, global configuration, and figure includes.


## ⚙️ Dependencies

To compile this project, install a full LaTeX distribution with LuaLaTeX support:

```bash
sudo apt install texlive-luatex texlive-fonts-recommended texlive-fonts-extra fonts-lmodern
```

---

## 🛠️ Compilation

Compile the document using **LuaLaTeX**:

```bash
lualatex manuscript.tex
bibtex manuscript
lualatex manuscript.tex
lualatex manuscript.tex
```

Glossary generation (if needed):

```bash
makeglossaries manuscript
```
