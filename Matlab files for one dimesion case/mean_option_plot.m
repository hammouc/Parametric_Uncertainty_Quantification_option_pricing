function [  ] =mean_option_plot(  )
%This function compares  the put price mean computed  by PC and standard MC
%methods

mean_monte_carlo(100000,-1.8,0.5377,0,1000,1,0.05);
hold on
mean_put_price_PC_approximation(30,-1.8,0.5377,0,1000,1,0.05 )
 xlabel('S')
ylabel(' Mean of V(S)')
legend(' Mean of V(S): MC',' Mean of V(S): PC')
grid on
box on
boldify

set(gcf,'Color','w')
export_fig(' Mean of V(S).eps')
end
