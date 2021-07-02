function f = tridiagDet(v)
%TRIDIAGDET(V) is the determinant of a tridiagonal matrix with diagonal v
%and super- and sub-diagonal 1
%
% For the recursion used here, see
% https://en.wikipedia.org/wiki/Tridiagonal_matrix#Determinant

fnm1 = 1;
fnm2 = 0;

N = length(v);
for k=1:N
    %f = vpa(v(k)*fnm1 - fnm2);
    f = v(k)*fnm1 - fnm2;
    fnm2 = fnm1;
    fnm1 = f;
end

end