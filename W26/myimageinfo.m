function info = myimageinfo(f)
planes = size(f,3);

maximum(1:planes) = max(max(f(:,:,1:planes)));
minimum(1:planes) = min(min(f(:,:,1:planes)));

info = struct('rows',size(f,1),'cols',size(f,2),'planes',planes, ...
    'max',maximum,'min',minimum);
end