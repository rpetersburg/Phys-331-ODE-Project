
% input:
%   x      : initial x value, scalar
%   f      : inline function (RHS of ODE)
%   t      : starting t.
%   h      : stepsize
% output:
%   x      : updated result
%---------------------------------------

function [x] = rk4step(x,f,t,h)

  K1=f(t,x);
  K2=f(t+.5*h,x+.5.*K1.*h);
  K3=f(t+.5.*h,x+.5.*K2.*h);
  K4=f(t+h,x+K3.*h);
  x=x+(1/6).*(K1+2.*K2+2.*K3+K4).*h;

  return
end
