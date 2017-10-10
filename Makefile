.PHONY: spell spell-resume.tex spell-md

resume: resume.dvi
	xdvi resume.dvi &

resume.dvi:
	latex resume.tex

resume.pdf: resume.dvi
	pdflatex resume.dvi

spell: spell-resume.tex spell-md
spell-resume.tex:
	aspell -t --add-tex-command="setitemize op" \
	       --extra-dicts="./.aspell.en.pws" \
	       -c resume.tex

spell-md:
	aspell -c *.md
