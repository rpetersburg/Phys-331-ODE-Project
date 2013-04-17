% Final Project - Chaos in ODEs
% Donnie Mattingly and Ryan Petersburg
% 
% Part 2 -- Recording Transmission
%====================================%
clc 
clear
close all
%=====Program Options================
% intergrator 1 for RK4 and 2 for PC integrators
integrator        = 1; 
% recorder 1 for new recording 2 for saved recording
recordersource    = 1;

%======== Initial Values ============%
x0     = 10.0;    % starting x.
y0     = 10.0;    % starting y.
z0     = 10.0;    % starting z.
u0     = 5.0;     % starting u
v0     = 5.0;     % starting v
w0     = 5.0;     % starting z
h      = 1/8000;  % stepsize 
t0     = 0;       % starting time (s).
t1     = 5;       % end time (s).
ftx    = @derivs; % the functions.
offset = 4;       % intial period of zero signal (s)
tol    = 10^-4;   % tolerance 
r      = 10;      % r-value

%===========================================
nstep  = ((t1-t0)+offset)/h;       % calculating the number of steps
t(1)   = t0;                       % initializing t
x(:,1) = [x0;y0;z0;u0;v0;w0];      % initializing x 
time1  = 0:h:(t1-t0)-h;            % defining time vector of signal (excluding offset)
time   = 0:h:(t1+offset-t0)-h;     % total time vector
off    = zeros(1,offset/h);        % time vector of offset

%===========Determining Signal==============
switch recordersource
    case 1
recording = recorder(t1);                   % gets audio from recorder func
    case 2
        h  = 1/8000;
        t1 = 5;
recording  = importdata('gershwin.mat');   % uses saved audio data
end

% sig         = binarywave(10,4,0,t1,h);    % uses square wave for signal
% sig         =  10*sin(2*pi*time1);        % uses sine wave for signal
sig         =  recording';                  % uses audio recording for signal
% sig         =  ones(size(time1));         % uses step func as signal
sig         = cat(2,off,sig);               % concatenates offset with signal
% sig         = zeros(size(time));          % option for no signal
s           = @(t) signal(t,sig,h);         % defining function s for signal
                     % chooses the type of integrator

switch integrator 
    % Runge-Kutta 4th Order
    case 1  
for i = 1:nstep-1
    if mod(i,1000)==0      % display's progress of integration
        disp(i)
    end
    [x(:,i+1)] = rk4step2(x(:,i),ftx,time(i),h,s,r); % integrator
end
    % Adams-Bansford-Moulton Predictor-Corrector
    case 2
[x] = PCmethod(x,ftx,time,h,s,r,nstep);
    % Adapative Step ODE45 from matlab
    case 3
[t,x] = ode45(@(t,x) derivs(t,x,s,r),[0,15],x(:,1));
end


signal      = s(time(offset/h+1:end)); % defining our signal vector

transmitted = (x(1,:)+sig)-x(4,:); % defining our transmitted vector
transmitted = transmitted(1,offset/h+1:end);

%=================Plotting========================
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

subplot(2,2,3)
plot(transmitted)
xlabel('t')
ylabel('(x+s)-u')
title('Transmitted Signal')
grid on

subplot(2,2,4)
plot(signal)
xlabel('t')
ylabel('s')
title('Input Signal')
grid on

clc
fprintf(1,'Press enter to play original signal...\n');
pause;
soundsc(recording);
fprintf(1,'Press enter to play recovered signal...\n');
pause;
soundsc(transmitted);



