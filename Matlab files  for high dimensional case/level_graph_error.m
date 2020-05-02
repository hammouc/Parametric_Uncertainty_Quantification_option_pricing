function [] = level_graph_error(k)
%This function plots the difference between two consecutive levels of
%Sparse grid quadrature( 
for l=1:k-1
error(l)=log10(abs((Sgri(4,l+1,@integrnd_calculus_4))-Sgri(4,l,@integrnd_calculus_4)))% four dimensional case
%error(l)=log10(abs((Sgri(6,l+1,@integrnd_calculus))-Sgri(6,l,@integrnd_calculus)))% six dimensional case
end
x=1:1:k-1;
plot(x,error);
grid on
end

