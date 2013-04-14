% Final Project
% Lorenz System
% 
% ==============================

function [sys] = lorenz(t,x,r)

sigma = 10;
b = 8.0/3.0;

dx1 = sigma * (x(2) - x(1));
dx2 = r*x(1) - x(2) - x(1)*x(3);
dx3 = x(1)*x(2) - b*x(3);

sys = [dx1,dx2,dx3];

end
