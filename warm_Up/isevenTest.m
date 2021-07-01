function [E,S] = isevenTest(A)
E = mod(A,2) == 0;
S = sum(E) == length(A);
end

