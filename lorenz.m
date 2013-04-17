% Final Project - Chaos in ODEs
% Donnie Mattingly and Ryan Petersburg
% 
% Part 1 -- Lorenz System Equations
%====================================%

function [sys] = lorenz(t,x,r)

sigma = 10;
b = 8.0/3.0;
dx = zeros(1,3);

dx(1) = sigma * (x(2) - x(1));
dx(2) = r*x(1) - x(2) - x(1)*x(3);
dx(3) = x(1)*x(2) - b*x(3);

end
