TARGETS := thesis.pdf
DEPS := $(TARGETS:.pdf=.d)

SHELL = /bin/bash
LATEXMK = latexmk -recorder -use-make -deps \
	-e 'warn qq(In Makefile, turn off custom dependencies\n);' \
	-e '@cus_dep_list = ();' \
	-e 'show_cus_dep();'

all: $(TARGETS)

-include $(DEPS)

%.pdf: %.tex
	$(LATEXMK) -f -bibtex -pdflatex="lualatex -halt-on-error -interaction=nonstopmode -file-line-error %O %S" -pdf -dvi- -ps- -deps-out=$(patsubst %.pdf,%.d,$@) $<

%.pdf: %.plot
	$(SHELL) -c "pushd `dirname $<` > /dev/null;\
	gnuplot `basename $<`;\
	popd > /dev/null;"

.PHONY: all clean

clean:
	latexmk -CA $(TEXFILES)
