 function [word, usedAlpha] = constructAllWords(k, alpha)

alpha = [alpha];

maxL = length(alpha);

 len=zeros(maxL,1);
 for j =1:maxL
    w = constructWord(alpha(1:j));
    len(j)  = length(w);
 end
 idx = find(len>k,1);
 
if(maxL> idx+1)    
    %disp('Not all entries of alpha are used.');
elseif(isempty(idx))
    error('Not enough entries in alpha.'); 
end
usedAlpha = alpha(1:idx);
 
 %% set all entries of alpha after idx to 1 (they do not matter in k window)
 alpha(idx+1) = 2;
 %usedAlpha = alpha(1:idx+3);
    
 v = constructWord(alpha);
 
 sz = length(constructWord(alpha(1:idx)));

 newWords = nan(sz+k,k);
 % change the right end of the word if k is odd
 if(mod(idx+1,2)==1)
    v([end-1,end]) = v([end,end-1]);
 end
 
 parfor j=(1:sz)
     newWords(j,:) = v(j:j-1+k);     
 end
 
 
 for j=(1:k)     
     tempV = circshift(v,[j,0]);
     newWords(sz+j,:) = tempV(1:k);
 end

 
 word = unique(newWords,'rows');
 
 if (size(word,1) ~= k+1)
      error('Not all words found.'); 
 end
end