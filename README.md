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

  This directory contains [SageMath](https://www.sagemath.org/) Jupyter Notebooks and [Octave](ihttps://www.gnu.org/software/octave/) scripts that were used for 

* the proof of Theorem 1.2 (`potential_data.ipynb`)
* Figure 2
* Figure 3
* Figure 4
* Figure 5

The file JSON file `pots.json` contains all the data needed for the proof of Theorem 1.2.

The subdirectory `point_and_band_spec/archive` contains the raw `.csv` output for the Figures, and the `.tex` source used for the publication.

