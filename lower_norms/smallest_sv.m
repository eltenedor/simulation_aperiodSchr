function [min_sv] = smallest_sv(v)
    n = length(v);
    H = diag(v) + diag(ones(n-1,1), 1) + diag(ones(n-1,1), -1);
    H = [H; [zeros(1, n-2) , 1, 0]];
    min_sv = svds(H, 1, 'smallest');
end
