function [isApplicable, minLowerNorm, epsilon, words, lowerNorms] = checkLowerNorms(lambda, k, alpha)
   
    
    %This function constructs all k+1 subwords of length k. The shortest
    %continued fraction that has exactly these subwords is returned (the last 3 indices are set to 1).
    [words, alpha] = constructAllWords(k+1,alpha); 
    if size(words,1) < k+2
       error('could not find all words'); 
    end
    words = lambda * words;
    
    N = size(words,1);
    
    lowerNorms = Inf(N,1);
    epsilon = 4*(lambda+2)/(k); 
    parfor j=1:N  
        v = words(j,:);
        %H = diag(ones(k-1,1),-1) + lambda*diag(v) + diag(ones(k-1,1),1);
        lowerNorms(j) = 1/tridiagInvNorm(v);
    end
    
    minLowerNorm = min(lowerNorms);
    isApplicable = minLowerNorm > epsilon;
    
end

