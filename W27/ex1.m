A = imread('ImageA.png');
B = imread('ImageB.png');

C = uint8(abs(double(A)-double(B)));
imshow(C)