# simulation_aperiodSchr

**This repository is push mirrored to [https://github.com/eltenedor/simulation_aperiodSchr]()**

Simulaton Code for "Finite Section Method for Aperiodic Schrödinger Operators"

https://arxiv.org/abs/2104.00711



# Lower Norm
List of Matlab Files:

* `checkLowerNorms.m` ... implementation of Algorithm 1, checks if the condition in Proposition 6.7 is satisfied for a fix D

* `tridiagInvNorm.m` ... computes the \infty-norm of the inverse of a matrix with diagonal v and sub- and superdiagonal that are constant 1

* `constructAllWords.m` ... returns all possible subwords of v_{\alpha,\theta} of length k

* `constructWord.m` ... returns s_n, see equation (16)

* `copyWord.m` ... auxiliary function

* `LowerNormsTest.m` ... a script that runs tests for `checkLowerNorms`


Run `[isApplicable, minLowerNorm, epsilon, words, lowerNorms] = checkLowerNorms(lambda, k, alpha)`.

+ `lambda` ... is a real number that determines the scaling of the potential.

+ `D` ... is an integer that determines the size of the approximation (see Proposition 6.7).

+ `alpha` ... is a vector that contains the begging of the continued fraction expansion of the slope. The word s_n, see equation (16), that is generated from this alpha must be longer than D.

- `isApplicable` ... is 1 if the condition in Proposition 6.7 is satisfied, in that case the FSM is applicable. If `isApplicable` is 0 then the FSM might still be applicable, try again with larger D.

- `minLowerNorm` ... returns upper bound for left hand side of (36)

- `epsilon` ... right hand side of (36), `isApplicable = (minLowerNorm > epsilon)`.

- `words` ... list of all subwords of length D for the potential with the given slope alpha

- `lowerNorms` ... list of lower norms of square matrices with potentials from `words`, `minLowerNorm = min(lowerNorms)`.

To reconstruct Example 6.8, run 

`[isApplicable, minLowerNorm, delta, words, lowerNorms] = checkLowerNorms(1, 1200, [2,1,3,2,4,1,4,1,2,1,1,1])`.


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

