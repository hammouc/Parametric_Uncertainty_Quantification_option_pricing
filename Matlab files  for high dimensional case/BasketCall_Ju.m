function price = BasketCall_Ju(S,sig,rho,r,T,K,q,w)
%This method computes the price of a basket call by the Ju's approximation
DF = exp(-r*T);
N = length(S); % number of assets
S_bar = (S.*exp(-q*T)/DF) .* w;
rho_bar = (sig'*sig).*rho*T;
% first moment
U1 = sum(S_bar);
% second moment
U2 = @(zsquare) S_bar*exp(zsquare*rho_bar)*S_bar';
% mean of a normal r.v.
m = @(zsquare) 2*log(U1)-0.5*log(U2(zsquare));
% variance of a normal r.v.
v = @(zsquare) log(U2(zsquare))-2*log(U1);
dU2_0 = S_bar*rho_bar*S_bar';
d2U2_0 = S_bar*(rho_bar.^2)*S_bar';
d3U2_0 = S_bar*(rho_bar.^3)*S_bar';
a1 = @(z) -z^2*dU2_0/(2*U2(0));
a2 = @(z) 2*a1(z)^2-z^4*d2U2_0/(2*U2(0));
a3 = @(z) 6*a1(z)*a2(z)-4*a1(z)^3-z^6*d3U2_0/(2*U2(0));
bE = 0;
for i = 1 : N
for j = 1 : N
for k = 1 : N
    bE = bE+S_bar(i)*S_bar(j)*S_bar(k)*rho_bar(i,k)*rho_bar(j,k);
end
end
end
bE = 2*bE;
b1 = @(z) (z^4*bE)/(4*U1^3);
b2 = @(z) a1(z)^2-0.5*a2(z);
cE = zeros(4,1);
for i = 1 : N
for j = 1 : N
for k = 1 : N
for l = 1 : N
 cE(1) = cE(1)+S_bar(i)*S_bar(j)*S_bar(k)*S_bar(l)*rho_bar(i,l)*rho_bar(j,k)*rho_bar(k,l);
 cE(2) = cE(2)+S_bar(i)*S_bar(j)*S_bar(k)*S_bar(l)*rho_bar(i,l)*rho_bar(j,l)*rho_bar(k,l);
end
 cE(3) = cE(3)+S_bar(i)*S_bar(j)*S_bar(k)*rho_bar(i,k)*rho_bar(j,k)^2;
 cE(4) = cE(4)+S_bar(i)*S_bar(j)*S_bar(k)*rho_bar(i,j)*rho_bar(i,k)*rho_bar(j,k);
end
end
end
cE = cE.*[8;6;6;8];
cE(1) = cE(1)+2*dU2_0*d2U2_0;
c1 = @(z) -a1(z)*b1(z); 
c2 = @(z) (z^6/(144*U1^4))*(9*cE(1)+4*cE(2));
c3 = @(z) (z^6/(48*U1^3))*(4*cE(3)+cE(4));
c4 = @(z) a1(z)*a2(z)-(a1(z)^3)*2/3-a3(z)/6;
d1 = @(z) 0.5*(6*a1(z)^2+a2(z)-4*b1(z)+2*b2(z))-(1/6)*(120*a1(z)^3-a3(z)+6*(24*c1(z)-6*c2(z)+2*c3(z)-c4(z)));
d2 = @(z) 0.5*(10*a1(z)^2+a2(z)-6*b1(z)+2*b2(z))-((128/3)*a1(z)^3-a3(z)/6+2*a1(z)*b1(z)-a1(z)*b2(z)+50*c1(z)-11*c2(z)+3*c3(z)-c4(z));
d3 = @(z) (2*a1(z)^2-b1(z))-(1/3)*(88*a1(z)^3+3*a1(z)*(5*b1(z)-2*b2(z))+3*(35*c1(z)-6*c2(z)+c3(z)));
d4 = @(z) (-20/3)*a1(z)^3+a1(z)*(-4*b1(z)+b2(z))-10*c1(z)+c2(z);
z1 = d2(1)-d3(1)+d4(1);
z2 = d3(1)-d4(1);
z3 = d4(1);
y = log(K);
root = sqrt(v(1));
y1 = (m(1)-y)/root+root;
y2 = y1-root;
p = @(x) exp(-(x-m(1))^2/(2*v(1)))/sqrt(2*pi*v(1));
dp = @(x) -(x-m(1))/v(1)*p(x);
d2p = @(x) -p(x)/v(1)-(x-m(1))/v(1)*dp(x);
price = DF*( (U1*normcdf(y1)-K*normcdf(y2)) + K*(z1*p(y)+z2*dp(y)+z3*d2p(y)) );
end
