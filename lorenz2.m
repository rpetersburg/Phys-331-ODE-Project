function [sys] = lorenz2(t,x)

sigma = 10;
b = 8.0/3.0;
r = 10.0;

dx1 = sigma * (x(2) - x(1));
dx2 = r*x(1) - x(2) - x(1)*x(3);
dx3 = x(1)*x(2) - b*x(3);

dx4 = sigma * (x(4) - x(3));
dx5 = r*x(1) - x(4) - x(1)*x(6);
dx6 = x(1)*x(4) - b*x(6);

sys = [dx1,dx2,dx3,dx4,dx5,dx6];

end
