function [infNorm] = tridiagInvNorm(v)
  % l1/lInf norm for inverse of tridiagonal matrix in O(n)
  % assumes nondiagonal entries to be 1, can easily be modified
  % formula from wikipedia
  
  n = length(v);
  
  theta = zeros(n+1,1);
  phi = zeros(n,1);
  fact = 1;
  
  % initialize first two elements
  theta(1) = 1;   % in wiki formula the index goes from 0 -> n
  theta(2) = v(1);
  theta(3) = v(2)*theta(2)-1;
  
  phi(n) = 1;   % in wiki formula the index goes from n+1 -> 2
  phi(n-1) = v(n);
 
  for(j= 3:n)
    theta(j+1) = v(j)*theta(j) - theta(j-1);
    phi(n-j+1) = v(n-j+2)*phi(n-j+2) - phi(n-j+3);
    
    if(theta(j+1)>1e100)
      fact = fact* theta(j+1);
      phi = phi / (theta(j+1));
      theta = theta / (theta(j+1));     
    end
  end
  
  if(sum(isnan(phi)) || sum (isnan(theta)) || isinf(fact))
%    error('Inverse contains NaN'); 
     infNorm = Inf;
      return;
  end
  
  if(isinf(theta(n+1)))
      infNorm = Inf;
      return;
  end
  
  
  %T = tril(phi*theta(1:n)') + triu(theta(1:n)*phi' ,1);
  %T = T/theta(n+1)*fact;
  
  %compute norm without matrix
  thetaSum = cumsum(abs(theta)); 
  phiSum = flip(cumsum(flip(abs(phi))));
  
  infNorms = zeros(n,1);
  for j=1:n-1
    infNorms(j) = thetaSum(j)*abs(phi(j)) + abs(theta(j))*phiSum(j+1);
  end
  infNorms(n) = thetaSum(n)*phi(n);
  infNorm = max(infNorms)*abs(fact/theta(n+1));
end