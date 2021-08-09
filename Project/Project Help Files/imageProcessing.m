function imageProcessing(ImageA)
global nSpots centroids mazeImage path_data ...
    path_order data binImage cents

ImageA = imread(ImageA);
%ImageB = imread(ImageB);
mazeImage = imread('Maze.png');
path = imread('Path.png');
[row,col] = find(path == 1);
temp = 1:length(row);
data = [col row temp'];

binImage = logical(bitget(ImageA(:,:,1),1));
stats = regionprops(binImage);
nSpots = length(stats);
centroids = zeros(nSpots,2);

P = randperm(length(row),nSpots-1);
path_data = [data(P,:); data(end,:)];
[~,path_order] = sort(path_data(:,3));

for i = 1:nSpots
    centroids(i,:) = round(stats(i).Centroid);
end
cents = centroids;

end

