V_res = 0.001*0.0;
sV_res = 0.001*0.1;
I_p = 0.001*20;
sI_p = 0.001*1;

%Stroom gaat van 4 naar -4 A
disp('Waarschuwing: er zitten nog steeds  waarden voor 0 in!!')
%Haal de 0en er analoog uit aan wat ik gedaan heb in magneetveld.m

Ib1 = [4.02 3.75 3.40 3.25 3.01 2.75 2.56 2.22 1.98 1.73 1.39 1.18 0.99 0.72 0.54, 0.19 0.00];
Ib2 = -1.*[0.00 0.26 0.68 0.94 1.16 1.51 1.77 2.03 2.28 2.49 2.79 3.09 3.27 3.65 3.81 3.95 4.04];

UH1 = [42.6 41.2 39.0 37.8 35.8 33.6 31.7 28.5 26.0 23.1 19.1 16.5 14.1 10.6 8.3 3.7 1.1]+V_res.*ones(1,length(Ib1));
UH2 = -1.*[1.0 4.1 9.3 12.5 15.2 19.4 22.4 25.4 28.0 30.1 33.2 36.0 37.6 40.8 42.0 43.0 43.6]-V_res.*ones(1,length(Ib2));
disp('Kijk nog eens na of + en - V_res juist zijn in teken! --Tom')

Ib = 0.001.*[Ib1,Ib2];
UH = 0.0001.*[UH1,UH2];
error('Foutenpropagatie voor optellen/aftrekken V_res nog te verwerken in lijnen 20 & 21!')
sIb = 0.001.*0.01.*ones(1,length(Ib));
sUH = 0.0001.*0.1.*ones(1,length(UH));
clear Ib1 Ib2 UH1 UH2 V_res sV_res