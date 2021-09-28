
# Template: LaTeX Project

<!-- Generated from template: <https://github.com/aziis98/template-latex> -->

This is a basic template for a LaTeX project, uses `latexmk` for rendering and a [`Makefile`](./Makefile) to build the project.

## Installation

```bash
git clone https://github.com/aziis98/template-latex
```

or (I personally prefer) the following

```bash
cd /path/to/folder 
git init
git pull --depth=1 https://github.com/aziis98/template-latex
```

that downloads just the most recent commit (the `--depth=1` option) and leaves the remote origin empty.

### Layouts

Fow now there is only one extra layout, but as time passes I will add even more

- A4 with two column layout

	```bash
	cd /path/to/folder 
	git init
	git pull --depth=1 https://github.com/aziis98/template-latex layout-a4-c2
	```

## Structure

All source files should be placed in [`src/`](./src), they are copied to the [`.cache`](./.gitignore) directory, rendered and then [`main.pdf`](./main.pdf) is copied back into the root of the project.

## Usage

To be organized I've recently started using this [Makefile](./Makefile) to manage LaTeX projects, so just use `make`, `make all` or `make main.pdf` to build the project and generate the output PDF.

The alternative is to run [`./watch`](./watch) that uses `entr` to watch and rerender the PDF when the source files change (and shows a notification with `notify-send`).

### Live reload with entr (just `./watch` now)

If you have `entr` installed you can also have "live reload" on save with

```bash
find src/ -type f | entr make
```

that will automatically rebuild [`main.pdf`](main.pdf).
