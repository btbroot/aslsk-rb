#!/usr/bin/make -f

GEN_CMD = pandoc $^ --output=$@ \
    --standalone \
    --table-of-contents \
    --number-sections \
    --latex-engine=xelatex \
    --variable mainfont:"Linux Libertine O" \
    --variable papersize:a4 \
    --variable lof:1 \
    --variable lang:ru

OUTPUT = aslsk-rb.html aslsk-rb.pdf

all: ${OUTPUT}

%.html: %.md
	${GEN_CMD}

%.pdf: %.md
	${GEN_CMD}

clean:
	${RM} ${OUTPUT}

.PHONY: clean
