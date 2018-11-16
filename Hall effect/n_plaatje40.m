V_res = 0.001*1.3;
sV_res = 0.001*0.1;
I_p = 0.001*39;
sI_p = 0.001*1;

%Stroom gaat van 4 naar -4 A
disp('Waarschuwing: er zitten nog steeds  waarden voor 0 in!!')
%Haal de 0en er analoog uit aan wat ik gedaan heb in magneetveld.m

Ib1 = [4.05 3.73 3.48 3.28 3.00 2.73 2.49 2.22 1.99 1.60 1.42 1.23 1.02 0.68 0.51 0.30 0.00];
Ib2 = -1.*[0.00 0.19 0.44 0.74 1.13 1.40 1.74 1.98 2.28 2.57 2.77 3.03 3.30 3.73 4.32];

UH1 = -1.*[102.6 97.7 92.9 88.5 82.1 75.5 69.8 63.0 56.7 46.3 41.4 36.3 29.9 19.6 14.7 9.2 0.9]+V_res.*ones(1,length(Ib1));
UH2 = [3.5 8.4 15.1 23.4 34.0 41.6 50.8 57.1 65.3 73.4 78.7 85.7 92.2 102.6 115.7]-V_res.*ones(1,length(Ib2));
disp('Kijk nog eens na of + en - V_res juist zijn in teken! --Tom')

Ib = 0.001.*[Ib1,Ib2];
UH = 0.0001.*[UH1,UH2];
error('Foutenpropagatie voor optellen/aftrekken V_res nog te verwerken in lijnen 20 & 21!')
sIb = 0.001.*0.01.*ones(1,length(Ib));
sUH = 0.0001.*0.1.*ones(1,length(UH));
clear Ib1 Ib2 UH1 UH2 V_res sV_res