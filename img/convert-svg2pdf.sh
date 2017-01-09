#!/bin/bash
for i in $(ls *.svg); do
	x=$(echo "$i"|cut -d"." -f1)
	rsvg-convert -f pdf -o "${x}.pdf" "${x}.svg"
#	rsvg-convert -f png -o "${x}.png" "${x}.svg"
done
for i in $(ls *.tex); do
	pdflatex "${i}" && pdflatex "${i}"
done
rm -f *.aux *.log
