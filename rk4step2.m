% input:
%   x      : initial x value, scalar
%   f      : inline function (RHS of ODE)
%   t      : starting t.
%   h      : stepsize
% output:
%   x      : updated result
%---------------------------------------

function [x] = rk4step2(x,f,t,h,s,r)

  K1=f(t,x,s,r);
  K2=f(t+.5*h,x+.5.*K1*h,s,r);
  K3=f(t+.5*h,x+.5.*K2*h,s,r);
  K4=f(t+h,x+K3*h,s,r);
  x=x+(1/6)*(K1+2*K2+2*K3+K4)*h;

  return
end
