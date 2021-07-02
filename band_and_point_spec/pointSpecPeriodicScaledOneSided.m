function [eigenvalues, noneigenvalues] = pointSpecPeriodicScaledOneSided(v, lambda)

  %Calcualate point-spectrum of one-sided periodic Schrödinger
  %v = [v(1),...,v(K)] for a K-periodic potential
  %lambda - scaling factor
  %eigenvalues contains the eigenvalues of the one sided operator
  %noneigenvalues contain candidates that don't fulfill the determinant condition

K = length(v);

eigenvalues = [];
noneigenvalues = [];
%eps = 1e-8; %use octave constant eps=2.2204e-16
 
if (K > 1)
    Hfs = diag(ones(K-1,1),-1) + lambda*diag(v) + diag(ones(K-1,1),1); %construct Matrix as in Hagger

   %sigma = eig(Hfs(1:end-1, 1:end-1));
   sigma = eigs(Hfs(1:end-1, 1:end-1), 200,"sm", options('maxit',10000000,'disp',0,'p',size(Hfs,2)));
   
   for i=1:length(sigma)
     %filter sigma-values by checking determinant condition
     if (abs(tridiagDet(lambda*v - sigma(i))) < 1-eps)
       eigenvalues = [eigenvalues, sigma(i)];
     else
       noneigenvalues = [noneigenvalues, sigma(i)];
     end
   end
end