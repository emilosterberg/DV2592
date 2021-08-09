function showRanking
fileName = 'Ranking.txt';
    if exist(fileName, 'file') == 0
        questdlg('File Ranking.txt does not exist!', ...
                'Status', ...
                'OK','OK');
    else
        allLines = cell(1,1);
        labels = 'Rank Name ElpTime Attemps';
        labels = split(labels,' ');
        allLines{1} = sprintf('%-10s %-15s %-15s %s',labels{:});

        fileID = fopen(fileName,'r');
        textLine = fgetl(fileID);
        itr = 1;
        while ischar(textLine)
            temp = split(textLine,' ');
            A = num2str(14 - length(num2str(itr)));
            B = num2str(20 - length(temp{1}));
            C = num2str(30 - length(temp{2}));

            allLines{itr+1} = sprintf(['%-' A 's %-' B 's %-' C 's %s'],num2str(itr),temp{:});
            textLine = fgetl(fileID);
            itr = itr + 1;
        end
        fclose(fileID);
        msgbox(allLines,'Ranking');
    end

end

