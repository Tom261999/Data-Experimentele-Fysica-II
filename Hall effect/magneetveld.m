%clear, close all

%Amperage 4 -> 0 mA
I1 = [4.00 3.77 3.40 3.26 2.93 2.77 2.49 2.20 2.02 1.63 1.44 1.26 0.98 0.63 0.33 0.09 0.00];
B1 = [4.48 4.34 4.02 3.89 3.58 3.41 3.09 2.79 2.58 2.13 1.91 1.69 1.35 0.90 0.54 0.25 0.13];

%Amperage 0 -> -4 mA
I2 = -1.*[0.00 0.28 0.41 0.76 1.03 1.28 1.47 1.77 2.13 2.25 2.57 2.78 3.02 3.28 3.49 3.83 4.00];
B2 = -1.*[0.12 0.43 0.59 1.02 1.38 1.69 1.94 2.32 2.79 2.94 3.36 3.66 3.97 4.29 4.57 4.97 5.17];

%Amperage -4 -> 0 mA
I3 = -1.*[3.63 3.47 3.25 3.03 2.65 2.39 2.16 1.93 1.75 1.48 1.17 0.97 0.68 0.31 0.13 0.00];
B3 = -1.*[4.89 4.71 4.41 4.17 3.67 3.33 3.01 2.71 2.46 2.10 1.69 1.42 1.01 0.53 0.30 0.15];

%Amperage 0 -> 4 mA
I4 = [0.00 0.20 0.45 0.70 1.11 1.37 1.63 1.96 2.23 2.61 2.72 3.06 3.28 3.60 3.83 4.09];
B4 = [0.05 0.28 0.62 0.91 1.39 1.69 1.98 2.36 2.67 3.09 3.28 3.58 3.79 4.10 4.29 4.50];

%Extra voorfactoren geven eenheden conversie van en G->T
Idaal = [I3,I4];
Bdaal = 0.0001.*[B3,B4];
Istijg = [I1,I2];
Bstijg = 0.0001.*[B1,B2];
clear I1 I2 I3 I4 B1 B2 B3 B4
sIstijg = 0.01.*ones(1,length(Istijg));
sBstijg = 0.0001.*0.01.*ones(1,length(Bstijg));
sIdaal = 0.01.*ones(1,length(Bdaal));
sBdaal = 0.0001.*0.01.*ones(1,length(Bdaal));

for i = 1:length(Idaal)-2
    if Idaal(i) == Idaal(i+1)
        sBdaal(i) = 0.0001.*0.014; %fout op gemiddelde -> narekenen?
        Bdaal(i) = (Bdaal(i)+Bdaal(i+1))/2;
        %Element i+1 verwijderen
        Idaal(i+1) = [ ];
        sIdaal(i+1) = [ ];
        Bdaal(i+1) = [ ];
        sBdaal(i+1) = [ ];
    end
end
for i = 1:length(Istijg)-2
    if Istijg(i) == Istijg(i+1)
        sBstijg(i) = 0.0001.*0.014; %fout op gemiddelde -> narekenen?
        Bstijg(i) = (Bstijg(i)+Bstijg(i+1))/2;
        %Element i+1 verwijderen
        Istijg(i+1) = [ ];
        sIstijg(i+1) = [ ];
        Bstijg(i+1) = [ ];
        sBstijg(i+1) = [ ];
    end
end
clear i

figure('name','Hysterese-curve'), hold on
errorbar(Istijg,Bstijg,sBstijg,sBstijg,sIstijg,sIstijg,'b.')
errorbar(Idaal,Bdaal,sBdaal,sBdaal,sIdaal,sIdaal,'r.')
legend('I : 4 -> -4 A','I : -4 -> 4 A','location','northwest')
xlabel('Stroomsterkte I (A)'),ylabel('Magnetischveldsterkte B (T)')
title('Hysterese-curve')
hold off