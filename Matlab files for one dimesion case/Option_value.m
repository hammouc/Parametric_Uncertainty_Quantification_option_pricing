function [ V ] = Option_value( S,t,sigma,K,T,r)
% This function computes the analytical solution of the put price
d1=(log(S/K)+(r*ones(length(sigma),1)+(sigma.^2)/2)*(T-t))./(sigma*(sqrt(T-t)));
d2=(log(S/K)+(r*ones(length(sigma),1)-(sigma.^2)/2)*(T-t))./(sigma*sqrt(T-t));
V=K*exp(-r*(T-t))*normcdf(-d2,0,1)-normcdf(-d1,0,1)*S;
end

