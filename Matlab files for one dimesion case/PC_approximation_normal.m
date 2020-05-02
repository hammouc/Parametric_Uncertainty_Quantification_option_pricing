function [alpha] = PC_approximation_normal(J,p,mg,sg,S,t,K,T,r)
% This function computes the  PC coefficients of order p-1
[x,w]=GaussHermite_2(J);
phi=Hermite_polynomial_construction(J);
d=Option_value( S,t,exp(mg+sg*x),K,T,r).*polyval(phi(p,:),x).*((1/(sqrt(2*pi)))*exp(0.5*(x.^2)));
d1=w'*((polyval(phi(p,:),x).^2).*((1/sqrt(2*pi))*exp(0.5*x.^2)));
alpha= w'* d;
alpha=alpha/d1;
end

