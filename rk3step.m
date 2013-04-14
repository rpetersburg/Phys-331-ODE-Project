% input:
%   x      : initial x value, scalar
%   f      : inline function (RHS of ODE)
%   t      : starting t.
%   h      : stepsize
% output:
%   x      : updated result
%---------------------------------------



function [x] = rk3step(x,f,t,h,r)
c1=1/6;
c2=4/6;
c3=1/6;
a2=1/2;
b21=1/2;
a3=1;
b31=-1;
b32=2;


K1=f(t,x,r);
K2=f((t+a2*h),(x+b21*K1*h),r);
K3=f((t+a3*h),(x+b31*K1*h+b32*K2*h),r);

x=x+(c1*K1+c2*K2+c3*K3)*h;

end

