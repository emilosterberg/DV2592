clc;clear;close all

C = [255 0 0];

arrayDistance = zeros(60,1);
meanC = zeros(60,3);
for i = 1:60
    file = double(imread(join(['Images/' num2str(i) '.png'])));
    varR = 0;varG = 0; varB = 0;
    count = 0;
    for j = 1:size(file,1)
        for k = 1:size(file,2)
            if file(j,k,1) ~= 255 && file(j,k,2) ~= 255 && file(j,k,3) ~= 255 
              varR = varR + file(j,k,1);
              varG = varG + file(j,k,2);
              varB = varB + file(j,k,3);
              count = count + 1;
            end
        end
    end
    meanC(i,:) = [varR varG varB]./count;
    arrayDistance(i) = sqrt(sum((C-meanC(i,:)).^2));
end


[B,I] = sort(arrayDistance);

figure()
for i = 1:12
    subplot(3,4,i)
    imshow(imread(join(['Images/' num2str(I(i)) '.png'])));
    title(['Rank = ', num2str(i), ', Distance = ', num2str(B(i))])
end
    