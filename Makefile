

# Sources
SOURCES_TEX = $(wildcard src/*.tex)
SOURCES_LESSONS_TEX = $(wildcard src/lessons/*.tex)
SOURCES_FIGURES = $(wildcard src/figures/*.svg)

# .cache/*.tex
CACHE_TEX = $(patsubst src/%, .cache/%, $(SOURCES_TEX))
CACHE_LESSONS_TEX = $(patsubst src/%, .cache/%, $(SOURCES_LESSONS_TEX))

# .cache/figures/*.svg
CACHE_FIGURES = $(patsubst src/%, .cache/%, $(SOURCES_FIGURES))

# .cache/figures/.pdf_tex/*.pdf
CACHE_FIGURES_PDF = $(patsubst .cache/figures/%.svg, .cache/figures/.pdf_tex/%.pdf, $(CACHE_FIGURES))

# .cache/figures/.pdf_tex/*.pdf_tex
CACHE_FIGURES_PDF_TEX = $(patsubst .cache/figures/%.svg, .cache/figures/.pdf_tex/%.pdf_tex, $(CACHE_FIGURES))

.PHONY: all clean setup

#
# Regole principali
#

main.pdf: .cache/main.pdf
	cp .cache/main.pdf main.pdf

# Regola per creare il pdf principale
.cache/main.pdf: $(CACHE_TEX) $(CACHE_LESSONS_TEX) $(CACHE_FIGURES_PDF)
	cd .cache; pdflatex -halt-on-error main.tex

.cache/main.tex: $(SOURCES_TEX) $(SOURCES_LESSONS_TEX) $(SOURCES_FIGURES)
	rsync -rcp src/ .cache/

.cache/figures/.pdf_tex/%.pdf: .cache/figures/%.svg
	inkscape --export-latex -C $< -o $@

#
# Regole di utility
#

all: setup main.pdf

setup:
	mkdir -p .cache
	mkdir -p .cache/figures/.pdf_tex

clean:
	rm -rf .cache
	rm -f main.pdf

debug:
	@echo -e "SOURCES_TEX =\n  $(SOURCES_TEX)"
	@echo -e "SOURCES_FIGURES =\n  $(SOURCES_FIGURES)"
	@echo -e "CACHE_TEX =\n  $(CACHE_TEX)"
	@echo -e "CACHE_LESSONS_TEX =\n  $(CACHE_LESSONS_TEX)"
	@echo -e "CACHE_FIGURES =\n  $(CACHE_FIGURES)"
	@echo -e "CACHE_FIGURES_PDF =\n  $(CACHE_FIGURES_PDF)"
	@echo -e "CACHE_FIGURES_PDF_TEX =\n  $(CACHE_FIGURES_PDF_TEX)"



