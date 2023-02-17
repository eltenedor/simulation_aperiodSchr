[![DOI](https://img.shields.io/badge/DOI-10.5281/zenodo.5196575-blue)](https://doi.org/10.5281/zenodo.5196575)
[![LICENCE](https://img.shields.io/badge/license-MIT-green)](https://mit-license.org/)


**This repository is push mirrored to [https://github.com/eltenedor/simulation_aperiodSchr](https://github.com/eltenedor/simulation_aperiodSchr)**

# Spectral Analysis Code for Aperiodic Schrödinger Operators


Simulation code and supplementary material for the article "Finite Section Method for Aperiodic Schrödinger Operators".

arXiv-Preprint: [https://arxiv.org/abs/2104.00711](arXiv:2104.00711)

# Lower Norm

## List of Octave/MATLAB files:

| Filename | Info |
| - | - |
| `checkLowerNorms.m`   | implementation of Algorithm 1, checks if the condition (32) in Theorem 5.8 is satisfied for fixed D |
| `constructAllWords.m` | returns all possible subwords of v_{\alpha,\theta} of length k |
| `constructWord.m`     | returns s_n, see equation (9) |
| `copyWord.m`          | auxiliary function |
| `LowerNormsTest.m`    | a script that runs tests for `checkLowerNorms` |
| `smallest_sv.m`    | computes the smallest singular value of a rectengular matrix with diagonal v and sub- and superdiagonal that are constant 1 |
| `plotPeriodicApproximation.m` | used for the generation of Figure 2 |
| `growingTruncations.m`| used for the generation of Figure 3 |

## Example 5.9

To reconstruct Example 5.9, in Octave/MATLAB run 
```matlab
[isApplicable, minLowerNorm, delta, words, lowerNorms] = checkLowerNorms(1, 100, ones(11,1);
```
and check that
```
octave:2> isApplicable
isApplicable = 1
```

# Point and Band Spectrum

The directory `/band_and_point_spec` contains the [SageMath](https://www.sagemath.org/) Jupyter Notebooks and [Octave](https://www.gnu.org/software/octave/) scripts that were used for the proof of Theorem 1.1 in [[Gabel21]]( 	
https://doi.org/10.48550/arXiv.2110.09339) and several figures.

## Proof of Theorem 1.1

The data for the proof was generated using the notebook `potential_data.ipynb`.
The JSON file `pots.json` contains all the data needed for the proof of Theorem 1.2.
All results in `pots.json` only use symbolic calculations carried out with SageMath. 
For further documentation, consult the documentation in the notebook `potential_data.ipynb`.

## Figures 2, 3, 4

The data for the figures resides in the subdirectory `/archive`.

### Reproducibility

In order to reproduce 
* the band spectral data, run the jupyter notebook `bands.ipynb`.
* the point spectral data, run the jupyter notebook `point_spec.ipynb`.

Both routines will generate `.csv` data in the `/data` folder that is further processed by Octave scripts to generate TikZ code.

In order to create the `tikz` code needed for the plots, run the `postproc_KX.m` Octave scripts, where `X` is either `4`, `5` or `9` depending on the length of the example potential that you are interested in.
All the newly produced data will reside in the subdirectory `/data` together with auxiliary `.tex` files. 
In order to reproduce one of the figures, run 
```
pdflatex KX-standalone.tex
``` 
where `X` is either `4`, `5` or `9` depending on the length of the example potential that you are interested in.

### Modifications in the case K=9

In order to account for the multiplicities of the zeros for the scalings `l=0` and `l=2`, the file output of the `K9` cells in `bands.ipynb` needs to be changed before the postprocessing can start.

In the output file `bands_K9.csv`, change the line for `l = 0` to
```
0.000000000000000,9,-2.00000000000000,-1.87938524157182,-1.87938524157182,-1.53208888623796,-1.53208888623796,-1.00000000000000,-1.00000000000000,-0.347296355333861,-0.347296355333861,0.347296355333861,0.347296355333861,1.00000000000000,1.00000000000000,1.53208888623796,1.53208888623796,1.87938524157182,1.87938524157182,2.00000000000000
```
and the one for `l=2` to
```
2.00000000000000,9,-1.12269503546099,-1.11122114140128,-0.801937735804838,-0.762512708829868,-0.341677503250975,-0.288537854368133,0.554958132087371,0.614111698460124,1.56339706474929,1.67439549622911,2.24697960371747,2.48317863579858,2.66734798160450,3.00000000000000,3.00000000000000,3.18291284403670,3.71593700828199,3.72536349954030
```
See also the output of the corresponding cell in `bands.ipynb`.

# Authors

| Name | Mail |
|-|-|
| Fabian Gabel    | [fabian.gabel@tuhh.de](mailto:fabian.gabel@tuhh.de) |
| Dennis Gallaun  | [dennis.gallaun@tuhh.de](mailto:dennis.gallaun@tuhh.de) |
| Julian Großmann | [julian.grossmann@tuhh.de](mailto:julian.grossmann@tuhh.de) |
| Marko Lindner   | [lindner@tuhh.de](mailto:lindner@tuhh.de) |
| Riko Ukena      | [riko.ukena@tuhh.de](mailto:riko.ukena@tuhh.de) |

# References

The above code was tested using Octave  5.2.0
```
  John W. Eaton, David Bateman, Søren Hauberg, Rik Wehbring (2019).
  GNU Octave version 5.2.0 manual: a high-level interactive language for numerical computations.
  URL https://www.gnu.org/software/octave/doc/v5.2.0/
```
and SageMath version 9.2
```
  William A. Stein et al. (2020) 
  Sage Mathematics Software (Version 9.2), The Sage Development Team
  URL http://www.sagemath.org.
```
