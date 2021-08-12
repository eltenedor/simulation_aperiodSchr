function [isApplicable, minLowerNorm, epsilon, words, lowerNorms] = checkLowerNorms(lambda, D, alpha)
% CHECKLOWERNORMS Check whether the approximate lower norms (\nu_k) of all one-sided limit operators are larger than the error bound epsilon. 
% [ISAPPLICABLE, MINLOWERNORM, EPSILON, WORDS, LOWERNORMS] = CHECKLOWERNORMS(LAMBDA, D, ALPHA) 
%   In that case, the FSM is applicable (isApplicable = 1).
%   Checks for the real valued scaling LAMBDA of the potential determined by ALPHA while D is an integer that determines the size of the approximation (see Proposition 6.7).
%
% ALPHA ... is a vector that contains the begging of the continued fraction expansion of the slope. The word s_n, see equation (16), that is generated from this alpha must be longer than D.
%
% ISAPPLICABLE is true if the condition in Proposition 6.7 is satisfied, in that case the FSM is applicable. If ISAPPLICABLE is false, then the FSM might still be applicable, for a larger value D.
%
% MINLOWERNORM returns the upper bound for the left hand side of (36).
%
% EPSILON is thy right hand side of (36), and ISAPPLICABLE = (MINLOWERNORM > EPSILON).
%
% WORDS lists all subwords of length D for the potential with the given slope ALPHA.
%
% LOWERNORMS lists the lower norms of square matrices with potentials from WORDS, and MINLOWERNORM = min(LOWERNORMS).
%
%
%  See also CONSTRUCTALLWORDS, TRIDIAGINVNORM.
%
% For more information see the corresponding preprint on "https://arxiv.org/abs/2104.00711".
    
    %This function constructs all k+1 subwords of length k. The shortest
    %continued fraction that has exactly these subwords is returned (the last 3 indices are set to 1).
    [words, alpha] = constructAllWords(D+1,alpha); 
    if size(words,1) < D+2
       error('could not find all words'); 
    end
    words = lambda * words;
    
    N = size(words,1);
    
    lowerNorms = Inf(N,1);
    epsilon = 4*(lambda+2)/(D); 
    parfor j=1:N  
        v = words(j,:);
        %H = diag(ones(k-1,1),-1) + lambda*diag(v) + diag(ones(k-1,1),1);
        lowerNorms(j) = 1/tridiagInvNorm(v);
    end
    
    minLowerNorm = min(lowerNorms);
    isApplicable = minLowerNorm > epsilon;
    
end

