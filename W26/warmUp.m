imshow('Peppers.png')
%%
ca
%%
file = imread('Peppers.png');
%%
fs(file)

%%
xx
arr = randi(100,1,10)
[E,S] = isevenTest(arr)
[D,S] = ISODDTEST(arr)
    
%%
xx
%arr = [12 12.3 1.325 1 152 155.3]
arr = randi(1000,1,5)./3
[W,S] = iswholeTest(arr)
%%

%%
xx;ca
im = imread('rose512.tif');
h = imshow(im);
hp = impixelinfo;


%%
xx
ca
r = 115;
c = 64;
m = 300;
n = 342;

im = imread('rose512.tif');
h = imshow(im);
impixelinfo;
[M,N] = size(im);

R = mask(M,N,r,c,m,n);
figure()
imshow(R)
im2 = im2double(im);
im2 = im2.*R;
figure()
imshow(im2,[])

%%
imresize(im2,M/m)
%%
im2 = im(ans);
imshow(im2)

%%
xx;ca

file = imread('Peppers.png');
%file = imread('rose512.tif');
imshow(file)
info = myimageinfo(file)





