% input:
%   y      : initial y value, scalar
%   f      : inline function (RHS of ODE)
%   x      : starting x.
%   h      : stepsize
% output:
%   y      : updated result
%---------------------------------------



function [y] = rk3step(y,f,x,h)
c1=1/6;
c2=4/6;
c3=1/6;
a2=1/2;
b21=1/2;
a3=1;
b31=-1;
b32=2;


K1=f(x,y);
K2=f((x+a2*h),(y+b21*K1*h));
K3=f((x+a3*h),(y+b31*K1*h+b32*K2*h));

y=y+(c1*K1+c2*K2+c3*K3)*h;

end

