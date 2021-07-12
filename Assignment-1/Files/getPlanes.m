function C = getPlanes(image)
C = cell(1,8);  % Creates empty cell
for i = 1:8
    C{i} = bitget(image(:,:,2),i)*2^(i-1);  % Retrives all green bit-planes
end
end