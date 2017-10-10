.PHONY: all view-dvi

all: tex view-dvi

tex:
	latex resume.tex

view-dvi:
	xdvi resume.dvi &
