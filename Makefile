#!/usr/bin/make -f

GEN_CMD = pandoc $^ --output=$@ --standalone --table-of-contents --number-sections

OUTPUT = aslsk-rb.html aslsk-rb.pdf

all: ${OUTPUT}

%.html: %.md
	${GEN_CMD}

%.pdf: %.md
	${GEN_CMD} \
	    --latex-engine=xelatex -V mainfont="Linux Libertine O"

clean:
	${RM} ${OUTPUT}

.PHONY: clean
