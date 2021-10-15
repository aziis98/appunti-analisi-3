
OUTPUT_PDF = main.pdf
TEMP_DIR = .cache

.PHONY: all clean setup

all: setup $(OUTPUT_PDF)

$(OUTPUT_PDF): src/main.tex src/prelude.tex
	cp -a src/* $(TEMP_DIR)/
	cd $(TEMP_DIR); latexmk -pdf -halt-on-error main.tex
	cp $(TEMP_DIR)/$(OUTPUT_PDF) $(OUTPUT_PDF)

setup:
	mkdir -p $(TEMP_DIR)
	mkdir -p $(TEMP_DIR)/figures/pdf

clean:
	rm -rf $(TEMP_DIR)
	rm -f $(OUTPUT_PDF)

