function bands = bandsPeriodicScaledTwoSided(v, lambda, nPoints, eps)

  %Calcualate spectrum of two-sided periodic Schrödinger
  %v = [v(1),...,v(K)] for a K-periodic potential
  %lambda - scaling factor
  
  if(nargin < 3)
    nPoints = 10^5; %limits (-1,3) come from Gerschgorin Circles
    eps = 0.1;
  end
  if lambda >=  0
      lEnd = lambda*min(v) - 2 - eps;
      rEnd = lambda*max(v) + 2 + eps;
   else
     lEnd = lambda*max(v) - 2 - eps;
     rEnd = lambda*min(v) + 2 + eps;
   end
   

  res = (rEnd - lEnd)/nPoints;
  
  K = length(v);

  foundBand = false;
  bandCounter = 0;
  for k=1:nPoints
    % Build transition Matrix M
    
    EE = lEnd+k*res;
    
    M = eye(2);
    for n=1:K
      M=[EE - lambda * v(n), -1; 1 , 0]*M;
    end
    trM = trace(M);
    %Check if M fulfills trace condition
    
    if(abs(trM) <= 2 && foundBand == false)
      foundBand = true;
      bandCounter = bandCounter + 1;
      bands(bandCounter,1) = EE;
    elseif(abs(trM) > 2 && foundBand == true)
      foundBand = false;
      bands(bandCounter, 2) = EE - res;
    end
  end
  
  if (size(bands,1) < length(v))
    warning(['Found ', num2str(size(bands,1)), ' bands for lambda= ' , num2str(lambda), '. Increase number of points if necessary.'])
  end

end
