% Final Project - Chaos in ODEs
% Donnie Mattingly and Ryan Petersburg
% 
% Part 2 -- Runga-Kutta Adaptive Method
%======================================%
% input:
%   x      : initial x value, scalar
%   f      : inline function (RHS of ODE)
%   t      : starting t.
%   h      : previous stepsize
%   tol    : tolerance for stepsize
%   r      : lorenz r-value
% output:
%   x      : updated x-value
%   t      : updated t-value
%   h      : used stepsize
%---------------------------------------

function [t,x,h] = rk4adapt(x,f,t,h,tol,r)

% Set initial value for tau
[x_rk3] = rk3step(x,f,t,h,r);
[x_rk4] = rk4step(x,f,t,h,r);

tau = sqrt(sum((x_rk4 - x_rk3).^2));

% Decrease the stepsize until tau is less than tolerance
while tau > tol
    h = 0.9 * h * tol / tau;
    [x_rk3] = rk3step(x,f,t,h,r);
    [x_rk4] = rk4step(x,f,t,h,r);
    tau = sqrt(sum((x_rk4 - x_rk3).^2));
end

% Set the error in the stepsize to just below the tolerance
while tau < tol
    h = 1.1 * h;
    [x_rk3] = rk3step(x,f,t,h,r);
    [x_rk4] = rk4step(x,f,t,h,r);
    tau = sqrt(sum((x_rk4 - x_rk3).^2));    
end
h = h / 1.1;

% Determine the t and x values using determined stepsize
[x] = rk4step(x,f,t,h,r);
t = t + h;

end