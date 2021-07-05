function R = mask(M,N,r,c,m,n)
R = false(M,N);
R(r:r+m,c:c+n) = true;
end

