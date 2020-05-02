function [ ] = monte_carlo_price_density_with_approx(n)
%This function plot both the sample density of basket put price and the
%normal density that best fits it
K=1;
T=1;
r=0.05;
%S=ones(1,4);
%w=[0.25 0.25 0.25 0.25 ];
%corr=[1.000 0.752 0.782 0.659 ; 0.752 1.000 0.682 0.574;0.782 0.682 1.000 0.755;0.659 0.574 0.755 1.000 ];
%sigma=[0.3978 0.5030 0.2407 0.2173];


S=ones(1,6);
w=[(1/6) (1/6)  (1/6)  (1/6) (1/6) (1/6) ];
corr=[1.000	0.752	0.782	0.659	0.584	0.586 ;0.752	1.000	0.682	0.574	0.481	0.482 ;0.782	0.682	1.000	0.755	0.631	0.646;0.659	0.574	0.755	1.000	0.596	0.543;0.584	0.481	0.631	0.596	1.000	0.832; 0.586	0.482	0.646	0.543	0.832	1.000];
sigma=[0.3978 0.5030 0.2407  0.2173 0.3002 0.3002];

Covariance = corr2cov(sigma, corr);
PP1=zeros(1,n);


for k=1:n
S1 = wishrnd(Covariance,261)/261;

PP1(k)= (BasketCall_Besser_approximation(S,S1,r,T,K,w));

end
PP1=(PP1+(exp(-r*T)*K - S*w'));
%PD = fitdist(PP1', 'normal');

[g,xi] = ksdensity(PP1);
bar(xi,g,'r')
hold on

%p=pdf('normal',xi,0.093138, 0.00487295);

p=pdf('normal',xi,0.0826437, 0.00448702);
plot(xi,p);
xlabel('Basket put price')
ylabel(' density')
legend(' sample density','fitting normal density ')

grid on
box on
boldify

set(gcf,'Color','w')
export_fig('six_density.eps')
end