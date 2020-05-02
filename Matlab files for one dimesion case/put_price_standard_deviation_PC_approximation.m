function [] = put_price_standard_deviation_PC_approximation(p,J,mg,sg,t,K,T,r)
%This function plots the standard deviation of the put price computed using PC  method for different
%stock prices 
[x,w]=GaussHermite_2(J);
S=(250:50:1750);
for j=1 : length(S)
var=0;
for k=2:p+1
    poly=Hermite_polynomial_construction(k);
    alpha=PC_approximation_normal(J,k,mg,sg,S(j),t,K,T,r);
    d1=w'*(((polyval(poly(k,:),x)).^2).* ((1/(sqrt(2*pi)))*exp(0.5*(x.^2))));
    var=var+d1*(alpha^2);
    
end
dev(j)=sqrt(var);
end
plot(S,dev,'r')
hold on

end