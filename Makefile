.PHONY: resume view-resume.dvi close-view-resume.dvi \
	spell spell-resume.tex spell-md

resume: resume.dvi view-resume.dvi

clean-resume.dvi:
	rm resume.dvi || true

resume.dvi: clean-resume.dvi
	latex resume.tex

close-view-resume.dvi:
	scripts/close-view-resume.sh

view-resume.dvi: close-view-resume.dvi
	scripts/view-resume.sh

resume.pdf: resume.dvi
	pdflatex resume.dvi

spell: spell-resume.tex spell-md
spell-resume.tex:
	aspell -t --add-tex-command="setitemize op" \
	       --extra-dicts="./.aspell.en.pws" \
	       -c resume.tex

spell-md:
	aspell -c *.md
