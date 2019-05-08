STEM=lessons-learned
CONVERT=pandoc

all : ${STEM}.html ${STEM}.pdf

${STEM}.html : ${STEM}.tex
	${CONVERT} --ascii -o $@ $<

${STEM}.pdf : ${STEM}.tex ${STEM}.bib
	pdflatex ${STEM}
	bibtex ${STEM}
	pdflatex ${STEM}
	pdflatex ${STEM}

clean :
	@rm -f ${STEM}.html ${STEM}.aux ${STEM}.log ${STEM}.out ${STEM}.pdf *~
