function [isApplicableFull, isApplicableSubs, sequence, lnBounds] = checkLNSubsequence(lambda, k, alpha, delta)
    % delta is the minimal lower norm allowed for FSM matrices

    % for the case that theta = 0
    % the variable "sequence" can be used like this:
    % let N:= lenght(alpha) then the FSM is applicable for all subsequences
    % (l_n) \subset subsequence(:,1)+ \union {j-q_i | j \in subsequence(:,1), i >N} 
    % (r_n) \subset subsequence(:,2)+ \union {j+q_i | j \in subsequence(:,2), i >N} 
    
   
    [isApplicableFull, minLowerNorm, epsilon, words, lowerNorms] =  checkLowerNorms(lambda, k, alpha);
    
    sn = lambda*constructWord(alpha);
    
    if (isApplicableFull)
       isApplicableSubs = isApplicableFull;
       sequence =[]; % all subsequences (todo)
       lnBounds = minLowerNorm-epsilon;
    else
       % filter applicable subsequecnes
       goodWords = words(lowerNorms>epsilon+delta,:);
       if ~isempty(goodWords)
           %found some applicable subsequence
           isApplicableSubs = true;
           
           % to find left cut-off sequences in flipped word
           lIdx = [];
           for j=goodWords'
                snFlipped = flip(sn);
                lIdx = [lIdx,strfind(snFlipped, j')];
           end
           lSequence = - length(sn) + lIdx -2; %index 1 means shift 0           
           sequence(:,1) =  flip(sort(lSequence));
           
             %  find right cut-off sequences  (flip good words)
           rIdx = [];
           for j=flip(goodWords)'
                rIdx = [rIdx,strfind(sn, j')];                
           end
           rSequence =  rIdx + length(j) - 1; %cut off at end of word          
           sequence(:,2)  =  sort(rSequence);
           
           % Bound for lower norms
           % todo: for each sequence individually
           lnBounds = min(lowerNorms(lowerNorms>epsilon+delta)) - epsilon;
       else
           % no applicable subsequence
           isApplicableSubs = false;
           sequence =[];
           lnBounds = max(lowerNorms) - epsilon;
       end       
       
    end
    
    
    
    
end

