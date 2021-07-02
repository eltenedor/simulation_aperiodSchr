function s = constructWord(alpha)

%start recursion
sm1 = 1; %s_{-1}
s0 = 0;  %s_0

%first step uses alpha(1)-1
s = [copyWord(s0,alpha(1)-1), sm1]; %s_1
sm1 = s0;
s0 = s;

%rest of recursion according to our notes
%s = s_n
%s0 = s_{n - 1}
%sm1 = s_{n - 2}

for n=2:length(alpha)
    s = [copyWord(s0,alpha(n)), sm1];
    sm1 = s0;
    s0 = s;
end

end
