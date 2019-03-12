clear
run('Grafiek_Reeks1.m')
run('Grafiek_Reeks2.m')
close all
clc, clear i

figure()
subplot(2,1,1)
    errorbar(T_1,spanning_1,s_spanning_1,s_spanning_1,sT_1,sT_1,'k.--','Markersize',12)
    title('Grafiek voor stroom 0.300 +- 0.010 A')
    xlabel('Temperatuur (°C)')
    ylabel('Spanning (mV)')
    
subplot(2,1,2)
    errorbar(T_2,spanning_2,s_spanning_2,s_spanning_2,sT_2,sT_2,'k.--','Markersize',12)
    title('Grafiek voor stroom 0.100 +- 0.010 A')
    xlabel('Temperatuur (°C)')
    ylabel('Spanning (mV)')