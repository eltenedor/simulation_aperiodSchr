function [min_sv] = smallest_sv(v)
    n = length(v);
    H = diag(v) + diag(ones(n-1,1), 1) + diag(ones(n-1,1), -1);
    H = [H; [zeros(1, n-1) , 1]];
    min_sv = min(svd(H));
end
