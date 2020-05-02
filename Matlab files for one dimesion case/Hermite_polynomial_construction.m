function [ phi ] = Hermite_polynomial_construction(N)
% This function constructs the hermite polynomials
ph=zeros(1,N);
phi(1,:)=[zeros(1,N-1),1];
d=phi(1,:);
for k=2:N 
    teta=1;
    gamma=(k-2);
    d3= teta*d;
    d5=gamma*ph;
    phi(k,:)=[d3(2:N),0]-d5;
    ph=d;
    d=phi(k,:);
end
end

