lambda = 1;
alpha = ones(11,1);
N = 100;
n0 = 1;

isApplicable = zeros(N+1-n0,1);
minLowerNorm = zeros(N+1-n0,1);
epsilon = zeros(N+1-n0,1);

for D= n0:N
   [isApplicable(D+1-n0), minLowerNorm(D+1-n0), epsilon(D+1-n0), ~, ~] = checkLowerNorms(lambda, D, alpha);
end