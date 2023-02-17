function eigenvalues = unionPointSpecPeriodicScaledOneSided(v, lambda)

  %Calcualate union of point-spectra of one-sided periodic Schrödinger
  %v = [v(1),...,v(K)] for a K-periodic potential
  %lambda - scaling factor
  %eigenvalues contains the eigenvalues of the one sided operators

K = length(v);
eigenvalues = []; 
 
for s = 1:K
  [new_eigenvalues, ~] = pointSpecPeriodicScaledOneSided(v, lambda);
  eigenvalues = [eigenvalues, new_eigenvalues];
  v = [v(2:end), v(1)]; %perform shift
  %fprintf('%d\n', s/K*100); %output progress
end

eigenvalues = unique(eigenvalues);