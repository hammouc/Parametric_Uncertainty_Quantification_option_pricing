function [] = mean_monte_carlo(n,mg,sg,t,K,T,r)
% This function plots the mean of put option price using MC method
sigma=lognrnd(mg,sg,n,1);
S=250:10:1750;
V1=zeros(length(sigma),1);   
for j=1 : length(S)  
V1= Option_value( S(j),t,sigma,K,T,r);
 esp(j)=mean(V1);
end
plot(S,esp,'o');
end

