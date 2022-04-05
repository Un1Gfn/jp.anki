# entr
# /home/darren/sphinx.public/Makefile

O:=builddir
I=index.tex

default: clean entr

clean:
	rm -f $(O)/*.{aux,log,pdf}

entr:
	ls -1 *.tex *.sty | entr $(MAKE) pdf

pdf: $(I)
	xelatex -halt-on-error -interaction=nonstopmode -output-directory=$(O) $<
