#!/bin/bash
# brew install gpp
# brew install pandoc
# brew cask install basictex
mkdir -p target
cp photo.jpg target
gpp -H -Dlanguage=english -n -o README.md src/cv.md

OUTPUTNAME="target/michel de bree-cv"
pandoc -s --smart --reference-docx=src/reference.docx -o "$OUTPUTNAME-en.docx" README.md 
# pandoc -s --smart --to=odt -o "$OUTPUTNAME-en.odt" README.md 
# pandoc -s -o "$OUTPUTNAME-en.html" README.md 
# pandoc -s --smart -o "$OUTPUTNAME-en.pdf" README.md 
# pandoc -s --smart --to=epub -o "$OUTPUTNAME-en.epub" README.md 
# pandoc -s --to=plain -o "$OUTPUTNAME-en.txt" README.md 
