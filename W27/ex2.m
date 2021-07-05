clc;clear;close all

ball = imread('Ball.png');
first = imread('firstFrame.png');
last = imread('lastFrame.png');

[x, y, ~] = size(first);
row = floor(x/2);
col = floor(y/2);
[xb, yb,~] = size(ball);
n = 46;
l = 10;
X = cell(1,n+1);



figure()
outfile = 'football.gif';
for i = 1:n+1
    temp = first;
    temp(row-xb/2:row + xb/2-1,col - yb/2+(i-1)*l:col + yb/2-1+(i-1)*l,:) = ball;
    if i <= n
        X{i} = temp;
    else
        X{i} = last;
    end
    imshow(X{i})
    [imind,cm] = rgb2ind(X{i},256);

    if i==1
        imwrite(imind,cm,outfile,'gif','DelayTime',0,'loopcount',inf);
    else
        imwrite(imind,cm,outfile,'gif','DelayTime',0,'writemode','append');
    end
end













