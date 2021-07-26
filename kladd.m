clc;clear;close all

% bitxor, bitget, bitset, randperm, rng, imread, imwrite, imshow, 
% imshowpair, montage, subplot, figure, title, str2double

bin = imread('Binary.png');
im = imread('BTH.png');
k = 21545422;
rng(k);
p = randperm(435)';
A = bin(:,1);
B = bin(p,:);
%%
a=bitget(im(:,:,1),1); figure, imshow(logical(a))
%%
clc;clear;close all
bin = imread('Binary.png');
im = imread('BTH.png');

imC = getPlanes(im);

imshow(logical(imC{1}))
%%
clc;clear;close all
rng(222)
bin = imread('Binary.png');
figure()
imshow(bin)
temp = reshape(randperm(numel(bin)),435,1024);
b2 = bin(temp);
figure()
imshow(b2)

% b3 = reshape(b2(randperm(numel(b2))),435,1024);
% figure()
% imshow(b3)

p = reshape(randperm(numel(bin)),435,1024);
[~,ii] = sort(temp(:));
b4 = b2(reshape(ii,435,1024));
figure()
imshow(b4)

%%
clc;clear;close all

orig_bin = imread('Binary.png');
orig_im = imread('BTH.png');
key = 124151;

new_im = Encode(orig_im, orig_bin, key);

figure()
imshowpair(orig_im, new_im, 'montage')

new_bin = Decode(new_im, key);

figure()
imshowpair(orig_bin, new_bin, 'montage')

