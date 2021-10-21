

# src/*.tex
SOURCES_TEX = $(wildcard src/*.tex)

# src/figures/*.svg
SOURCES_FIGURES = $(wildcard src/figures/*.svg)

# .cache/*.tex
CACHE_TEX = $(patsubst src/%, .cache/%, $(SOURCES_TEX))

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
.cache/main.pdf: .cache/main.tex $(CACHE_FIGURES_PDF)
	cd .cache; latexmk -pdf -halt-on-error main.tex

.cache/main.tex: $(SOURCES_TEX) $(SOURCES_FIGURES)
	cp -a src/* .cache/

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
	@echo -e "SOURCES_TEX = $(SOURCES_TEX);"
	@echo -e "SOURCES_FIGURES = $(SOURCES_FIGURES);"
	@echo -e "CACHE_TEX = $(CACHE_TEX);"
	@echo -e "CACHE_FIGURES = $(CACHE_FIGURES);"
	@echo -e "CACHE_FIGURES_PDF = $(CACHE_FIGURES_PDF);"
	@echo -e "CACHE_FIGURES_PDF_TEX = $(CACHE_FIGURES_PDF_TEX);"



