function dy = derivs(t,y,s,r)
%Coupled System of 6 ODEs
sigma=10;
b=8/3;
dy=zeros(6,1);
dy(1)=sigma*(y(2)-y(1));
dy(2)=r*y(1)-y(2)-y(1)*y(3);
dy(3)=y(1)*y(2)-b*y(3);
dy(4)=sigma*(y(5)-y(4));
dy(5)=r*(y(1)+s(t))-y(5)-(y(1)+s(t))*y(6);
dy(6)=(y(1)+s(t))*y(5)-b*y(6);


end

