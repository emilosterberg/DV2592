function enhancedImage = blobHighlight(image)
gray_image = rgb2gray(image);

% ----------- Code taken from MATLAB documentation: Start ----------- 
% MATLAB documentation: 'Increase Filter Strength Radially Outward'
% Vignette Image Using 1/R^2 Weighting Function

% Get the size of the image.
sizex = size(gray_image,2);
sizey = size(gray_image,1);

%Specify the center of the vignette.
xcenter = size(gray_image,2)/2;
ycenter = size(gray_image,1)/2;

%Define the x- and y-coordinates of the surface.
[X,Y] = meshgrid((1:sizex)-xcenter,(1:sizey)-ycenter);

%Define the radius from the center at each (x,y) coordinate.
R2 = X.^2 + Y.^2;

%Define the weighting function as the inverse of R, scaled to the range [0, 1].
R2 = rescale(R2);
weights = (1-R2);
% ----------- Code taken from MATLAB documentation: End ----------- 


binary_image = ~imbinarize(gray_image,'adaptive','ForegroundPolarity','dark','Sensitivity',0.1); % Convert to binary image

% Only worked when done in this order
weights = cast(0.65*weights,'uint8');   % Change size of vignette, convert to uint8
weights = logical(weights); % Convert vignette to binary

enhancedImage = binary_image.*weights; % Remove vignetted area from frame/image
imshow(enhancedImage)
end

