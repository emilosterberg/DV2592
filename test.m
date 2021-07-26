% Test file
clc;clear
rgb = imread('coloredChips.png');
imshow(rgb)
%%
d = drawline;
%%
pos = d.Position;
diffPos = diff(pos);
diameter = hypot(diffPos(1),diffPos(2))

%%

gray_image = rgb2gray(rgb);
imshow(gray_image)

%%
clc
[centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
    'Sensitivity',0.95)

%%
imshow(rgb)
h = viscircles(centers,radii);
%%
[centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
          'Sensitivity',0.95,'Method','twostage');

delete(h)
h = viscircles(centers,radii);

%%
% Test file
clc;clear
rgb = imread('coloredChips.png');
imshow(rgb)

%%
gray_image = rgb2gray(rgb);
J = imcomplement(rgb);
figure()
imshow(J)