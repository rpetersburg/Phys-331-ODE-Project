clc 
clear
close all


x0    = 10.0;    % starting x.
y0    = 10.0;    % starting y.
z0    = 10.0;    % starting z.
u0    = 0.0;
v0    = 0.0;
w0    = 0.0;
t0    = 0.0;     % starting t.
t1    = 5.0;    % end t.
h     = 0.01;
ftx   = @derivs; % the functions.
test_ftx = @lorenz;
s     = @(t) 0;

nstep = (t1-t0)/h;
h0 = t1 - t0;
tol = 10^-4;
t(1) = t0;
x(:,1) = [x0;y0;z0;u0;v0;w0];

for r = [10,22,24.5,100,126.52,150,166.3,212]
    disp(r)
    for i = 1:nstep
        [x(:,i+1)] = rk4step2(x(:,i),ftx,t(i),h,s,r);
        t(i+1,1) = t(i) + h;
    end
    
    subplot(2,2,1)
    plot3(x(1,:),x(2,:),x(3,:))
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title('Lorenz System Solution (x,y,z)')
    grid on
    axis square

    subplot(2,2,2)
    plot3(x(4,:),x(5,:),x(6,:))
    xlabel('u')
    ylabel('v')
    zlabel('w')
    title('Lorenz System Solution (u,v,w)')
    grid on
    axis square    

    subplot(2,3,4)
    plot(abs(x(4,:)-x(1,:)))
    xlabel('t')
    ylabel('u-x')
    title('u(t)-x(t)')
    grid on

    subplot(2,3,5)
    plot(abs(x(5,:)-x(2,:)))
    xlabel('t')
    ylabel('v-y')
    title('v(t)-y(t)')
    grid on

    subplot(2,3,6)
    plot(abs(x(6,:)-x(3,:)))
    xlabel('t')
    ylabel('w-z')
    title('w(t)-z(t)')
    grid on

    pause
end

