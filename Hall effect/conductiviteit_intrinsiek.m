I_p = 0.001*10; %A
sI_p = 0.001*1;

theta = [130:-10:30]; %°C
stheta = ones(1,length(theta));

U_H = -1*0.01*[21 27 38 50 70 100 141 215 315 471 688]; %V
sU_H = 0.01*ones(1,length(U_H));