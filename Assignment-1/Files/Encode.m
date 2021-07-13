function stego = Encode(Im, Sec, k)
% Where the inputs are:
% Im: The cover original RGB image
% Sec: The secret binary image of the same dimensions as Im
% k: a secret key for randomisation can be a string 'myPassWord2020!'
%    or a digit 21545422, choosing any option is fine with me

% The output, stego: is the RGB image containing the embeded randomised data
% Example use:
% stego = Encode ( 'BTH.png', 'Binary.png', 'myPassWord2020!')
% 

% Hints:
% Control the randomisation engine using a seed (which is obviously your key k)
% Embed in the bit plane 0 (LSB) to have less distortion
% The following functions could be of use (some are optional, check MATLAB documentations): 
% bitxor, bitget, bitset, randperm, rng, imread, imwrite, imshow, 
% imshowpair, montage, subplot, figure, title, str2double

rng(k)  % Set rng seed with given key
S = size(Im);   % Size of image
temp = reshape(randperm(numel(Sec)),S(1:2)); % Random indices, the size of image
stego = uint8(Sec(temp));   % Randomizes the secret binary image and converts to uint8

ImPlanes = getPlanes(Im);    % Retrives all bit-planes (Green)

for i = 2:8
    % Makes sum of all bit-planes except LSB where the scrambled binary 
    % image takes its place
    stego = stego + ImPlanes{i};
end

Im(:,:,2) = stego;  % Replaces the green space with the new with the scrambled binary image included.
stego = Im;
end