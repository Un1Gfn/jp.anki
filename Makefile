# entr
# /home/darren/sphinx.public/Makefile

O:=builddir

default: clean entr

clean:
	rm -f $(O)/*.{aux,dvi,eps,log,pdf}
	rm -f *.ltjruby

entr:
	ls -1 *.tex *.sty | entr $(MAKE) pdf

pdf:
# 	これは 振り仮名.ふりがな である	 これは\ltjruby{振り仮名}{ふりがな}である
# 	これは 振り仮名.ふり[が]な である	 これは\ltjruby{振り仮名}{ふり\bc{が}な}である
#	https://ja.stackoverflow.com/questions/29179/sed-%E3%81%A7-%E3%81%82-%E3%82%9E-%E3%81%AE%E3%82%88%E3%81%86%E3%81%AA%E6%97%A5%E6%9C%AC%E8%AA%9E%E3%81%AE%E6%96%87%E5%AD%97%E7%AF%84%E5%9B%B2%E3%82%92%E4%BD%BF%E3%81%84%E3%81%9F%E3%81%84
	for i in anki????????.tex; do \
		env LANG=en_US.UTF-8 sed -i -E \
			-e 's,'``'(^|[[:space:]])'``'([^[:space:]]+)\.([あ-ゞ・]*)\[([あ-ゞ・]+)\]([あ-ゞ・]*)'``'([[:space:]]|$$)'``',\\ltjruby{\2}{\3\\bc{\4}\5},g' \
			-e 's,'``'(^|[[:space:]])'``'([あ-ゞ・]*)\[([あ-ゞ・]+)\]([あ-ゞ・]*)\.([^[:space:]]+)'``'([[:space:]]|$$)'``',\\ltjruby{\2\\bc{\3}\4}{\5},g' \
			-e 's,'``'(^|[[:space:]])'``'([^[:space:]]+)\.([あ-ゞ・]+)'``'([[:space:]]|$$)'``',\\ltjruby{\2}{\3},g' \
			-e 's,'``'(^|[[:space:]])'``'([あ-ゞ・]+)\.([^[:space:]]+)'``'([[:space:]]|$$)'``',\\ltjruby{\2}{\3},g' \
			$$i; \
	done
# 	lualatex -halt-on-error -interaction=nonstopmode -output-directory=$(O) $<
# 	ln -sfv /usr/bin/luajittex /tmp/luajitlatex
	lualatex -halt-on-error -interaction=nonstopmode -output-directory=$(O) index.tex
