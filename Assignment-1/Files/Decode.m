function Sec = Decode(Stego, k)
% Where the inputs are:
% stego: is the RGB image containing the embeded randomised data
% k: a secret key for restoration can be a string 'myPassWord2020!'
%    or a digit 21545422, choosing any option is fine with me

% The output, Sec: The secret binary image of the same dimensions as Im
% Example use:
% Sec = Decode ( 'Stego.png', 'myPassWord2020!')
% 

rng(k)  % Set rng with given key
ImC = getPlanes(Stego); % Retrives all bit-planes (Green)
bin = ImC{1};   % The hidden image is in the LSB-plane
temp = reshape(randperm(numel(bin)),435,1024);  % Random indices, the size of image
[~,ii] = sort(temp(:)); % Sroting the indices to retrive original order (vector)
Sec = logical(bin(reshape(ii,435,1024)));   % Reshapes to original image size and converts to binary image
end