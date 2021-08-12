# Simulation Programms for Aperiodic Schrödinger Operators

**This repository is push mirrored to [https://github.com/eltenedor/simulation_aperiodSchr]()**

It contains the simulaton code for the article "Finite Section Method for Aperiodic Schrödinger Operators"

arXiv-Preprint: [https://arxiv.org/abs/2104.00711](arXiv:2104.00711)

# Lower Norm

## List of Octave/MATLAB files:

| Filename | Info |
| - | - |
| `checkLowerNorms.m`   | implementation of Algorithm 1, checks if the condition in Proposition 6.7 is satisfied for fixed D |
| `constructAllWords.m` | returns all possible subwords of v_{\alpha,\theta} of length k |
| `constructWord.m`     | returns s_n, see equation (16) |
| `copyWord.m`          | auxiliary function |
| `LowerNormsTest.m`    | a script that runs tests for `checkLowerNorms` |
| `tridiagInvNorm.m`    | computes the \infty-norm of the inverse of a matrix with diagonal v and sub- and superdiagonal that are constant 1 |

## Example 6.8

To reconstruct Example 6.8, in Octave/MATLAB run 
```matlab
[isApplicable, minLowerNorm, delta, words, lowerNorms] = checkLowerNorms(1, 1200, [2,1,3,2,4,1,4,1,2,1,1,1]);
```
and check that
```
octave:2> isApplicable
isApplicable = 1
```

# Point and Band Spectrum

This directory contains [SageMath](https://www.sagemath.org/) Jupyter Notebooks and [Octave](https://www.gnu.org/software/octave/) scripts that were used for the proof of Theorem 1.2 and several figures.

## Proof of Theorem 1.2

The data for the proof was generated using the Notebook `potential_data.ipynb`.
The JSON file `pots.json` contains all the data needed for the proof of Theorem 1.2.

## Figures 2, 3, 4

The data for the figures resides in the subdirectory `/archive`.

In order to reproduce the band spectral data, run the jupyter notebook `bands.ipynb`.
In order to reproduce the point spectral data, run the jupyter notebook `point_spec.ipynb`.
Both routines will generate `.csv` data that is further processed by Octave scripts.
In order to create the tikz code needed for the plots, run the `preproc_KX.m` Octave scripts, where `X` is either `4`, `5` or `9` depending on the length of the example potential that you are interested in.
All the newly produced data will reside in the subdirectory `/data` together with auxiliary `.tex` files. 
In order to reproduce on of the figures, run `pdflatex KX-standalone.tex` where `X` is either `4`, `5` or `9` depending on the length of the example potential that you are interested in.

Change the line for `l = 0` to
```
0.000000000000000,9,-2.00000000000000,-1.87938524157182,-1.87938524157182,-1.53208888623796,-1.53208888623796,-1.00000000000000,-1.00000000000000,-0.347296355333861,-0.347296355333861,0.347296355333861,0.347296355333861,1.00000000000000,1.00000000000000,1.53208888623796,1.53208888623796,1.87938524157182,1.87938524157182,2.00000000000000
```
and the one for `l=2` to
```
2.00000000000000,9,-1.12269503546099,-1.11122114140128,-0.801937735804838,-0.762512708829868,-0.341677503250975,-0.288537854368133,0.554958132087371,0.614111698460124,1.56339706474929,1.67439549622911,2.24697960371747,2.48317863579858,2.66734798160450,3.00000000000000,3.00000000000000,3.18291284403670,3.71593700828199,3.72536349954030
```
in order to account for the multiplicities of the zeros. See also the output of the corresponding cell in `bands.ipynb`.

## Authors

| | |
|-|-|
| Dennis Gallaun  | [dennis.gallaun@tuhh.de](mailto:dennis.gallaun@tuhh.de) |
| Fabian Gabel    | [dennis.gallaun@tuhh.de](mailto:fabian.gabel@tuhh.de) |
| Julian Großmann | [dennis.gallaun@tuhh.de](mailto:julian.großmann@tuhh.de) |
| Marko Lindner   | [lindner@tuhh.de](mailto:lindner@tuhh.de) |
| Riko Ukena      | [riko.ukena@tuhh.de](mailto:riko.ukena@tuhh.de) |

## References

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
