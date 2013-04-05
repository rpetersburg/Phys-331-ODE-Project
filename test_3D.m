clc 
clear
close all


nstep = 10000;   % number of steps
x0    = 10.0;    % starting x.
y0    = 10.0;    % starting y.
z0    = 10.0;    % starting z.
t0    = 0.0;     % starting t.
t1    = 5.0;    % end t.
ftx   = @lorenz; % the functions.

h0 = t1 - t0;
tol = 10^-4;
t(1) = t0;
% x(1) = x0;
% y(1) = y0;
% z(1) = z0;
x(1,:) = [x0,y0,z0];

[t(2,:),x(2,:),h(1,1)] = rk4adapt(x(1,:),ftx,t(1),h0,tol);

for i=2:nstep
    [t(i+1,:),x(i+1,:),h(i,1)] = rk4adapt(x(i,:),ftx,t(i),h(i-1),tol);
    if t(i+1) >= t1
        break
    end    
end


plot3(x(:,1),x(:,2),x(:,3))
xlabel('x')
ylabel('y')
zlabel('z')
title('Lorenz System Solution')
grid on
axis square