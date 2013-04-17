% Final Project - Chaos in ODEs
% Donnie Mattingly and Ryan Petersburg
% 
% Part 1 -- Stability of Solutions
%====================================%
clc 
clear
close all
%========== Initial Values ==========%
nstep = 10000;   % number of steps
x0    = 10.0;    % starting x.
y0    = 10.0;    % starting y.
z0    = 10.0;    % starting z.
t0    = 0.0;     % starting t.
t1    = 100.0;    % end t.
ftx   = @lorenz; % the functions.

%====================================%
h0 = t1 - t0;
tol = 10^-5;
t(1) = t0;
x(1,:) = [x0,y0,z0];

%===== Iterate over r-values =====%
j = 1;
for r = 25:.5:250
    fprintf(1,'r = %6.5g\n',r);
    rarr(j) = r;
    
    %===== Solve the system =====%
    [t(2,:),x(2,:),h(1,1)] = rk4adapt(x(1,:),ftx,t(1),h0,tol,r);

    for i=2:nstep
        [t(i+1,:),x(i+1,:),h(i,1)] = rk4adapt(x(i,:),ftx,t(i),h(i-1),tol,r);
        if t(i+1) >= t1
            break
        end    
    end
    
    %===== Lorenz Map Values =====%
    k = 1;
    z_max = zeros(4,1);
    for i = 2:size(x,1)-1
        if (x(i+1,3) < x(i,3)) && (x(i-1,3) < x(i,3))
            z_max(k,1) = x(i,3);
            k = k+1;
        end
    end
    
    %===== Repeat Lorenz Map Values =====%
    z_end1 = z_max(size(z_max,1));
    z_end2 = z_max(size(z_max,1)-1);
    z_end3 = z_max(size(z_max,1)-2);
    count = 0;
    for i = 1:size(z_max,1)-1
        if abs(z_max(i)-z_end1) < .5 || abs(z_max(i)-z_end2) < .5 || abs(z_max(i)-z_end3) < .5
            count = count + 1;
        end
    end
    
    cntarr(j) = count;
    j = j+1;
end

%======== Plotting for Stability ========%
plot(rarr,1.05.^cntarr)
xlabel('r')
ylabel('stability')
title('Stability of Lorenz Solution')


