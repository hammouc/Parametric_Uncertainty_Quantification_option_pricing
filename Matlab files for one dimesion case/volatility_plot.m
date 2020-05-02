function [  ] =volatility_plot( )
% This function plots the historical volatility of S&P 500 Index from 2000 to 2010
volatility=[26	20	26	33	24	16	16	10	14	25	19	26	24	19	28	30	17	13	17	16	34	19	15	15	16	18	16	16	22	21	41	33	29	35	23	17	25	18	27	18	16	15	15	11	15	12	11	9	11	9	15	12	11	10	9	13	9	12	10	9	10	10	10	15	10	8	9	9	9	15	8	7	11	9	8	9	12	15	13	7	8	7	8	7	7	14	13	8	9	13	17	24	15	14	26	17	24	20	28	18	14	19	23	20	54	78	69	49	38	35	48	29	28	20	20	16	15	21	15	10	16	18	7	15	31	25	19	17	15	11	14	9
];%This is the sample of data.
months=1:1:132;
plot(months,volatility)
xlabel('Months')
ylabel('S&P 500 30 Day Volatility')
legend('S&P 500 30 Day Volatility','Location','Best')

set(gca,'YTickLabel',{'0%','10%','20%','30%','40%','50%','60%','70%','80%','90%','100%'})
grid on
box on
boldify

set(gcf,'Color','w')
export_fig('volatility.eps')

end

