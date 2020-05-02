function [  ] = option_density_plot()
%This function plots the density of the put price using Standard MC and surrogate PC/MC methods
prix_approximation_PCdensity(11,30,1000,-1.8,0.5377,0,1000,1,0.05)
hold on
option_price_monte_carlo_density( -1.8,0.5377,1000,0,1000,1,0.05)


xlabel('Option Price V')
ylabel('Density of V(1000)')
legend('Density of V(1000):PC ','Density of V(1000): MC')



grid on
box on
boldify

set(gcf,'Color','w')
export_fig('Density of V(1000).eps')
end

