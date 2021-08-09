function MazeGame2(ImageA, ImageB)
clc;close all
%MazeGame
%How to use
%  MazeGame('ImageA.png', 'ImageB.png') %start the process to spot the differences
% global opt1 nSpots correct attempts centroids mazeImage path_data ...
%     path_order data binImage found elpTime userName cents

global opt1 nSpots correct attempts found elpTime userName 

% Start with the input dialogue box
[userName, answer] = initialPrompts;

% Read the two images (A,B), the Maze & the Path images then do the processing
imageProcessing(ImageA)

% Create and call new functions if needed
correct = 0;attempts = 0;
if strcmp(answer,opt1)
    showRanking
else
    tic;
    found = [0 0];
    showImages(ImageA,ImageB)
    while correct < nSpots
       findDifference 
    end
    elpTime = toc;
    finishedGame
    updateRankings
end

end
