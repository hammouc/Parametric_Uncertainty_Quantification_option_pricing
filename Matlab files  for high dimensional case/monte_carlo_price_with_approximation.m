function [telapsed,y,X,std_error,z ] = monte_carlo_price_with_approximation(n,alpha) 
%This function computes the basket put price using MC coupled with Ju's
%approximation method
tstart=tic;
K=1;
T=1;
r=0.05;
%S=ones(1,6);
%w=[(1/6) (1/6)  (1/6)  (1/6) (1/6) (1/6) ];
%corr=[1.000	0.752	0.782	0.659	0.584	0.586 ;0.752	1.000	0.682	0.574	0.481	0.482 ;0.782	0.682	1.000	0.755	0.631	0.646;0.659	0.574	0.755	1.000	0.596	0.543;0.584	0.481	0.631	0.596	1.000	0.832; 0.586	0.482	0.646	0.543	0.832	1.000];
%sigma=[0.3978 0.5030 0.2407  0.2173 0.3002 0.3002];

S=ones(1,4);
w=[0.25 0.25 0.25 0.25 ];
corr=[1.000 0.752 0.782 0.659 ; 0.752 1.000 0.682 0.574;0.782 0.682 1.000 0.755;0.659 0.574 0.755 1.000 ];
sigma=[0.3978 0.5030 0.2407 0.2173];


Covariance = corr2cov(sigma, corr);

PP=zeros(1,n);

for k=1:n
S1 = wishrnd(Covariance,261)/261;
sig=sqrt(diag(S1));
rho= S1 ./ (sig*sig');
sig=sig';
PP(k)= BasketCall_Ju(S,sig,rho,r,T,K,0,w);
end
PP=(PP+(exp(-r*T)*K - S*w'));
y=mean(PP);
telapsed=toc(tstart);
z=var(PP);
std_error=(std(PP)/sqrt(n));
X = y+norminv([alpha/2 (1-alpha/2)],0,1)*(std_error);

end

