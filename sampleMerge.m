function [W,u]=sampleMerge(X,nx,Y,ny,gamma,b)

W=zeros(nx*ny,3);
sortedPoints=zeros(nx*ny,3);
N=nx*ny;

[b1,b2] = meshgrid(1:1:nx, 1:1:ny);
tt = X(b1(:),1).*Y(b2(:),1);
sortedPoints(1:N,1)=tt;
sortedPoints(1:N,2)=b1(:);
sortedPoints(1:N,3)=b2(:);
sortedPoints=sortrows(sortedPoints,-1);

Y(2:ny+1,2:3)=Y(1:ny,2:3);
Y(1,2:3)=0;
X(2:nx+1,2)=X(1:nx,2);
X(1,2)=0;
X(nx+2,2)=X(nx+1,2)+1;
Y(ny+2,2:3)=Y(ny+1,2:3)+1;

ip=sortedPoints(1:N-1,2);
jp=sortedPoints(1:N-1,3);
b1=(Y(jp+2,2)-Y(jp+1,2)).*(X(ip+2,2)-X(ip+1,2));
b1=[1;b1(1:N-1)];
upperBound=cumsum(b1);

ic=sortedPoints(2:N,2);
jc=sortedPoints(2:N,3);
b1=(Y(jc+1,3)-Y(jc-1+1,3)).*(X(ic+1,2)-X(ic-1+1,2));
b1=[1;b1(1:N-1)];
lowerBound=cumsum(b1);

W(1:b,1)=sortedPoints(1:b,1);
W(1:b,2)=1:1:b;
W(1:b,3)=1:1:b;
y=b+1;
u=b+1;
prevVal=upperBound(b);
while(y<=N-1)
 if ((upperBound(y)/prevVal<=(gamma) && upperBound(y+1)/prevVal>(gamma)) )% || upperBound(y)/prevVal>(gamma)
     W(u,1)=sortedPoints(y,1);
     W(u,2)=upperBound(y);
     W(u,3)=lowerBound(y);
     u=u+1;
     prevVal=upperBound(y);
 end
 y=y+1;
end

W(u,1)=sortedPoints(N,1);
last=X(nx+1,2)*Y(ny+1,2);
W(u,2)=last;
W(u,3)=last;
W=W(1:u,1:3);

end
