clc 
clear
close all


nstep = 10000;   % number of steps
x0    = 10.0;    % starting x.
y0    = 10.0;    % starting y.
z0    = 10.0;    % starting z.
t0    = 0.0;     % starting t.
t1    = 10.0;    % end t.
r     = 10.0;
ftx   = @lorenz; % the functions.

h0 = t1 - t0;
tol = 10^-4;
t(1) = t0;
% x(1) = x0;
% y(1) = y0;
% z(1) = z0;
x(1,:) = [x0,y0,z0];

for r = [10,22,24.5,100,126.52,150,166.3,212]
% for r = [5:5:100]
    
    [t(2,:),x(2,:),h(1,1)] = rk4adapt(x(1,:),ftx,t(1),h0,tol,r);

    for i=2:nstep
        [t(i+1,:),x(i+1,:),h(i,1)] = rk4adapt(x(i,:),ftx,t(i),h(i-1),tol,r);
        if t(i+1) >= t1
            break
        end    
    end
    k = 1;
    z_max = zeros(4,1);
    for i = 2:size(x,1)-1
        if x(i,3) > x(i+1,3) && x(i,3) > x(i-1,3);
            z_max(k,1) = x(i,3);
            k = k+1;
        end
    end

    figure

    plot3(x(:,1),x(:,2),x(:,3))
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title(strcat('Lorenz System (x,y,z), r=',num2str(r)))
    grid on
    axis square
    
    %hgsave(strcat('Lorenz System (x,y,z), r=',num2str(r)))
    clc
    fprintf(1,'Press enter to continue...\n');
    pause
    
    figure
    subplot(2,3,1)
    plot(x(:,1),x(:,2))
    xlabel('x')
    ylabel('y')
    title(strcat('Lorenz System (x,y), r=',num2str(r)))
    grid on
    
    subplot(2,3,2)
    plot(x(:,2),x(:,3))
    xlabel('y')
    ylabel('z')
    title(strcat('Lorenz System (y,z), r=',num2str(r)))
    grid on
    
    subplot(2,3,3)
    plot(x(:,1),x(:,3))
    xlabel('x')
    ylabel('z')
    title(strcat('Lorenz System (x,z), r=',num2str(r)))
    grid on
    
    %hgsave(strcat('Lorenz System Pairs, r=',num2str(r)))
    
    subplot(2,3,4)
    plot(t,x(:,1))
    xlabel('t')
    ylabel('x')
    title(strcat('Lorenz System x(t), r=',num2str(r)))
    grid on
    
    subplot(2,3,5)
    plot(t,x(:,2))
    xlabel('t')
    ylabel('y')
    title(strcat('Lorenz System y(t), r=',num2str(r)))
    grid on
    
    subplot(2,3,6)
    plot(t,x(:,3))
    xlabel('t')
    ylabel('z')
    title(strcat('Lorenz System z(t), r=',num2str(r)))
    grid on
    
    clc
    fprintf(1,'Press enter to continue...\n');
    pause
    
    figure
    
    plot(z_max(1:size(z_max,1)-1),z_max(2:size(z_max,1)),'+')
    xlabel('z_{max}')
    ylabel('z_{max}+1')
    title(strcat('Lorenz Map, r=',num2str(r)))
    grid on
    
    %hgsave(strcat('Lorenz System Time Plot, r=',num2str(r)))
    pause
    close all
end

