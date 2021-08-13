# Band and Pointspec Archive

These are the reference files used for the figures and raw data files used for the preprocessing with Octave.

## Files

* `.*_?.{csv,tex}` Trayectories in `.csv` and TeX format
* `K?_bands.csv` Band spectral data in `.csv` and TeX format
* `K?-{plain,standalone}.{tex,pdf}` standalone Tex documents and PDF

## Usage

Compile standalone images with `pdflatex`, e.g.
```bash
pdflatex K4-standalone.tex
```
creates the file `K4-standalone.pdf` consisting of the figure for the example potential `v = (1,1,0,1)`.

