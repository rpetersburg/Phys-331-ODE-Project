
% input:
%   y      : initial y value, scalar
%   f      : inline function (RHS of ODE)
%   x      : starting x.
%   h      : stepsize
% output:
%   y      : updated result
%---------------------------------------

function [y] = rk4step(y,f,x,h,s,r)

  K1=f(x,y,s,r);
  K2=f(x+.5*h,y+.5.*K1*h,s,r);
  K3=f(x+.5*h,y+.5.*K2*h,s,r);
  K4=f(x+h,y+K3*h,s,r);
  y=y+(1/6)*(K1+2*K2+2*K3+K4)*h;

  return
end
