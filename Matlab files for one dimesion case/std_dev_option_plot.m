function [  ] =std_dev_option_plot(  )
%This function compares the standard deviation of the put price computed using PC and standard MC  methods for different
%stock prices 
std_dev_monte_carlo(100000,-1.8,0.5377,0,1000,1,0.05)
hold on
put_price_standard_deviation_PC_approximation( 11,30,-1.8,0.5377,0,1000,1,0.05 )

 xlabel('S')
ylabel('Stdev of V(S)')
legend('Stdev of V(S): MC','Stdev of V(S): PC')
grid on
box on
boldify

set(gcf,'Color','w')
export_fig('Stdev of V(S).eps')
end

