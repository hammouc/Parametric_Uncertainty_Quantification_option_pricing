function [ ] = std_dev_monte_carlo(n,mg,sg,t,K,T,r)
%This function plots the standard deviation of the put price computed using standard MC method for different
%stock prices 
sigma=lognrnd(mg,sg,n,1);
S=250:10:1750;
V1=zeros(length(sigma),1);   

for j=1 : length(S)  
 V1= Option_value( S(j),t,sigma,K,T,r);
 esp(j)=mean(V1);
 std(j)=sqrt(mean((V1-esp(j)).^2));
end
plot(S,std,'o');

end

