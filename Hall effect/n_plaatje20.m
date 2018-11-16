V_res = 0.001*1.3;
sV_res = 0.001*0.1;
I_p = 0.001*20;
sI_p = 0.001*1;

%Stroom gaat van 4 naar -4 A
disp('Waarschuwing: er zitten nog steeds  waarden voor 0 in!!')
%Haal de 0en er analoog uit aan wat ik gedaan heb in magneetveld.m

Ib1 = [4.04 3.67 3.29 3.04 2.66 2.40 2.23 1.90 1.77 1.47 1.25 0.99 0.76 0.55 0.29 0.00];
Ib2 = -1.*[0.00 0.30 0.54 0.76 1.10 1.29 1.51 1.99 2.25 2.47 2.74 3.01 3.28 3.55 3.79 3.99];

UH1 = -1.*[55.3 52.2 48.1 45.3 40.3 37.1 34.8 29.9 28.0 23.5 20.3 16.3 12.8 9.6 5.5 1.1]+V_res.*ones(1,length(Ib1));
UH2 = [1.1 5.1 8.6 11.9 17.1 19.8 23.0 30.4 34.0 37.1 40.8 44.5 48.0 51.7 54.3 56.7]-V_res.*ones(1,length(Ib2));
disp('Kijk nog eens na of + en - V_res juist zijn in teken! --Tom')

Ib = [Ib1,Ib2];
UH = 0.0001.*[UH1,UH2];
%error('Foutenpropagatie voor optellen/aftrekken V_res nog te verwerken in lijnen 20 & 21!')
sIb = 0.01.*ones(1,length(Ib));
sUH = 0.0001.*0.1.*ones(1,length(UH));
%clear Ib1 Ib2 UH1 UH2 V_res sV_res