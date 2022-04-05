# entr
# /home/darren/sphinx.public/Makefile

O:=builddir
I=index.tex

# TEX:=xelatex
# TEX:=platex
TEX:=uplatex

default: clean entr

clean:
	rm -f $(O)/*.{aux,dvi,eps,log,pdf}

entr:
	ls -1 *.tex *.sty | entr $(MAKE) pdf

pdf: $(I)
	$(TEX) -halt-on-error -interaction=nonstopmode -output-directory=$(O) $<
# 	ptex2pdf -u -l -ot '-synctex=1' -od '-f uptex-ipaex.map' $(I)
