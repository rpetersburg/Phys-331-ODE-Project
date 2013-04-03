% Final Project
% function [x,y] = rk4adapt(x,y,f)
%
% Advancing solution by one single RK4 adaptive step.
%
% input:
%   y      : initial y value, scalar
%   f      : inline function (RHS of ODE)
%   x      : starting x.
% output:
%   y      : updated y-value
%   x      : updated x-value
%---------------------------------------

function [x,y,h] = rk4adapt(y0,f,x0,h0,tol)

% Set initial value for tau
[y_rk3] = rk3fixed(y0,f,x0,h0);
[y_rk4] = rk4fixed(y0,f,x0,h0);

tau = abs(y_rk4 - y_rk3);

% Decrease the stepsize until tau is less than tolerance
while tau > tol
    h = 0.9 * h0 * tol / tau;
    [y_rk3] = rk3fixed(y0,f,x0,h);
    [y_rk4] = rk4fixed(y0,f,x0,h);
    tau = abs(y_rk4 - y_rk3);
end

% Set the error in the stepsize to just below the tolerance
while tau < tol
    h = 1/0.9 * h * tol / tau;
    [y_rk3] = rk3fixed(y0,f,x0,h);
    [y_rk4] = rk4fixed(y0,f,x0,h);
    tau = abs(y_rk4 - y_rk3);    
end
h = 0.9 * h * tau / tol;

% Determine the x and y values using determined stepsize
[y] = rk4fixed(y0,f,x0,h);
x = x0 + h;

end