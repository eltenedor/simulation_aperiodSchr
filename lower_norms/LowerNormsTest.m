%%%% Lower norms test

eps = 1.01; %tolerance

%% Test 1: Fibonacci Hamiltonian results in paper
alpha = ones(1,13);
D = 200;   
[isApplicable, minLowerNorm, delta, words, ~] = checkLowerNorms(1, D, alpha);


if((isApplicable == 1 ...
        && inRange(minLowerNorm, 0.075, eps) ...
        && inRange(delta, 0.06, eps) ...
        && size(words,1) == D+2 ))
   display('Test 1 passed')
else
   display('Test 1 failed')
   exit(1)
end

%% Test 2: operator with long approximation
eps = 1.001;
fail = 0;
alpha = [2,1,3,2,4,1,4,1,2,1,1,1];
D = 1200;   
[isApplicable, minLowerNorm, delta, words, lowerNorms] = checkLowerNorms(1, D, alpha);

 if(isApplicable == 1 ...
        && inRange(minLowerNorm, 0.012224, eps) ...
        && inRange(delta, 0.01, eps) ...
        && size(words,1) == D+2 )
   display('Test 2 passed')
else
   display('Test 2 failed')
end


%% Test 3: compare the lower norms with norms of inverses
eps = 1.001;
alpha = randi(4, 1,20);
D = 400;   

% shrink alpha to use less memory
for sz=1:20
    if length(constructWord(alpha(1:sz))) >= D
        alpha = alpha(1:min(sz+3,20));
        break;
    end
end

try
    [isApplicable, minLowerNorm, delta, words, lowerNorms] = checkLowerNorms(1, D, alpha);

    if (size(words,1) ~= D+2) 
       display('Test 3 failed') 
       fail = 1;       
       exit(1)
    end
    
    nTest = 100;
    for i=1:nTest        
        %check minimal and maximal values first then random indices
        switch(i)
            case 1, [~,i] = min(minLowerNorm); 
            case 2, [~,i] = max(minLowerNorm); 
            otherwise, randi(D+2);
        end
        w = words(i,:);
        H = diag(ones(D,1),-1) + 1*diag(w) + diag(ones(D,1),1);
        Hinv = inv(H);
        normInv = norm(Hinv, Inf);
        if(~inRange(1/normInv, lowerNorms(i), eps))
           disp(['Test 3 failed with ', alpha, ' at index ', i]);
           fail = 1;
           exit(1)
           break;
        end        
    end
    
    if fail == 0
        display('Test 3 passed');
    end
    
catch
    display('Not enough memory for Test 3 :(');
    exit(1)
end

exit(0)
