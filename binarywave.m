function [x,t] = binarywave(A,Tp,w,phi)
t=0:Tp/1000:Tp
x=sign(A*sin(w*t+phi))
end

