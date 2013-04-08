% Final Project
% function [t,x] = rk4adapt(t,x,f)
%
% Advancing solution bx one single RK4 adaptive step.
%
% input:
%   x      : initial x value, scalar
%   f      : inline function (RHS of ODE)
%   t      : starting t.
% output:
%   x      : updated x-value
%   t      : updated t-value
%---------------------------------------

function [t,x,h] = rk4adapt(x,f,t,h,tol)

% Set initial value for tau
[x_rk3] = rk3step(x,f,t,h);
[x_rk4] = rk4step(x,f,t,h);

tau = sqrt(sum((x_rk4 - x_rk3).^2));

% Decrease the stepsize until tau is less than tolerance
while tau > tol
    h = 0.9 * h * tol / tau;
    [x_rk3] = rk3step(x,f,t,h);
    [x_rk4] = rk4step(x,f,t,h);
    tau = sqrt(sum((x_rk4 - x_rk3).^2));
end

% Set the error in the stepsize to just below the tolerance
while tau < tol
    h = 10 * h;
    [x_rk3] = rk3step(x,f,t,h);
    [x_rk4] = rk4step(x,f,t,h);
    tau = sqrt(sum((x_rk4 - x_rk3).^2));    
end
h = h / 10;

% Determine the t and x values using determined stepsize
[x] = rk4step(x,f,t,h);
t = t + h;

end