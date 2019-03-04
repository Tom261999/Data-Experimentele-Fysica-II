%% Global variables

L = 10^4; % Ohm
s_L = 0.0001*L; % Ohm

s_theta = 1; % °C

s_K = 1; %Ohm


%% Dummy weerstand

theta_dum = 20; % °C

M_dum = 10^6; % Ohm
s_M_dum = 0.01*M_dum; % Ohm

K_dum = 33; % Ohm


%% NTC: Negative Thermal Coefficient (opwarming)

theta_ntc = [20, 21:2:65]; % °C

M_ntc = 10^6; % Ohm
s_M_ntc = 0.01*M_ntc; % Ohm

K_ntc = [59 66 59 60 54 49 48 44 40 36 34 33 21 27 26 20 23 21 20 18 19 16 17 15]; % Ohm


%% PTC: Positive Thermal Coefficient (opwarming)

theta_ptc = [20, 22:2:66];

M_ptc = 10^5; % Ohm
s_M_ptc = 0.01*M_ptc; % Ohm

K_ptc = [26 27 24 28 25 28 28 30 33 34 36 34 40 43 46 49 50 55 62 67 71 77 83 90]; % Ohm


%% Afkoeling
disp('afkoeling_[...] -> Rij 1: NTC afkoeling, Rij 2: PTC afkoeling')

afkoeling_temperatuur = [65:-2:49; 64:-2:48]; % °C
afkoeling_weerstand = [15 16 17 17 19 20 22 21 24;
    84 78 72 67 62 52 53 50 47]; % Ohm

M_afkoeling  = [10^6, 10^5]; % Ohm
s_M_afkoeling = 0.01*M_afkoeling; % Ohm
