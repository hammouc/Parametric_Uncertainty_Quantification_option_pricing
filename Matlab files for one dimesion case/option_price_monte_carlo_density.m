function [] = option_price_monte_carlo_density( mg,sg,S,t,K,T,r )
%This function plots the density of the put price using Standard MC method
sigma=lognrnd(mg,sg,1000000,1);
v=Option_value( S,t,sigma,K,T,r);

xi=linspace(0,300,70);
f1 = ksdensity(v,xi);
f1(1)=0;
plot(xi,f1,'o');

xlabel('x')
ylabel('Density function')
grid on

end