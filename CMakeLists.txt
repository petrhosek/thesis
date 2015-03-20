project(thesis NONE)
cmake_minimum_required(VERSION 2.8)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")
find_file(USELATEX_FILE UseLATEX.cmake
  PATHS ${CMAKE_MODULE_PATH}
  )
include(${USELATEX_FILE})

set(PDFLATEX_COMPILER lualatex)
set(BIBTEX_COMPILER biber)

set(INPUT_FILES
  applications/applications.tex
  applications/honeypot.tex
  applications/record.tex
  applications/sanitization.tex
  conclusion/conclusion.tex
  efficient-execution/applications.tex
  efficient-execution/c10k.tex
  efficient-execution/comparison.tex
  efficient-execution/discussion.tex
  efficient-execution/efficient-execution.tex
  efficient-execution/evaluation.tex
  efficient-execution/microbenchmarks.tex
  efficient-execution/overview.tex
  efficient-execution/prototype.tex
  efficient-execution/results.tex
  efficient-execution/summary.tex
  evolution/coverage.tex
  evolution/design.tex
  evolution/discussion.tex
  evolution/evolution.tex
  evolution/external.tex
  evolution/results/beanstalkd-nondet.tex
  evolution/results/beanstalkd.tex
  evolution/results/binutils-nondet.tex
  evolution/results/binutils.tex
  evolution/results/git-nondet.tex
  evolution/results/git.tex
  evolution/results/lighttpd1.4-nondet.tex
  evolution/results/lighttpd1.4.tex
  evolution/results/lighttpd2-nondet.tex
  evolution/results/lighttpd2.tex
  evolution/results/memcached-bf.tex
  evolution/results/memcached-nondet.tex
  evolution/results/memcached.tex
  evolution/results/redis-bf.tex
  evolution/results/redis-nondet.tex
  evolution/results/redis.tex
  evolution/results/vim.tex
  evolution/results/zeromq-bf.tex
  evolution/results/zeromq-nondet.tex
  evolution/results/zeromq.tex
  evolution/results.tex
  evolution/rqs.tex
  evolution/study.tex
  evolution/summary.tex
  evolution/test.tex
  evolution/threaths.tex
  multi-version/multi-version.tex
  multi-version/rationale.tex
  multi-version/scenarios.tex
  multi-version/scope.tex
  multi-version/summary.tex
  overview/overview.tex
  related/evolution.tex
  related/fault.tex
  related/nvp.tex
  related/record.tex
  related/related.tex
  related/sandboxing.tex
  related/updates.tex
  safe-updates/coreutils.tex
  safe-updates/discussion.tex
  safe-updates/evaluation.tex
  safe-updates/example.tex
  safe-updates/lighttpd.tex
  safe-updates/prototype.tex
  safe-updates/redis.tex
  safe-updates/results.tex
  safe-updates/safe-updates.tex
  safe-updates/summary.tex
  )

set(STYLE_FILES
  thesis.cls
  )

#foreach(file ${STYLE_FILES})
#  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/include/${file}
#    ${CMAKE_CURRENT_BINARY_DIR}/${file} COPYONLY)
#endforeach()

#set(FIG_DIRS
#  figures
#  resources
#  )

set(FIG_FILES
  applications/figures/honeypot.pdf
  applications/figures/live-sanitization.pdf
  efficient-execution/figures/address-space.pdf
  efficient-execution/figures/architecture.pdf
  efficient-execution/figures/multithreading.pdf
  evolution/figures/pipeline.pdf
  multi-version/figures/failover.pdf
  multi-version/figures/failrecovery.pdf
  multi-version/figures/platform.pdf
  safe-updates/figures/architecture.pdf
  safe-updates/figures/strategy.pdf
  )

set(PLOT_FILES
  efficient-execution/graphs/c10k.plot
  efficient-execution/graphs/comparison.plot
  efficient-execution/graphs/macro.plot
  efficient-execution/graphs/micro.plot
  efficient-execution/graphs/spec2000.plot
  efficient-execution/graphs/spec2006.plot
  evolution/graphs/analysis.plot
  evolution/graphs/coverage.plot
  evolution/graphs/eloc.plot
  evolution/graphs/eloctloc.plot
  evolution/graphs/patchcoverage.plot
  evolution/graphs/patchtype.plot
  evolution/graphs/tloc.plot
  evolution/graphs/trace.plot
  safe-updates/graphs/spec2006.plot
  safe-updates/graphs/syscall.plot
  )

latex_get_output_path(output_dir)
foreach(file ${PLOT_FILES})
  string(REPLACE ".plot" "" file_name ${file})
  set(file_name "${file_name}.pdf")
  set(gnuplot_args -e 'filename="${CMAKE_CURRENT_BINARY_DIR}/${file_name}"')
  list(APPEND gnuplot_args ${CMAKE_CURRENT_SOURCE_DIR}/${file})
  GET_FILENAME_COMPONENT(indir ${CMAKE_CURRENT_SOURCE_DIR}/${file_name} DIRECTORY)
  GET_FILENAME_COMPONENT(outdir ${CMAKE_CURRENT_BINARY_DIR}/${file_name} DIRECTORY)
  add_custom_command(OUTPUT ${output_dir}/${file_name}
    COMMAND ${CMAKE_COMMAND} -E make_directory ${outdir}
    COMMAND gnuplot ${gnuplot_args}
    WORKING_DIRECTORY ${indir}
    )
  list(APPEND PDF_FILES ${CMAKE_CURRENT_BINARY_DIR}/${file_name})
  #list(APPEND FIG_FILES ${CMAKE_CURRENT_BINARY_DIR}/${file_name})
endforeach()

add_custom_target(plots
  DEPENDS ${PDF_FILES})

set(BIB_FILES
  bibliography/cadar-crossrefs.bib
  bibliography/cadar-macros.bib
  bibliography/cadar.bib
  )

add_latex_document(
  thesis.tex
  INPUTS ${INPUT_FILES}
  IMAGES ${FIG_FILES}
  BIBFILES ${BIB_FILES}
  DEFAULT_PDF
  )
