clc;clear;close all
n = 9;
N = 5;
temp = cell(1,n);
names = ["Andreas" "Marie" "Mikael" "Stefan" "Ulf"];
allStd = zeros(1,N);
allMean = zeros(1,N);
for i = 1:N
    temp_std = zeros(1,n);
    temp_mean = zeros(1,n);
    for j = 1:n
        str = join(['people/' char(names(i)) '/' num2str(j+1) '.png']);
        temp_std(j) =  std(double(imread(str)),0,'all');
        temp_mean(j) =  mean(double(imread(str)),'all');
    end
    allStd(i) = sum(temp_std)/n;
    allMean(i) = sum(temp_mean)/n;
end


numbers = [1 4 5 7 8];
test_std = zeros(1,N);
test_mean = zeros(1,N);
for i = 1:N
    str = join(['Test/1_' num2str(numbers(i)) '.png']);
    test_std(i) =  std(double(imread(str)),0,'all');
    test_mean(i) =  mean(double(imread(str)),'all');
end


euc_dist = zeros(N,N);
for i = 1:N
    for j = 1:N
        euc_dist(i,j) = sqrt((allStd(j)-test_std(i))^2 + (allMean(j)-test_mean(i))^2);
    end
end


