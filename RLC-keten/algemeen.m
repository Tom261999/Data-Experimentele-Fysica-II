clear, clc, close all

%% gebruikte bakjes
% Deel 1 : meetbakje 10
% Deel 2 :meetbakje 15

%% Deel 1 : Dempingen
f = 70.0; %Hz
sf = 0.1; %Hz

% Welke files werden waar gebruikt?
    % Ondergedempt theta = 0°
        % theta = 000° -- onder1.csv
        % theta = 060° -- onder2.csv
        % theta = 030° -- onder3.csv
        % theta = 090° -- onder4.csv
        % theta = 120° -- onder5.csv
    % Kritisch gedempt
        % theta = 175° -- kritisch.csv
    % Overgedempt
        % theta = 240° -- over.csv

% Weerstand
theta = [0 30 60 90 120]; %Hoek in °
R = [0.3 3.2 106.7 234.5 376.6]; %Weerstand in Ohm
sR = 0.1*ones(1,5);

%% Deel 2 : Resonanties

U = 1.00; %V
sU = 0.01; %V

% Volgens de figuur op oscilloscoop:
f_0 = 6.2737; %kHz
sf_0 = 0.05; %kHz
% Bijhorende bestanden: resonant.csv & reso_img.bmp

DeltaV_1 = 8.40; %V
sDeltaV_1 = 0.01; %V

DeltaV_2 = 7.12; %V
sDeltaV_2 = 0.01; %V

% Gedrag V_in en V_uit:
freq = [4.0027 4.5021 5.013 5.5023 5.7153 6.0018 6.2521 6.5055 7.0431 7.5092 8.0098]; %kHz
sfreq = 0.0001.*ones(1,length(freq)); %kHz

DeltaV_chan1 = [9.04 8.80 8.64 8.40 8.40 8.40 8.40 8.40 8.40 8.48 8.64]; %V
sDeltaV_chan1 = 0.01.*ones(1,length(DeltaV_chan1)); %V

DeltaV_chan2 = [5.92 6.40 6.80 7.04 7.12 7.12 7.12 7.12 7.12 6.96 6.72]; %V
sDeltaV_chan2 = 0.01.*ones(1,length(DeltaV_chan2)); %V

% Figuren met bijhorende frequenties
    % lis1.bmp -- 8.0098 +- 0.0001 kHz
    % lis2.bmp -- 242.74 +- 0.01 Hz
    % lis3.bmp -- 4.8217 +- 0.0001 kHz