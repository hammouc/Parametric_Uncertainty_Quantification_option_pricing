function [] = prix_approximation_PCdensity(p,J,S,mg,sg,t,K,T,r)
%This function plots the density of the put price using surrogate PC/MC
%method
poly=Hermite_polynomial_construction(p+1);
sigma=randn(1000000,1);
 V1=zeros(length(sigma),1);   
for k=1:p+1
    V=PC_approximation_normal(J,k,mg,sg,S,t,K,T,r)*polyval(poly(k,:),sigma); 
    V1=V+V1;

end
xi=linspace(0,300,70);
f2 = ksdensity(V1,xi);
f2(1)=0;
plot(xi,f2,'r');

end
