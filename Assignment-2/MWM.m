function MWM(myChosenVideo)

% where: 'myChosenVideo' is the input video file 
%(example 'circle.mp4' or 'radial.mp4')

%Below is a suggested breakdown

%Read the video file myChosenVideo
video = VideoReader(myChosenVideo);

%Extract and process each frame / create and call functions as needed
start = 85; % Given starting frame
allFrames = cell(1,video.NumFrames-start); % Creates empty cell array

% retrives every frame from frame #85 until ending
itr = 1;
for i = start:video.NumFrames
    allFrames{itr} = read(video,i);
    itr = itr + 1;
end

centroids = zeros(length(allFrames),2); % Empty array for the blob centroid in each frame
for i = 1:length(allFrames)
    enhancedImage = blobHighlight(allFrames{i});    % Isolate moving blob(mouse)
    % Read centroid for blob(mouse)
    stats = regionprops(enhancedImage);
    %temp1 = stats.Centroid;
    centroids(i,:) = round(stats.Centroid);
end

%Create and construct the output video with mouse tracked path
% Creates empty arrays for the interpolation path
X = [];
Y = [];
yellow = cast([255 255 0],'uint8');  % Yellow colour in uint8 format
for i = 1:length(allFrames)
   if i == 1    % starting frame is just a point
      x = centroids(i,2);
      y = centroids(i,1);
   else
       % Interpolates a line between current en previous centroids with
       % given method
       [x,y] = intline(centroids(i-1,1),centroids(i,1),centroids(i-1,2),centroids(i,2));
   end
   % Adds current interpolation path to all previous ones
   X = [X; x];
   Y = [Y; y];
   % Draws the path on top of current frame
   for j = 1:length(X)
       for k = 0:1  % wider line in x-direction
           for m = 0:1  % wider line in y-direction
                allFrames{i}(Y(j)+m,X(j)+k,:) = yellow';
           end
       end
   end
end

%Write the video to a file
% v = VideoWriter('trackedMouse','MPEG-4');   % Creates new video file
% open(v); % open the newly created video file
% for i = 1:length(allFrames) % Add all frames to create a video
%     writeVideo(v,allFrames{i});
% end
% close(v) % Closing the video file

end