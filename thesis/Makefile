all: thesis.pdf

thesis.pdf:
	# run pdflatex, then makeglossaries, then run pdflatex again
	# to include the generated glossary
	pdflatex thesis.tex
	makeglossaries thesis
	pdflatex thesis.tex

clean:
	git clean -f -x; rm thesis.pdf
.PHONY: clean