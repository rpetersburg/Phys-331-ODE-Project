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
title('Lorenz System Solution (x,y,z)')
grid on
axis square

clc
fprintf(1,'Press enter to continue...\n');
pause

subplot(2,2,1)
plot(x(:,1),x(:,2))
xlabel('x')
ylabel('y')
title('Lorenz System (x,y)')
grid on

subplot(2,2,2)
plot(x(:,2),x(:,3))
xlabel('y')
ylabel('z')
title('Lorenz System (y,z)')
grid on

subplot(2,2,3)
plot(x(:,1),x(:,3))
xlabel('x')
ylabel('z')
title('Lorenz System (x,z)')
grid on

clc
fprintf(1,'Press enter to continue...\n');
pause

subplot(2,2,1)
plot(t,x(:,1))
xlabel('t')
ylabel('x')
title('Lorenz System x(t)')
grid on

subplot(2,2,2)
plot(t,x(:,2))
xlabel('t')
ylabel('y')
title('Lorenz System y(t)')
grid on

subplot(2,2,3)
plot(t,x(:,3))
xlabel('t')
ylabel('z')
title('Lorenz System z(t)')
grid on

