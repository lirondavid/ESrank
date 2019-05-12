function [m,s]=sample(X,nx,gamma,b)

m=zeros(nx,2);  
m(1:b,1)=X(1:b,1);
m(1:b,2)=(1:1:b);

iPrev=b;
i=b+1;
s=b+1;
while(i<=nx-1)
   if ((i/iPrev)<=gamma && ((i+1)/iPrev)>gamma) 
      m(s,1)=X(i,1);
      m(s,2)=i;
      s=s+1;
      iPrev=i;
   end
   i=i+1;
end

m(s,1)=X(nx,1);
m(s,2)=nx;
m=m(1:s+2,1:2);

end
