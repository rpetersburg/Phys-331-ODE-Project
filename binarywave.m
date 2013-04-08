function [s] = binarywave(t,A,w,phi)

% t = 0:Tp/1000:Tp;
s = A*(1+sign(sin(2*pi*w*t+phi))/2);

end

