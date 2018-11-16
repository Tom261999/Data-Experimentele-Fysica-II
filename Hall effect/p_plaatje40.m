V_res = 0.001*0.0;
sV_res = 0.001*0.1;
I_p = 0.001*40;
sI_p = 0.001*1;

%Stroom gaat van 4 naar -4 A
disp('Waarschuwing: er zitten nog steeds  waarden voor 0 in!!')
%Haal de 0en er analoog uit aan wat ik gedaan heb in magneetveld.m

Ib1 = [4.02 3.68 3.43 3.19 2.99 2.74 2.52 2.27 2.08 1.73 1.56 1.32 1.01 0.82 0.52 0.30 0.00];
Ib2 = -1.*[0.00 0.24 0.50 0.77 1.08 1.28 1.52 1.73 2.00 2.32 2.59 2.75 2.96 3.27 3.55 3.74 4.03];

UH1 = [88.3 84.4 80.6 77.3 73.6 68.8 64.7 59.8 55.7 47.6 43.9 37.6 29.4 24.6 16.1 10.2 2.3]+V_res.*ones(1,length(Ib1));
UH2 = -1.9.*[1.9 7.5 14.4 21.2 28.9 34.2 39.9 44.8 51.2 58.1 64.0 67.1 71.1 77.0 81.8 85.0 89.2]-V_res.*ones(1,length(Ib2));
disp('Kijk nog eens na of + en - V_res juist zijn in teken! --Tom')

Ib = 0.001.*[Ib1,Ib2];
UH = 0.0001.*[UH1,UH2];
error('Foutenpropagatie voor optellen/aftrekken V_res nog te verwerken in lijnen 20 & 21!')
sIb = 0.001.*0.01.*ones(1,length(Ib));
sUH = 0.0001.*0.1.*ones(1,length(UH));
clear Ib1 Ib2 UH1 UH2 V_res sV_res