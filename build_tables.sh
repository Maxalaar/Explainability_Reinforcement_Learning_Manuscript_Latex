#!/usr/bin/env bash
# Compiles the appendix tables once into tables/additional_results/tables.pdf
# (plus tables_pages.tex, the label -> page map read by setup.tex).
# Run from anywhere; re-run whenever a table's data or
# tables/additional_results/cluster_k_table_core.tex changes.
set -euo pipefail
cd "$(dirname "$0")"
dir=tables/additional_results
lualatex -interaction=nonstopmode -halt-on-error -jobname=tables \
  -output-directory="$dir" "$dir/build_tables.tex"
rm -f "$dir"/tables.aux "$dir"/tables.log
echo "Built $dir/tables.pdf ($(grep -c csdef "$dir/tables_pages.tex") tables)"
