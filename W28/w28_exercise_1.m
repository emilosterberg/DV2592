clc;clear;close all;
im = imread('magnified-pollen-dark.tif');
[g,T] = histeq2(im);

figure(); imhist(im)
figure(); imshow(g)
figure(); plot(T)
