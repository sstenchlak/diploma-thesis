export TEXINPUTS=../tex//:
VERSION:=#empty, use make VERSION=x.y.z to override

all: thesis.pdf #abstract.pdf

# LaTeX must be run multiple times to get references right
thesis.pdf: thesis.tex $(wildcard *.tex) $(wildcard chapters/*.tex) bibliography.bib thesis.xmpdata
	pdflatex "\def\version{$(VERSION)}\input{$<}"
	bibtex thesis
	pdflatex "\def\version{$(VERSION)}\input{$<}"
	pdflatex "\def\version{$(VERSION)}\input{$<}"

abstract.pdf: abstract.tex abstract.xmpdata
	pdflatex $<

clean:
	rm -f *.log *.dvi *.aux *.toc *.lof *.lot *.out *.bbl *.blg *.xmpi
	rm -f thesis.pdf abstract.pdf
