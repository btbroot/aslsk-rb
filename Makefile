#!/usr/bin/make -f

# texlive-base/stretch breaks on "ru". Debian bug #672742.
GEN_LANG = ru

GEN_CMD = pandoc $^ --output=$@ \
    --standalone \
    --table-of-contents \
    --number-sections \
    --latex-engine=xelatex \
    --variable papersize:a4 \
    --variable lof:1 \
    --variable mainfont:'LiberationSerif' \
    --variable lang:${GEN_LANG}

OUTPUT = aslsk-rb.html aslsk-rb.pdf

all: ${OUTPUT}

%.html: %.md
	${GEN_CMD}

%.pdf: %.md
	${GEN_CMD}

clean:
	${RM} ${OUTPUT}

.PHONY: clean
