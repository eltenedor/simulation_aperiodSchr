function w = copyWord(v, a)

lv = length(v);
w = zeros(1,lv*a);

for i=1:a
    w((i-1)*lv+1:(i-1)*lv+lv) = v ; 
end

end