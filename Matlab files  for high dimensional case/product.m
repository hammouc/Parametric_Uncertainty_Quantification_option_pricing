function [y,N]=product(d,n,f)
%Computation of the product quadrature rule
y=0;
p=1;
i=ones(1,d);
m=max(n);
w=zeros(m,d);
x=zeros(m,d);
a=-pi;
b=pi;
N=1;
for j=1:d
 
    [x((1:n(j)),j),w((1:n(j)),j)]=GaussHermite_2(n(j));
     N=N*n(j);
end
while(i~=0)
    ww=1;
    xx=zeros(1,d);
    for j=1:d
        ww=ww*w(i(j),j);
        xx(j)=x(i(j),j);
          
    end

    y=y+ww*f(xx);
    z=drop(p,i,n);
    i=z;
end
end

