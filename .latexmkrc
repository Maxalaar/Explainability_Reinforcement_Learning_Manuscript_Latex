#!/usr/bin/env perl
# Default build settings so that `latexmk manuscript.tex` (with no extra
# flags) always compiles with lualatex and never stops to wait for
# keyboard input on a warning or error.
$pdf_mode = 4;              # lualatex
$lualatex = 'lualatex -interaction=nonstopmode -synctex=1 %O %S';
$pdflatex = $lualatex;
