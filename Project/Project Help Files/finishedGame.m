function finishedGame
global elpTime attempts userName
msg = sprintf(['Mission Accomplished ' userName{1} '!\n You finished in ' ...
    num2str(elpTime) ' sec \n With # of attempts of: ' num2str(attempts)]);
msgbox(msg,'Status');
end


