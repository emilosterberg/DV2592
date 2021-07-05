function [W,S] = iswholeTest(A)
W = A == floor(A);
S = sum(W) == length(A);
end

