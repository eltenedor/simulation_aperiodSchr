function [aMin,aMax] = getValuesFromAlpha(alpha)
    % returns minimal and maximal value for continued fraction starting
    % with alpha
    
    x = 0;
    y = 1;
    
    for j=length(alpha):-1:1
        x = 1/(alpha(j)+x);
        y = 1/(alpha(j)+y);
    end
    
    aMin = min(x,y); %depends on legths of alpha even/odd
    aMax = max(x,y);
       
end
