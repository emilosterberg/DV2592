function [userName, answer] = initialPrompts
global opt1
userName = inputdlg('What is your name?','Sample');
opt1 = 'Yes';
opt2 = 'No thank you';
answer = questdlg('Would you like to view the ranking?', ...
    'Options', ...
    opt1,opt2,opt2);
end

