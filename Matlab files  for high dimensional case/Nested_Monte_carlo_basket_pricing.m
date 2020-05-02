function [ telapsed,P,X,std_error] = Nested_Monte_carlo_basket_pricing( n1,n2,alpha)
% This function is a nested MC without using approximation methods for the
% basket option price
tstart=tic;
d=4;
K=1;
T=1;
r=0.05;
%S0=ones(1,6);
%w=[(1/6) (1/6)  (1/6)  (1/6) (1/6) (1/6) ];
%corr=[1.000	0.752	0.782	0.659	0.584	0.586 ;0.752	1.000	0.682	0.574	0.481	0.482 ;0.782	0.682	1.000	0.755	0.631	0.646;0.659	0.574	0.755	1.000	0.596	0.543;0.584	0.481	0.631	0.596	1.000	0.832; 0.586	0.482	0.646	0.543	0.832	1.000];
%sigma=[0.3978 0.5030 0.2407  0.2173 0.3002 0.3002];
S0=ones(1,4);
w=[0.25 0.25 0.25 0.25 ];
corr=[1.000 0.752 0.782 0.659 ; 0.752 1.000 0.682 0.574;0.782 0.682 1.000 0.755;0.659 0.574 0.755 1.000 ];
sigma=[0.3978 0.5030 0.2407 0.2173];

Covariance = corr2cov(sigma, corr);
l=0;
for m=1:n1
   
   S1= wishrnd(Covariance,261)/261;
   [sigma,corr]= cov2corr(S1);
 L = Choleskey_fectorization( corr);
for i = 1 :n2
     ksi=randn(1,d);
     for j=1:d
         somme=0;
         for k=1:j
             somme=somme+L(j,k)*ksi(k);
         end
         
  S(j)=S0(j)*exp((r-(sigma(j)^2)/2)*T+sigma(j)*sqrt(T)*somme);
     end
     Y(i)=exp(-r*T)*max(-w*S'+K,0);
end
  PP(m)=mean(Y);
end
 P=mean(PP);
 telapsed=toc(tstart);
 std(PP)
 std_error=std(PP)/sqrt(2*(n1));
X = P+norminv([alpha/2 (1-alpha/2)],0,1)*( std_error);
 

  
end

