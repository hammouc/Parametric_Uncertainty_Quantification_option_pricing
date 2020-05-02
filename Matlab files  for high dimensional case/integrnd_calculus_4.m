function z = integrnd_calculus_4(x)
%This function constructs the integrand used by Sparse grid quadrature method to
%compute the basket put price for four dimensional case
K=1;
r=0.05;
T=1;
d=length(x);
w=0.25*ones(1,4);
S=ones(1,4);
V=[0.1457 0.5946 0.5613 0.5569;0.0223 -0.0536 -0.6770 0.7337;-0.7865 -0.4149 0.3393 0.3067;0.5997 -0.6866 0.3338 0.2396];
cov=V*diag([0.01141+x(1)*0.001 0.02642+x(2)*0.0023 0.0557+x(3)*0.005 0.4214+x(4)*0.0371 ])*inv(V);

price=(BasketCall_Besser_approximation(S,cov,r,T,K,w))+K*exp(-r*T)-S*w';
z = 1/(sqrt(2*pi)^d)*(price^2)*exp(0.5*sum(x.^2));
end