function [lower,upper] = ESrank(gamma,b,d,keyProb) 

X=zeros(1,2,d);
nx=zeros(1,d);
for i=1:d
    prob = csvread(strcat(num2str(i),'.txt'));
    nx(i)=size(prob,1);
    [S,ns]=sample(prob(1:nx(i),1),nx(i),gamma,b);
    X(1:ns+2,1:2,i)=S;
    nx(i)=ns;
end

Y=zeros(nx(1)+2,3);
Y(1:nx(1)+2,1)=X(1:nx(1)+2,1,1);
Y(1:nx(1)+2,2)=X(1:nx(1)+2,2,1);
Y(1:nx(1)+2,3)=X(1:nx(1)+2,2,1);
ny=nx(1);

for i=2:d-1
    [Y,ny]=sampleMerge(X(1:nx(i)+2,:,i),nx(i),Y,ny,gamma,b);
end

[lower,upper] = rankPair(X(1:nx(d),1:2,d),nx(d),Y(1:ny,1:3),ny,keyProb,b); 

end
