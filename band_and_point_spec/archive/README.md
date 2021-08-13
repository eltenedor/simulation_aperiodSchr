# Band and Pointspec Archive

These are the reference files used for the figures and raw data files used for the preprocessing with Octave.

## Files

| Filename (RegEx) | Content Description |
| - | - |
|`.*_?.{csv,tex}` | trayectories in `.csv` and TeX format (TikZ) |
| `K?_bands.csv`|  band spectral data in `.csv` and TeX format (TikZ) |
| `K?-{plain,standalone}.{tex,pdf}` | standalone TeX documents and PDF |

## Usage

Compile standalone images with `pdflatex`, e.g.
```bash
pdflatex K4-standalone.tex
```
creates the file `K4-standalone.pdf` consisting of the figure for the example potential `v = (1,1,0,1)`.

Tested with `Version 3.14159265-2.6-1.40.20 (TeX Live 2019/Debian)`
