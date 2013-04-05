clc 
clear
close all


nstep = 100;   % number of steps
x0    = 10.0;    % starting x.
y0    = 10.0;    % starting y.
z0    = 10.0;    % starting z.
u0    = 20.0;
v0    = 0.0;
w0    = 0.0;
t0    = 0.0;     % starting t.
t1    = 5.0;    % end t.
h     = 0.01;
ftx   = @lorenz2; % the functions.

h0 = t1 - t0;
tol = 10^-4;
t(1) = t0;
x(1,:) = [x0,y0,z0,u0,v0,w0];

for i = 1:nstep
    [x(i+1,:)] = rk4step(x(i,:),ftx,t(i),h);
    t(i+1,1) = t(i) + h;
end

plot3(x(:,1),x(:,2),x(:,3))
xlabel('x')
ylabel('y')
zlabel('z')
title('Lorenz System Solution (x,y,z)')
grid on
axis square

pause

plot3(x(:,4),x(:,5),x(:,6))
xlabel('u')
ylabel('v')
zlabel('w')
title('Lorenz System Solution (u,v,w)')
grid on
axis square