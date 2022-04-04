# entr
# /home/darren/sphinx.public/Makefile

O:=builddir
I=index.tex

default: clean entr

clean:
	rm $(O)/*.{aux,log,pdf}

entr:
	entr <<<$(I) $(MAKE) pdf

pdf: $(I)
	xelatex --output-directory=$(O) $<
