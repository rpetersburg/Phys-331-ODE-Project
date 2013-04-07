clc
clear
close all
%%%%%
%%%%%   audiorecording and saving

%{
time=5; % length of audiorecording in seconds
recObj = audiorecorder;
disp('Begin Recording')
recordblocking(recObj, time);
disp('End of Recording.');
recording=getaudiodata(recObj);
%}
for r=10:10:240
%%%%%
%%%%%   Coupled Differential Equation Solver
nstep = 100;
dt    = .1;
y0    = .1*ones(6,1);
t     = 0:dt:(nstep*dt);
Y     = zeros(6,nstep);
Y(:,1)= y0;
f     = @derivs;
s     = @(t) t;
for l=2:nstep+1
      Y(:,l)=rk4step(Y(:,l-1),f,t(l-1),dt,s,r);
end

x = Y(1,:);
y = Y(2,:);
z = Y(3,:);
u = Y(4,:);
v = Y(5,:);
w = Y(6,:);

deltaUX(r/10,:) = abs(u-x);
deltaVY(r/10,:) = abs(v-y);
deltaWZ(r/10,:) = abs(w-z);

end

for l= 1:24
disp(l*10)   
hold all
plot(t,deltaUX(l,:),'r')
plot(t,deltaVY(l,:),'g')
plot(t,deltaWZ(l,:),'b')

pause
end


