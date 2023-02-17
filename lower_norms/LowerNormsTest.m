%%%% Lower norms test

eps = 1.01; %tolerance

%% Test 1: Fibonacci Hamiltonian results in paper
alpha = ones(1,11);
D = 100;   
[isApplicable, minLowerNorm, delta, words, ~] = checkLowerNorms(1, D, alpha);


if((isApplicable == 1 ...
        && inRange(minLowerNorm, 0.075, eps) ...
        && inRange(delta, 0.0622, eps) ...
        && size(words,1) == D+2 ))
   display('Test 1 passed')
else
   display('Test 1 failed')
   exit(1)
end

%% Test 2: operator with long approximation
eps = 1.001;
fail = 0;
alpha = [2,1,3,2,4,1,4,1,2,1];
D = 1000;   
[isApplicable, minLowerNorm, delta, words, lowerNorms] = checkLowerNorms(1, D, alpha);

 if(isApplicable == 1 ...
        && inRange(minLowerNorm, 0.0210, eps) ...
        && inRange(delta, 0.0063, eps) ...
        && size(words,1) == D+2 )
   display('Test 2 passed')
else
   display('Test 2 failed')
end


exit(0)
