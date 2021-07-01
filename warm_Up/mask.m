function R = mask(M,N,r,c,m,n)
R = zeros(M,N);
R(r:r+m,c:c+n) = 1;
R = logical(R);
end

