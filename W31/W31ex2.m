clc;clear;close all


A = imread('Eyes.jpg');

PY = sum(rgb2gray(A));
PY = rescale(PY);


[x y] = min(PY(1:length(PY)/2))
[x2 y2] = min(PY(length(PY)/2+1:end))
y2 = y2+length(PY)/2 + 1;


