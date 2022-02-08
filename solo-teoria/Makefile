
# Sources
SOURCES_TEX = $(wildcard src/*.tex)
SOURCES_LESSONS_TEX = $(wildcard src/lessons/*.tex)
SOURCES_FIGURES = $(wildcard src/figures/*.svg)

# Cache
CACHE_TEX = $(patsubst src/%, .cache/%, $(SOURCES_TEX))
CACHE_LESSONS_TEX = $(patsubst src/%, .cache/%, $(SOURCES_LESSONS_TEX))
CACHE_FIGURES = $(patsubst src/%, .cache/%, $(SOURCES_FIGURES))
CACHE_FIGURES_PDF = $(patsubst .cache/figures/%.svg, .cache/figures/.pdf_tex/%.pdf, $(CACHE_FIGURES))
CACHE_FIGURES_PDF_TEX = $(patsubst .cache/figures/%.svg, .cache/figures/.pdf_tex/%.pdf_tex, $(CACHE_FIGURES))

.PHONY: all clean setup

#
# Regole principali
#

# Copies the main target back from cache
main.pdf: .cache/main.pdf
	cp .cache/main.pdf main.pdf

# Regola di compilazione del LaTeX
.cache/main.pdf: $(CACHE_TEX) $(CACHE_LESSONS_TEX) $(CACHE_FIGURES_PDF)
	cd .cache; pdflatex -halt-on-error main.tex

# Copia solo i sorgenti modificati (-c su rsync controlla le checksum dei file)
.cache/main.tex: $(SOURCES_TEX) $(SOURCES_LESSONS_TEX) $(SOURCES_FIGURES)
	rsync -rcp src/ .cache/

# Converte SVG di Inkscape in coppie di ".pdf" e ".pdf_tex"
.cache/figures/.pdf_tex/%.pdf: .cache/figures/%.svg
	inkscape --export-latex -C $< -o $@

#
# Regole di utility
#

all: setup main.pdf

# Da eseguire dopo un clone/clean
setup:
	mkdir -p .cache
	mkdir -p .cache/figures/.pdf_tex

# Solita regola di pulizia
clean:
	rm -rf .cache
	rm -f main.pdf

# Printa le variabili per debuggare
debug:
	@echo -e "Source files:"
	@echo -e "SOURCES_TEX = $(SOURCES_TEX)"
	@echo -e "SOURCES_LESSONS_TEX = $(SOURCES_LESSONS_TEX)"
	@echo -e "SOURCES_FIGURES = $(SOURCES_FIGURES)"
	@echo -e "Cache files:"
	@echo -e "CACHE_TEX = $(CACHE_TEX)"
	@echo -e "CACHE_LESSONS_TEX = $(CACHE_LESSONS_TEX)"
	@echo -e "Figure cache files:"	
	@echo -e "CACHE_FIGURES = $(CACHE_FIGURES)"
	@echo -e "CACHE_FIGURES_PDF = $(CACHE_FIGURES_PDF)"
	@echo -e "CACHE_FIGURES_PDF_TEX = $(CACHE_FIGURES_PDF_TEX)"



