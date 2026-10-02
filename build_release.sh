#!/usr/bin/env bash
# Compiles the two PDFs to send: the screen version (Computer) and the
# recto-verso version (Print), each in its own build/ folder, then copies them
# into release/. The Computer version also replaces the versioned
# manuscript.pdf at the repo root. Draft switches are forced off (see the
# release block in manuscript.tex). Run from anywhere.
set -euo pipefail
cd "$(dirname "$0")"
name="Maxime_Alaarabiou_Mechanistic_Explainability_in_Reinforcement_Learning"

build() {  # $1 = suffix, $2 = definitions read before manuscript.tex
  latexmk -outdir="build/$1" -jobname="${name}_$1" \
    -usepretex="$2" manuscript.tex
}

build Computer '\def\releasebuild{}'
build Print '\def\releasebuild{}\def\releaseprint{}'

mkdir -p release
cp "build/Computer/${name}_Computer.pdf" "build/Print/${name}_Print.pdf" release/
cp "build/Computer/${name}_Computer.pdf" manuscript.pdf
echo "Built release/${name}_Computer.pdf and release/${name}_Print.pdf"
