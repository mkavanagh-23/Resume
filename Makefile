.PHONY: all resume coverletter clean

OUTDIR = build
PDFDIR = pdf

all: resume coverletter

resume: ${PDFDIR}/resume.pdf 

coverletter: ${PDFDIR}/coverletter.pdf

${PDFDIR}/%.pdf: %.tex
	mkdir -p $(OUTDIR) $(PDFDIR)
	latexmk -quiet -lualatex \
		-jobname=$* \
		-outdir=$(OUTDIR) \
		$<
	cp $(OUTDIR)/$*.pdf $(PDFDIR)/

clean:
	latexmk -CA
	rm -rf build pdf
