function [ ] = volatility_density( )
% This function plots the sample density of the volatility and the log-normal distribution that best fits the sample of data
Volatility=[0.2597	0.1951	0.26	0.3277	0.2428	0.163	0.1613	0.0983	0.135	0.2516	0.1888	0.2577	0.2399	0.1869	0.2844	0.2978	0.1698	0.1334	0.1698	0.1614	0.338	0.1882	0.1517	0.1502	0.1623	0.1842	0.1561	0.1568	0.2154	0.2082	0.4128	0.3276	0.2934	0.3484	0.2319	0.1719	0.248	0.1837	0.2707	0.1812	0.159	0.1543	0.1524	0.1071	0.1496	0.118	0.11	0.0943	0.1102	0.0892	0.147	0.1211	0.1105	0.095	0.0932	0.1287	0.0918	0.1208	0.0969	0.0881	0.0999	0.1041	0.0983	0.1472	0.0989	0.0788	0.0859	0.0871	0.0887	0.147	0.076	0.072	0.1091	0.0928	0.0767	0.0877	0.1228	0.1547	0.1347	0.0696	0.0784	0.068	0.0833	0.0662	0.0745	0.1407	0.1347	0.0784	0.0863	0.1325	0.1696	0.2375	0.1537	0.1358	0.2582	0.1723	0.2373	0.2013	0.2804	0.1776	0.1403	0.1929	0.2261	0.2026	0.5383	0.7819	0.692	0.486	0.3842	0.354	0.4809	0.2931	0.2791	0.2	0.2007	0.1598	0.1491	0.2116	0.1519	0.1026	0.1602	0.1766	0.073	0.147	0.3124	0.2537	0.1934	0.1731	0.1534	0.1102	0.1442	0.0855
];%the sample of data
[f,xi]=ksdensity(Volatility);
bar(xi,f,'Facecolor',[1 0 0], 'DisplayName','Sample density');
p1 = pdf('lognormal',-0.5:0.01:1,-1.83034,0.506374);% These are the parameters of the log-normal distribution that best fits the sample of data
 
hold on
y=-0.5:0.01:1;
plot(y,p1);
grid on



xlabel('Volatility \sigma')
ylabel(' Density function')
legend('sample density','log-normal density','Location','best')

set(gca,'XTick',-1:0.2:1)
grid on
box on
boldify

set(gcf,'Color','w')
export_fig('density_volatility.eps')
end
