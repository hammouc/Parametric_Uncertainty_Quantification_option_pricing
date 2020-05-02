function [ ] = convergence_coefficients_plot( )
% This function plots the convergence of PC coefficients for J=30 and
% J=100( J is the Gauss hermite quadrature order)
p=1:1:11;
y1=convergence_coefficients( 30,-1.8,0.5377,1000,0,1000,1,0.05);

plot(p,y1,'red');

hold on

y2=convergence_coefficients( 100,-1.8,0.5377,1000,0,1000,1,0.05);

hold on


plot(p,y2,'o');

xlabel('PC degree k')
ylabel('log_{10}  (\alpha_{k})')
legend('log_{10}(\alpha_{k}) for  J=30 ','log_{10}(\alpha_{k}) for  J=100')
set(gca,'XTick',1:1:11)
set(gca,'XTickLabel',{'1','2','3','4','5','6','7','8','9','10','11'})
set(gca,'YTick',-10:1:2)
axis([0 15 -10 2])

grid on
box on
boldify

set(gcf,'Color','w')
export_fig('convergence_coefficients_plot.eps')


end

