
function z = integrnd_calculus(x)
%This function constructs the integrand used by Sparse grid quadrature method to
%compute the basket put price for six dimensional case
K=1;
r=0.05;
T=1;
d=length(x);

w=1/6*ones(1,6);
S=ones(1,6);
V=[-0.1078 -0.1215 -0.4375 -0.7229 -0.0290 0.5088; -0.0211 -0.0146 0.0087 0.4768 -0.5989 0.6429; 0.7183 0.4066 0.4156 -0.2268 0.1017 0.2902;...
-0.5499 -0.1113 0.7604 -0.2034 0.1163 0.2283;0.2666 -0.6684 -0.0100 0.2742 0.5576 0.3097;-0.3138 0.6004 -0.2399 0.2865 0.5529 0.3092];
cov=V*diag([0.0102476+x(1)*0.00089016 0.0154993+x(2)*0.00134005 0.0248548+x(3)*0.00214891 0.04414+x(4)*0.00382235 0.0992788+x(5)*0.0087392  0.50251+x(6)*0.0440465])*inv(V);

price=(BasketCall_Besser_approximation(S,cov,r,T,K,w))+K*exp(-r*T)-S*w';
z = 1/(sqrt(2*pi)^d)*price*exp(0.5*sum(x.^2));
end