#!/bin/sh

cp source/_static build/latex -rf
make latex
pwd=`pwd`
cd build/latex
tex=`ls | find *.tex`
xelatex $tex
pdf=`ls | find TheArt*.pdf`
evince $pdf &
cd "$pwd"
