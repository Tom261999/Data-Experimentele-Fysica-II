clear, clc, close all
run('Data.m');

h = 6.625*10^(-34); % Js
m = 9.109*10^(-31); % kg
e = 1.6022*10^(-19); % C

sh = 0.001*10^(-34);
sm = 0.001*10^(-31);
se = 0.0001*10^(-19);

V = 1000*V; % Factor 1000 voor omzetting van kV naar V
sV = 1000*sV;

lambda = h./sqrt(2*m*e*V);
% Reality check {
% https://myscope.training/legacy/tem/background/concepts/imagegeneration/wavelength.php
% } lijkt overeen te komen!

R = 127/1000; % mm 
R = R + 5/1000; % extra voor de correctie
sR = 1/1000;

d_l = d_l/1000;
d_r = d_r/1000;
D_l = D_l/1000;
D_r = D_r/1000;
sd = sd/1000;
sD = sD/1000;

alpha_1 = (d_r-d_l)/(4*R); % Factor 4 want zie tekening
alpha_2 = (D_r-D_l)/(4*R);

delta_1(1,:) = lambda./(2*sin(alpha_1));
delta_2(1,:) = lambda./(2*sin(alpha_2));

% % d_1(2,:) = 2*lambda./(2*sin(alpha_1)); % Bullshit, we hebben alleen
% eerste orde gemeten, nikske tweede orde zever
% % d_2(2,:) = 2*lambda./(2*sin(alpha_2));

% Data ziet er heel goed uit!! opm: de rij index geeft ook de waarde van n

%% Nu een berg propagaties

% Alle fucking afgeleiden

p_lambda_V = -m*e*h./(2*m*e*V).^(3/2);
p_lambda_m = -e*V*h./(2*m*e*V).^(3/2);
p_lambda_e = -m*V*h./(2*m*e*V).^(3/2);
p_lambda_h = 1./sqrt(2*m*e*V);

p_alpha_dr = -d_l/(4*R);
p_alpha_dl = d_r/(4*R);
p_alpha_Dr = -D_l/(4*R);
p_alpha_Dl = D_r/(4*R);
p_alpha_R_1 = (d_l-d_r)/(4*R.^2);
p_alpha_R_2 = (D_l-D_r)/(4*R.^2);

p_delta_lambda_1 = 1./(2*sin(alpha_1));
p_delta_alpha_1 = -lambda.*cos(alpha_1)./(2*(sin(alpha_1)).^2);
p_delta_lambda_2 = 1./(2*sin(alpha_2));
p_delta_alpha_2 = -lambda.*cos(alpha_2)./(2*(sin(alpha_2)).^2);

% Dan de fouten zelf nog:

s_lambda = sqrt((p_lambda_V*sV).^2+(p_lambda_m*sm).^2+(p_lambda_e*se).^2+(p_lambda_h*sh).^2);
s_alpha_1 = sqrt((sd*p_alpha_dl).^2+(sd*p_alpha_dr).^2+(sR*p_alpha_R_1).^2);
s_alpha_2 = sqrt((sD*p_alpha_Dl).^2+(sd*p_alpha_Dr).^2+(sR*p_alpha_R_2).^2);
s_delta_1 = sqrt((s_lambda.*p_delta_lambda_1).^2+(s_alpha_1.*p_delta_alpha_1).^2);
s_delta_2 = sqrt((s_lambda.*p_delta_lambda_2).^2+(s_alpha_2.*p_delta_alpha_2).^2);

%% Tot slot nog een gewogen gemiddelde

[delta_1_avg,s_delta_1_avg] = GewogenGemf(delta_1,s_delta_1)
[delta_2_avg,s_delta_2_avg] = GewogenGemf(delta_2,s_delta_2)
