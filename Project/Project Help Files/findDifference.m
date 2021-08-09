function findDifference
global binImage correct nSpots attempts centroids mazeImage path_order ...
    path_data found cents

[y,x] = ginput(1);
attempts = attempts + 1;

x = round(x);
y = round(y);

closest = zeros(1,nSpots);
for i = 1:(nSpots)
    closest(i) = sqrt((cents(i,1)-y)^2 + (cents(i,2)-x)^2);
end
[~,idx] = min(closest);
closest = cents(idx,:);


if binImage(round(x),round(y)) && max(sum(found == closest,2)) ~= 2
    temp = zeros(1,nSpots-correct);
    for i = 1:(nSpots-correct)
        temp(i) = sqrt((centroids(i,1)-y)^2 + (centroids(i,2)-x)^2);
    end
    [~,idx] = min(temp);
    
    if correct == 0
        found = centroids(idx,:);
    else
        found = [found;centroids(idx,:)];
    end
    centroids(idx,:) = [];
    correct = correct + 1;
    subplot(1,3,1)
    imshow(mazeImage)
    hold on
    scatter(55,55,500,'w','square','filled');
    hold on
    scatter(path_data(path_order(correct),1),path_data(path_order(correct),2),500,'r','square','filled');
    title('Correct location, well done!')
    subplot(1,3,3)
    title(['Spots left: ', num2str(nSpots-correct)])
    
else
    subplot(1,3,1)
    title('Incorrect location, please try again!')
end

end

