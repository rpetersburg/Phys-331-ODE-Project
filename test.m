clc 
clear
close all


nstep = 10000;   % number of steps
iinteg= 0;    % type of integrator
x0    = 0.0;  % starting x.
y0    = -1.0; % starting y.
x1    = 3.0;  % end x.
fxy   = inline('-2*x-y'); % the function.
soln  = inline('-3*exp(-x)-2*x+2'); % the analytical solution

h0 = x1 - x0;
tol = 10^-4;
x(1) = x0;
y(1) = y0;

[x(2),y(2),h(1)] = rk4adapt(y(1),fxy,x(1),h0,tol);

for i=2:nstep
    [x(i+1),y(i+1),h(i)] = rk4adapt(y(i),fxy,x(i),h(i-1),tol);
    if x(i) >= 3
        break
    end    
end

[x45,y45] = ode45(fxy,[x0,x1],y0);

hold all
plot(x45,y45,'b')
plot(x,y,'g')