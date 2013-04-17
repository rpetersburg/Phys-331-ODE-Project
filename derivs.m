% Final Project - Chaos in ODEs
% Donnie Mattingly and Ryan Petersburg
% 
% Part 2 -- Coupled Lorenz System Equations
%====================================%
function dx = derivs(t,x,s,r)

%Coupled System of 6 ODEs
sigma=10;
b=8/3;
dx = zeros(6,1);

dx(1)=sigma*(x(2)-x(1));
dx(2)=r*x(1)-x(2)-x(1)*x(3);
dx(3)=x(1)*x(2)-b*x(3);
dx(4)=sigma*(x(5)-x(4));
dx(5)=r*(x(1)+s(t))-x(5)-(x(1)+s(t))*x(6);
dx(6)=(x(1)+s(t))*x(5)-b*x(6);


end