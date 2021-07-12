clc;clear;close all

orig_bin = imread('Binary.png');
orig_im = imread('BTH.png');
key = 124151;

new_im = Encode(orig_im, orig_bin, key);

figure()
imshowpair(orig_im, new_im, 'montage')

% Correct key
new_bin = Decode(new_im, key);

figure()
imshowpair(orig_bin, new_bin, 'montage')

% Wrong key
new_bin = Decode(new_im, 897987);

figure()
imshowpair(orig_bin, new_bin, 'montage')