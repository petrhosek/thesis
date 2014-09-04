SHELL = /bin/bash

TEXFILES := thesis.tex

.PHONY: all clean

all: $(TEXFILES:.tex=.pdf)

%.pdf: %.tex
	TEXMFOUTPUT=$(CURDIR) rubber -d -Wrefs -Wmisc $<

%.pdf: %.plot
	$(SHELL) -c "pushd `dirname $<` > /dev/null;\
	gnuplot `basename $<`;\
	popd > /dev/null;"

THESIS_SRCS =
THESIS_PLOTS =

THESIS_SRCS += applications/applications.tex
THESIS_SRCS += conclusion/conclusion.tex
THESIS_SRCS += efficient-execution/c10k.tex
THESIS_SRCS += efficient-execution/comparison.tex
THESIS_SRCS += efficient-execution/efficient-execution.tex
THESIS_SRCS += efficient-execution/evaluation.tex
THESIS_SRCS += efficient-execution/microbenchmarks.tex
THESIS_SRCS += efficient-execution/overview.tex
THESIS_SRCS += efficient-execution/prototype.tex
THESIS_SRCS += efficient-execution/results.tex
THESIS_SRCS += evolution/coverage.tex
THESIS_SRCS += evolution/design.tex
THESIS_SRCS += evolution/evolution.tex
THESIS_SRCS += evolution/external.tex
THESIS_SRCS += evolution/results.tex
THESIS_SRCS += evolution/results/binutils.tex
THESIS_SRCS += evolution/results/lighttpd.tex
THESIS_SRCS += evolution/results/memcached.tex
THESIS_SRCS += evolution/results/redis.tex
THESIS_SRCS += evolution/results/zeromq.tex
THESIS_SRCS += evolution/rqs.tex
THESIS_SRCS += multi-version/multi-version.tex
THESIS_SRCS += overview/overview.tex
THESIS_SRCS += related/related.tex
THESIS_SRCS += safe-updates/coreutils.tex
THESIS_SRCS += safe-updates/evaluation.tex
THESIS_SRCS += safe-updates/example.tex
THESIS_SRCS += safe-updates/lighttpd.tex
THESIS_SRCS += safe-updates/prototype.tex
THESIS_SRCS += safe-updates/redis.tex
THESIS_SRCS += safe-updates/results.tex
THESIS_SRCS += safe-updates/safe-updates.tex
THESIS_SRCS += thesis.tex

THESIS_PLOTS += efficient-execution/graphs/macro.plot
THESIS_PLOTS += efficient-execution/graphs/micro.plot
THESIS_PLOTS += efficient-execution/graphs/spec2000.plot
THESIS_PLOTS += efficient-execution/graphs/spec2006.plot
THESIS_PLOTS += evolution/graphs/coverage.plot
THESIS_PLOTS += evolution/graphs/eloc.plot
THESIS_PLOTS += evolution/graphs/eloctloc.plot
THESIS_PLOTS += evolution/graphs/lighttpd-traces.plot
THESIS_PLOTS += evolution/graphs/patchcoverage.plot
THESIS_PLOTS += evolution/graphs/patchtype.plot
THESIS_PLOTS += evolution/graphs/tloc.plot
THESIS_PLOTS += safe-updates/graphs/spec2006.plot
THESIS_PLOTS += safe-updates/graphs/syscall.plot

THESIS_GRAPHICS += $(THESIS_PLOTS:%.plot=%.pdf)

thesis.pdf: $(THESIS_SRCS) $(THESIS_GRAPHICS)

clean:
	TEXMFOUTPUT=$(CURDIR) rubber -d --clean $(TEXFILES)
	rm -f *~ *.log
