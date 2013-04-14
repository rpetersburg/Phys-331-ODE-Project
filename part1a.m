clc 
clear
close all


nstep = 10000;   % number of steps
t0    = 0.0;     % starting t.
t1    = 100.0;    % end t.
r     = 10.0;
ftx   = @lorenz; % the functions.

h0 = t1 - t0;
tol = 10^-4;
t(1) = t0;
% x(1) = x0;
% y(1) = y0;
% z(1) = z0;

figure
% for r = [10,22,24.5,100,126.52,150,166.3,212]
for r = 22
    figure
    hold all
    for m = 0:2
        
        x0    = 10.0 + m*10^-4;    % starting x.
        y0    = 10.0 + m*10^-4;    % starting y.
        z0    = 10.0 + m*10^-4;    % starting z.
        x(1,:) = [x0,y0,z0];
    
        [t(2,:),x(2,:),h(1,1)] = rk4adapt(x(1,:),ftx,t(1),h0,tol,r);

        for i=2:nstep
            [t(i+1,:),x(i+1,:),h(i,1)] = rk4adapt(x(i,:),ftx,t(i),h(i-1),tol,r);
            if t(i+1) >= t1
                break
            end    
        end
        k = 1;
        z_max = zeros(4,1);
        for i = 1:size(x,1)-1
            if x(i+1,3) > x(i,3)
                z_max(k,1) = x(i+1,3);
                k = k+1;
            end
        end
        
        plot3(x(:,1),x(:,2),x(:,3))
        xlabel('x')
        ylabel('y')
        zlabel('z')
        title(strcat('Lorenz System (x,y,z), r=',num2str(r)))
        grid on
        axis square
        
        pause

        %hgsave(strcat('Lorenz System (x,y,z), r=',num2str(r)))

    end
    fprintf(1,'Press enter to continue...\n');
    pause
    clc
end