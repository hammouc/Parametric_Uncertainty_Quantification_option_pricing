function [telapsed, P,X,std_error ] = CV_method_basket_option(n1,n2,alpha)
% This function is a nested MC coupled with Control  and antithetic variates techniques
tstart=tic;
K=1;
T=1;
r=0.05;
d=4;
S0=ones(1,4);
w=[0.25 0.25 0.25 0.25 ];
corr=[1.000 0.752 0.782 0.659 ; 0.752 1.000 0.682 0.574;0.782 0.682 1.000 0.755;0.659 0.574 0.755 1.000 ];
sigma=[0.3978 0.5030 0.2407 0.2173];
%d=6;
%S0=ones(1,6);
%w=[(1/6) (1/6)  (1/6)  (1/6) (1/6) (1/6) ];
%corr=[1.000	0.752	0.782	0.659	0.584	0.586 ;0.752	1.000	0.682	0.574	0.481	0.482 ;0.782	0.682	1.000	0.755	0.631	0.646;0.659	0.574	0.755	1.000	0.596	0.543;0.584	0.481	0.631	0.596	1.000	0.832; 0.586	0.482	0.646	0.543	0.832	1.000];
%sigma=[0.3978 0.5030 0.2407  0.2173 0.3002 0.3002];
 Covariance = corr2cov(sigma, corr);
c=1;
for m=1:n1
 S= wishrnd(Covariance,261)/261;
 [sigma,corr]= cov2corr(S);
 L = Choleskey_fectorization( corr);
u=log(S0)+(r-(sigma.^2/2))*T;
us_tild=w*u';
sigma_tild=sqrt(T)*sigma;
sigmas_tild=sqrt((w.*sigma_tild)*corr*(w.*sigma_tild)');
k=(log(K)-us_tild)/sigmas_tild;
u_PG=exp(us_tild+(sigmas_tild^2)/2)*normcdf(-k+sigmas_tild,0,1)-K*normcdf(-k,0,1);
for i = 1 :n2
ksi1=randn(1,d);
ksi2=-ksi1;
     for j=1:d
         somme1=0;
         somme2=0;
         for k=1:j
          somme1=somme1+L(j,k)*ksi1(k);
          somme2=somme2+L(j,k)*ksi2(k);
         end
         
    S1(j)=S0(j)*exp((r-(sigma(j)^2)/2)*T+sigma(j)*sqrt(T)*somme1);
    S2(j)=S0(j)*exp((r-(sigma(j)^2)/2)*T+sigma(j)*sqrt(T)*somme2);
  
     end
     
 PA1=max(w*S1'-K,0);
  PA2=max(w*S2'-K,0);
 PG1=max(exp(w*(log(S1))')-K,0);
 PG2=max(exp(w*(log(S2))')-K,0);
 Y1(i)=exp(-r*T)*(PA1-c*(PG1-u_PG));
 Y2(i)=exp(-r*T)*(PA2-c*(PG2-u_PG));
end
Y1=(exp(-r*T)*K - S0*w')+Y1;
Y2=(exp(-r*T)*K - S0*w')+Y2;
Y=(Y1+Y2)/2;
PP(m)=mean(Y);
end
P=mean(PP);
 telapsed=toc(tstart);
std_error=std(Y)/sqrt(2*(n1))
X = P+norminv([alpha/2 (1-alpha/2)],0,1)*(std_error);
end

