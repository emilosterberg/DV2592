clc;clear;close all

orig_bin = imread('Binary.png');
orig_im = imread('BTH.png');
key = 21545422;

new_im = Encode(orig_im, orig_bin, key);
figure(); imshowpair(orig_im, new_im, 'montage')

% Saves the new image to file, clears the variable and loads it again, for demonstration
%imwrite(new_im,'new_BTH.png');
clear new_im
new_im = imread('new_BTH.png');

% Correct key
new_bin = Decode(new_im, key);
figure(); imshowpair(orig_bin, new_bin, 'montage')

% Checking if the new binary image is exactly the same as the original
Correct = numel(orig_bin) == sum(orig_bin(:) == new_bin(:));

% Wrong key, new_bin2 should show randomized pixels
new_bin2 = Decode(new_im, 1);
figure(); imshowpair(orig_bin, new_bin2, 'montage')