% Final Project - Chaos in ODEs
% Donnie Mattingly and Ryan Petersburg
% 
% Part 2 -- Signal Function
%====================================%
% input:
%   t      : time
%   sig    : signal array
%   h      : stepsize
% output:
%   s      : signal function value at time t
%---------------------------------------

function [s] = signal(t,sig,h)

index = int32((t+h)/h);
s = sig(index);

end

