clc;clear all
im1 = imread('coins.png');
im2 = rgb2gray(imread('fabric.png'));
im3 = imread('rice.png');
im4 = imread('text.png');

figure()
for i = 1:8
    A = bitset(im3, i,im4);
    subplot(3,3,i)
    imshow(A)
end
%%

figure()
subplot(1,2,1)
imshow(im1)
subplot(1,2,2)
imshow(im1,[])

%%
clc;clear

