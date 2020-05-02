function [ ] =mean_put_price_PC_approximation( J,mg,sg,t,K,T,r )
%This function plots the variation of the put price mean computed  by PC
%method
S=(250:10:1740);
alpha0=zeros(length(S),1);
for j=1 : length(S)
    alpha0(j)=PC_approximation_normal(J,1,mg,sg,S(j),t,K,T,r);
end
plot(S,alpha0,'r');

grid on
hold on 
end
