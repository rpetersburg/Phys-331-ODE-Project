% Final Project - Chaos in ODEs
% Donnie Mattingly and Ryan Petersburg
% 
% Part 2 -- Coupled System Synchonization
%====================================%
clc 
clear
close all
%========== Initial Values ==========%
x0    = 10.0;    % starting x.
y0    = 10.0;    % starting y.
z0    = 10.0;    % starting z.
u0    = 00.0;
v0    = 00.0;
w0    = 00.0;
h     = .001;
t0    = 0;     % starting t.
t1    = 50;    % end t.
ftx   = @derivs; % the functions.
%====================================%
nstep = (t1-t0)/h;
tol = 10^-4;
t(1) = t0;
x(:,1) = [x0;y0;z0;u0;v0;w0];
s   = @(t) 0;

%===== Iterate over r-values =====%
for r = [10,22,24.5,100,126.52,150,166.3,212]
    
    %===== Solving the systems =====%
    for i = 1:nstep-1
        [x(:,i+1)] = rk4step2(x(:,i),ftx,t(i),h,s,r);
        t(i+1,1) = t(i) + h;
    end
    
    diff = sqrt((x(4,:)-x(1,:)).^2+(x(5,:)-x(2,:)).^2+(x(6,:)-x(3,:)).^2);
    
    %===== Plot the two solutions =====% 
    subplot(1,2,1)
    plot3(x(1,:),x(2,:),x(3,:),'b')
    hold on
    plot3(x(4,:),x(5,:),x(6,:),'g')
    xlabel('x,u')
    ylabel('y,v')
    zlabel('z,w')
    title(strcat('Lorenz System Solution (x,y,z) and (u,v,w), r = ',num2str(r)))
    grid on
    axis square

    %===== Plot the difference between the solutions =====%
    subplot(1,2,2)
    plot(t,diff)
    xlabel('t')
    ylabel('Distance')
    title('Difference between two solution sets')
    grid on

    fprintf(1,'Press enter to continue...\n');
    pause
    clc
end