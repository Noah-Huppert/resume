.PHONY: resume view-resume.dvi close-view-resume.dvi \
	view-resume.pdf close-view-resume.pdf \
	spell spell-resume.tex spell-md

# Resume
resume: resume.dvi view-resume.dvi

# resume.dvi - build
clean-resume.dvi:
	rm resume.dvi || true

resume.dvi: clean-resume.dvi
	latex resume.tex

# resume.dvi - view
close-view-resume.dvi:
	scripts/close-view-resume.sh .dvi

view-resume.dvi: resume.dvi close-view-resume.dvi
	scripts/view-resume.sh .dvi

# resume.pdf - build
clean-resume.pdf:
	rm resume.pdf || true

resume.pdf: clean-resume.pdf resume.dvi
	dvipdfm resume.dvi

# resume.pdf - view
close-view-resume.pdf:
	scripts/close-view-resume.sh .pdf

view-resume.pdf: resume.pdf close-view-resume.pdf
	scripts/view-resume.sh .pdf

# Spelling
# The SPELL_EXTRAS variable can be set by the target caller to specify additional 
# aspell arguments
SPELL_ARGS=--extra-dicts="./technical-words.aspell.en.pws" ${SPELL_EXTRAS}
spell: spell-resume.tex spell-md
spell-resume.tex:
	aspell -t --add-tex-command="setitemize op" ${SPELL_ARGS} -c resume.tex

spell-md:
	aspell ${SPELL_ARGS} -c *.md
