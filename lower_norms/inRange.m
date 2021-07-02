function [ isInRange ] = inRange( v1, v2, eps )


isInRange = v1 <= v2*eps && v2 <= v1*eps;

end

