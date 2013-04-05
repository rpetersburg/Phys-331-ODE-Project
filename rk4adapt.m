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

function [x,y,h] = rk4adapt(y,f,x,h,tol)

% Set initial value for tau
[y_rk3] = rk3step(y,f,x,h);
[y_rk4] = rk4step(y,f,x,h);

tau = sqrt(sum((y_rk4 - y_rk3).^2));

% Decrease the stepsize until tau is less than tolerance
while tau > tol
    h = 0.9 * h * tol / tau;
    [y_rk3] = rk3step(y,f,x,h);
    [y_rk4] = rk4step(y,f,x,h);
    tau = sqrt(sum((y_rk4 - y_rk3).^2));
end

% Set the error in the stepsize to just below the tolerance
while tau < tol
    h = 10 * h;
    [y_rk3] = rk3step(y,f,x,h);
    [y_rk4] = rk4step(y,f,x,h);
    tau = sqrt(sum((y_rk4 - y_rk3).^2));    
end
h = h / 10;

% Determine the x and y values using determined stepsize
[y] = rk4step(y,f,x,h);
x = x + h;

end