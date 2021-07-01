function [D,S] = ISODDTEST(A)
D = mod(A,2) ~= 0;
S = sum(D) == length(A);
end

