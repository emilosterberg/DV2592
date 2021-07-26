function [g,T] = histeq2(f)
bins = 255;
[n,~] = imhist(f);
n = n(2:bins+1);

T = round(cumsum(n)/numel(f)*bins);
g = (f);

for i = 1:bins
    K = f == i;
    g(K) = T(i);
end

end

