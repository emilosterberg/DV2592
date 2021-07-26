clc;clear;close all

im = imread('text-spotshade.tif');
figure(); imshow(im)
%im2bw(im,0.1)
figure()
J = imadjust(im,[],[],0.1);
imshow(J)

figure();im2bw(J)
