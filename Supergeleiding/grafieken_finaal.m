clear
run('Grafiek_Reeks1.m')
run('Grafiek_Reeks2.m')
close all
clc, clear i

% Omzetten van mV en mA naar V en A (resp.)

spanning_1 = spanning_1/1000;
spanning_2 = spanning_2/1000;
s_spanning_1 = s_spanning_1/1000;
s_spanning_2 = s_spanning_2/1000;
stroom_1 = stroom_1/1000;
stroom_2 = stroom_2/1000;
s_stroom_1 = s_stroom_1/2000; % Pakt dat de nauwkeurigheid een beetje beter was dan oorspronkelijk geschat ;-)
s_stroom_2 = s_stroom_2/2000;

% R = V/I

weerstand_1 = abs(spanning_1/stroom_1);
weerstand_2 = abs(spanning_2/stroom_2);

% Propagatie

s_weerstand_1 = sqrt(s_spanning_1.^2*(1./stroom_1).^2+s_stroom_1.^2*(-spanning_1./stroom_1.^2).^2);
s_weerstand_2 = sqrt(s_spanning_2.^2*(1./stroom_2).^2+s_stroom_2.^2*(-spanning_2./stroom_2.^2).^2);

% Plot
figure(), box on, grid on, hold all
errorbar(T_1,weerstand_1,s_weerstand_1,s_weerstand_1,sT_1,sT_1,'b.--');
errorbar(T_2,weerstand_2,s_weerstand_2,s_weerstand_2,sT_2,sT_2,'r.--');

axis([75 155 0 0.09])
title('Weerstand van de Supergeleider i.f.v. de Temperatuur')
xlabel('Temperatuur (K)')
ylabel('Weerstand (\Omega)')
legend('300 mA','100 mA','location','northwest')
title(legend,'Stroomsterkte (\pm 5 mA)')