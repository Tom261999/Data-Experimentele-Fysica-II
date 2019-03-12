% Data voor elektronen diffractie; er zijn twee stralen opgemeten, voor
% de grote en kleine ringen (D en d resp.)

c = [48 48 49 49 49 49 50 50 49 50 50 50 50]; % Positie van het centrum op de as (mm)
V = [2.1 2.4 2.7 2.9 3.3 3.5 3.8 4.0 4.3 4.5 4.8 5.2 5.5]; % Aangelegde spanning (kV)
d_l = [31 32 34 35 36 36 37 38 38 39 39 40 40]; % Positie kleine cirkel (links) op de as (mm)
d_r = [64 63 62 62 61 61 61 61 60 60 59 59 58]; % idem voor rechts
D_l = [17 19 22 23 25 26 28 29 29 30 31 32 32]; % idem voor grote cirkel (links)
D_r = [78 76 75 73 72 71 70 69 68 67 67 66 67]; % idem voor rechts

% Met foutenmarges:

sV = 0.1; % kV
sc = 1; % mm
sd = sc;
sD = sc;
