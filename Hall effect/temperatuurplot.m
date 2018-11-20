clear, close all
magneetveld

temperatuur_n

%Berekening R voor n-type

R = 0.0001*U_H./(B*0.020);

%De partiele afgeleiden + parameters initialiseren, wat is eigenlijk de
%nauwkeurigheid op d?

d = 0.0001;
sd = 0.00001;

partU = d./(B.*I_p);
partd = U_H./(B.*I_p);
partB = U_H.*d./(B.^2.*I_p);
partI = U_H.*d./(B.*I_p.^2);

sR = ( sU_H.^2*partU.^2 + sd.^2.*partd.^2 + sB.^2.*partB.^2 + sI_p.^2.*partI.^2 ).^(1/2);

figure
errorbar(theta,R,sR,sR,stheta,stheta,'b-.')
hold on
clear

%analoog voor temperatuur_p
temperatuur_p

R = 0.0001*U_H./(B*0.020);

%De partiele afgeleiden + parameters initialiseren, wat is eigenlijk de
%nauwkeurigheid op d?

d = 0.0001;
sd = 0.00001;

partU = d./(B.*I_p);
partd = U_H./(B.*I_p);
partB = U_H.*d./(B.^2.*I_p);
partI = U_H.*d./(B.*I_p.^2);

sR = ( sU_H.^2*partU.^2 + sd.^2.*partd.^2 + sB.^2.*partB.^2 + sI_p.^2.*partI.^2 ).^(1/2);



errorbar(theta,R,sR,sR,stheta,stheta,'r-.')
plot([20 140],[0 0],'k:')
clear
xlabel('Temperatuur (°C)')
ylabel('Hallconstante (m^3/C)')
title('Temperatuursafhankelijkheid van Hall constante')
legend('n-gedopeerd','p-gedopeerd')
grid on
hold off