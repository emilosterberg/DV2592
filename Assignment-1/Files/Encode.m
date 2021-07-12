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

rng(k)  % Set rng with given key
temp = reshape(randperm(numel(Sec)),435,1024); % Random indices, the size of image
stego = uint8(Sec(temp));   % Randomizes the binary image and converts to uint8

ImC = getPlanes(Im);    % Retrives all bit-planes (Green)

for i = 2:8
    stego = stego + ImC{i}; % Makes sum of all planes except LSB where the scrambled binary image takes its place
end

Im(:,:,2) = stego;  % Replaces the green space with the new with the scrambled binary image included.
stego = Im;
end