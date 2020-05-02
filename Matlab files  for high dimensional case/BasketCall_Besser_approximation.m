function [lower_bd] = BasketCall_Besser_approximation(S,cov,r,T,K,w)
%This function computes the price of a basket call by the Beisser's approximation
sig=sqrt(diag(cov));
rho= cov ./ (sig*sig');
sig=sig';
%third correlation coefficients
denom=0;
for i=1:length(S)
    for j= 1: length(S)
        denom=denom+w(i)*w(j)*rho(i,j)*sig(i)*sig(j);
    end
end
denom=sqrt(denom);
rc=(1/denom)*(rho*(w.*sig)');
%The cdf of the convex order lower bound S_l
epsilon=1;
error=0.00000000001;
a=0;
b=1;
c=0.5;
while(epsilon>error)
    
sumx=0;
sumdx=0;
sumc=0;
    for i=1:length(S)
    sumx=sumx+w(i)*S(i)*exp((r-0.5*(rc(i)^2)*(sig(i)^2))*T+(rc(i)*sig(i)*sqrt(T)*norminv(a)));
    sumdx=sumdx+w(i)*S(i)*exp((r-0.5*(rc(i)^2)*(sig(i)^2))*T+(rc(i)*sig(i)*sqrt(T)*norminv(b)));
    sumc=sumc+w(i)*S(i)*exp((r-0.5*(rc(i)^2)*(sig(i)^2))*T+(rc(i)*sig(i)*sqrt(T)*norminv(c)));
    end
    sumx=sumx-K;
    sumdx=sumdx-K;
    sumc=sumc-K;
    if sumx>=0 && sumdx<=0
        if sumc>=0
            a=c;
            c=(a+b)/2;
        else
            b=c;
            c=(a+b)/2;
        end
    else
        if sumc<=0
            a=c;
            c=(a+b)/2;
        else
            b=c;
            c=(a+b)/2;
        end
    end
   epsilon=abs(a-b);
end
Sl=c;
%new exercice prices
sig_tild=sig'.*rc;
for i=1:length(S)
K_tild(i)=S(i)*exp(((r-((sig_tild(i)^2)/2))*T)+sig_tild(i)*sqrt(T)*norminv(Sl));
d1(i)=(log(S(i)/K_tild(i))+(r+(sig_tild(i)^2)/2)*T)/(sig_tild(i)*sqrt(T));
d2(i)=d1(i)-sig_tild(i)*sqrt(T);
end
% lower bound 
lower_bd=0;
for i=1:length(S)
lower_bd=lower_bd+w(i)*(S(i)*normcdf(d1(i))-exp(-r*T)*K_tild(i)*normcdf(d2(i)));
end
end

