
# Appunti di Analisi 3

## Autori

- [@ar-lli](https://github.com/ar-lli)
- [@aziis98](https://github.com/aziis98)

## Development

Questo progetto è basato sul template <https://github.com/aziis98/template-latex>. Per clonare questo repo basta fare

```bash
git clone https://github.com/aziis98/appunti-analisi-3
```

Questo progetto dipende da _Texlive_, _Inkscape_, _Make_ ed opzionalmente anche _entr_ per ricompilare automaticamente i file quando si scrive.

### Comandi

- `make setup; make main.pdf` 
	
    Da eseguire al primo clone per generare la cartella di _cache_ ed i file iniziali generati dalle figure.

- `make` 
    
    Per compilare il progetto dopo la prima esecuzione

- `./watch` (richiede <https://github.com/clibs/entr>)

    Controlla se ci sono cambiamenti nei file sorgente e li ricompila se cambiano (e forse mostra addirittura una notifica).

## Struttura

Tutti i file sorgente sono in [`src/`](./src) mentre la versione più aggiornata delle dispense si trova in [`main.pdf`](./main.pdf).
