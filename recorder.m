% Final Project - Chaos in ODEs
% Donnie Mattingly and Ryan Petersburg
% 
% Part 2 -- Recording Function
%====================================%

function [recording] = recorder(time)

recObj = audiorecorder(8000,8,1,0);
disp('Begin Recording')
recordblocking(recObj, time);
disp('End of Recording.');
recording = getaudiodata(recObj);

end

