clc;clear;close all

a = '.png'
b = 'Images/'
c = 1
C = num2str(c)
stri = [b C a]
file = join(stri)
image = imread(file);

imshow(image)

for i = 1:60
    file = imread(join(['Images/' num2str(i) '.png']));
    varR = 0;varG = 0; varB = 0;
    
end