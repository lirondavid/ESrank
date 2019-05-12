function [lowerBound,upperBound]=rankPair(X,nx,Y,ny,pPair,b)

i=1;
j=ny;
lowerBound=0;
upperBound=0;

while(i<=nx && j>=1)
    if X(i,1)*Y(j,1)>=pPair
        upperBound=upperBound+Y(j,2);
        lowerBound=lowerBound+Y(j,3);
        if i>=b+1
            upperBound=upperBound+uPrev*(X(i,2)-X(i-1,2)-1);
            lowerBound=lowerBound+Y(j,3)*(X(i,2)-X(i-1,2)-1);
        end
        uPrev=Y(j,2);
        i=i+1;
     elseif j>1
         if X(i,1)*Y(j,1)>pPair  && X(i,1)*Y(j-1,1)<pPair
            upperBound=upperBound+Y(j,2)-1;
            lowerBound=lowerBound+Y(j-1,3)+1;
            if i>=b+1
                upperBound=upperBound+uPrev*(X(i,2)-X(i-1,2)-1);
                lowerBound=lowerBound+(Y(j-1,3)+1)*(X(i,2)-X(i-1,2)-1);
            end
            uPrev=Y(j,2)-1;
            i=i+1;
         else
             j=j-1;
         end
    else
        j=j-1;
    end
end
if j<1 && i<=nx
    if j==0 && i==1
        upperBound=1;
        lowerBound=1;
    else
         upperBound=upperBound+uPrev*(X(i,2)-X(i-1,2)-1);
    end
end
   