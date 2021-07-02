lambda = 1;
k = 1200;

maxIndex = 7;
NIter = 7^4;

% real values
alphaValues = zeros(NIter, 3);

%continued fraction
alphas = ones(NIter, 30);
tic
for i=2:NIter
% consctruct next alpha
alphas(i,:) = nextAlpha(alphas(i-1,:), maxIndex);    
end
toc
tic
parfor i = (1:NIter)  
    
    % call function 
    [isApplicable, minLN, epsilon, alphaUsed] = checkLowerNorms(lambda, k, alphas(i,:));
    
    %get real Interval from alpha
    [aMin, aMax] = getValuesFromAlpha(alphas(i,1:5));
    alphaValues(i,:) = [aMin, aMax, isApplicable];
end
toc

successValues = alphaValues(alphaValues(:,3)==1,:);
figure
for j=1:size(successValues,1)
    hold on    
    plot(successValues(j,1:2),[1,1],'g', 'LineWidth',3)
    hold off
    grid on
end


unsuccessValues = alphaValues(alphaValues(:,3)==0,:);
for j=1:size(unsuccessValues,1)
    hold on    
    plot(unsuccessValues(j,1:2),[0.9,0.9],'r', 'LineWidth',3)
    hold off
    grid on
end

%figure;
%scatter(alphas(:,1), ones(NIter,1));
sum(abs(successValues(:,1)-successValues(:,2)))