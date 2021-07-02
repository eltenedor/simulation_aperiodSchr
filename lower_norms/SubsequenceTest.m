% To become a test for pipeline
% for now just to play around


lambda = 0.23;
%alpha = ones(1,11);
%k = 100;

%alpha = [2 1 3 4 4 4 1 1 1 1];
alpha = [2 2 2 2 50 4];
k = 2000;
delta = 0.00;

[isApplicableFull, isApplicableSubs, sequence, lnBounds] = checkLNSubsequence(lambda, k, alpha, delta);
epsilon = 4*lambda/(k); 

alpha2 = [1 1]; %kann beliebig gewählt werden
alphafull=[alpha,alpha2];
invNorms = zeros(size(sequence,1),length(alpha2)+1);
rs = zeros(size(sequence,1),length(alpha2)+1);
ls = zeros(size(sequence,1),length(alpha2)+1);
qCur = 0;


if(isApplicableSubs && ~isApplicableFull)
    
    %Check inverse norms for predicted subsequences
    
   sn = lambda*constructWord(alphafull);      %longest word    
    qn = length(sn);
    v = [flip(sn), 1, 0, sn];  % two sided word, index 0 is at qn+2
    for i= 0:length(alpha2)
        sCur = constructWord([alpha,alpha2(1:i)]);
        qOld = qCur;
        qCur = length(sCur);
    
        for j = 1: size(sequence,1)
           %cut-off points
           ln = sequence(j,1)-qOld;
           rn = sequence(j,2)+qOld;
           dn = rn - ln + 1; 

           %FSM matrix
           w = v(ln+qn+2: rn+qn+2); % word on diagonal
           %H = diag(ones(dn-1,1),-1) + lambda*diag(w) + diag(ones(dn-1,1),1);

           invNorms(j,i+1) = tridiagInvNorm(w);
           ls(j,i+1)= ln;
           rs(j,i+1)= rn;
        end
    end
    
    
    
    %Check "full" FSM for larger cut offs
    qOld = qn;
    qn = length(sn);
    v = [flip(sn), 1, 0, sn];  % two sided word, index 0 is at qn+2
    
    invNormsFull = zeros(2*max(sequence(:,2)),1);
    for j = 1: qn
       %cut-off points      
       %dn =2*j + 1; 
       
       %FSM matrix
       w = v(-j+qn+2: j+qn+2); % word on diagonal
       %H = diag(ones(dn-1,1),-1) + lambda*diag(w) + diag(ones(dn-1,1),1);
       
        invNormsFull(j) = tridiagInvNorm(w);
    end
    
    figure
    plot(rs(:),invNorms(:));
    figure
    plot(invNormsFull);
    

    
end

