clear, close all
temperatuur_n
plot(theta,U_H,'r*--')
hold on
clear
temperatuur_p
plot(theta,U_H,'b*--')
plot([30 130],[0 0],'k:')
clear
xlabel('Temperatuur (°C)')
ylabel('Hallspanning (V)')
title('Temperatuursafhankelijkheid van Hallspanning')
legend('n-gedopeerd','p-gedopeerd')