.PHONY: all clean

OUTDIR = build
PDFDIR = pdf

all: ${PDFDIR}/resume.pdf ${PDFDIR}/coverletter.pdf

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
