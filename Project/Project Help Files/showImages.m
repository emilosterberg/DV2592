function showImages(ImageA,ImageB)
global mazeImage nSpots path_data

figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,3,1)
imshow(mazeImage)
hold on
plot(path_data(:,1),path_data(:,2),'r*','MarkerSize',20)
hold on
%scatter(43,68,1000,'r','square','filled');
title('Maze Game')
subplot(1,3,2)
imshow(ImageA)
subplot(1,3,3)
imshow(ImageB)
title(['Spots left: ', num2str(nSpots)])

end

