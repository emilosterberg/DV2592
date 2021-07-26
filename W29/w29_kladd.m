clc;clear;close all

A = imread('circles.png');
figure()
imshow(A)
Euler = bweuler(A);

B = bwmorph(A,'dilate');
figure()
imshow(B)

SE = strel('square', 8);
B = bwmorph(double(A),'dilate',4);
figure()
imshow(B)

C = bwfill(A,'holes');
figure()
imshow(C)
%%
clc;clear;close all

%doc imdilate
SE = strel('square',8);
rice = imread('rice.png')
%imshow(rice)
figure()
imshowpair(rice,imbinarize(rice),'montage')

riceEnh = imopen(rice,SE);
figure()
imshow(riceEnh)

SE = strel('square',15);
riceEnh = imopen(rice,SE);
figure()
imshow(riceEnh)

newimage = 