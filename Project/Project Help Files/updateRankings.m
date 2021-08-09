function updateRankings
global attempts elpTime userName
Rows = [];
fileID = fopen('Ranking.txt','r');
textLine = fgetl(fileID);

Rows = [Rows; string(split(textLine," "))'];

while ischar(textLine)
    textLine = fgetl(fileID);
    if ischar(textLine)
        Rows = [Rows; string(split(textLine," "))'];
    end
end

Times = double(Rows(:,2));
temp = [string(userName{1});string(elpTime);string(attempts)]';
idx = sum(elpTime>Times);
Rows= [Rows(1:idx,:);temp;Rows(idx+1:end,:)];

fclose(fileID);

fileID = fopen('Ranking.txt', 'w');
for i = 1:length(Rows)
fprintf(fileID, '%s %s %s\n',Rows(i,:));
end
fclose(fileID);
end

