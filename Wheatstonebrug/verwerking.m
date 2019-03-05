%% Data import
clear, clc, close all;
run('data.m')

%% Dummy

[X_dum,s_X_dum] = bereken(K_dum,M_dum,L,s_K,s_M_dum,s_L);

%% NTC (opwarmen)

for i = 1:length(theta_ntc)
    [X_ntc(i),s_X_ntc(i)] = bereken(K_ntc(i),M_ntc,L,s_K,s_M_ntc,s_L);
end

%% PTC (opwarmen)

for i = 1:length(theta_ptc)
    [X_ptc(i),s_X_ptc(i)] = bereken(K_ptc(i),M_ptc,L,s_K,s_M_ptc,s_L);
end

%% Afkoeling
X_afkoeling = zeros(2,length(afkoeling_temperatuur(1,:)));
for i = 1:2
    for j = 1:length(afkoeling_temperatuur(i,:))
        [X_afkoeling(i,j),s_X_afkoeling(i,j)] = bereken(afkoeling_weerstand(i,j),M_afkoeling(i),L,s_K,s_M_afkoeling(i),s_L);
    end    
end

%%
clear i j
