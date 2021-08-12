function [isApplicable, minLowerNorm, epsilon, words, lowerNorms] = checkLowerNorms(lambda, D, alpha)
   %%% Checks whether the approximate lower norms (\nu_k) of all one-sided limit
   %%% operators is larger than the error bound epsilon. In that case, the
   %%% FSM is applicable (isApplicable = 1).
    
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

