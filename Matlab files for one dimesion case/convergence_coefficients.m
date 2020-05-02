function [  y] = convergence_coefficients( J,mg,sg,S,t,K,T,r)
% This function computes the decimal logarithm of PC coefficients' Absolute value
alpha=zeros(1,11);
for i=1:11
alpha(i)=abs(PC_approximation_normal(J,i,mg,sg,S,t,K,T,r));
end
y=log10(alpha);

end

