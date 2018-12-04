%Geel
U_hg_y = [0.8870 0.8850 0.8900 0.8700 0.8522]; %V
sU_hg_y = [0.0010, 0.0050*ones(1,length(U_hg_y)-1)]; %V

%Groen
U_hg_g = [0.9250 0.9250 0.9245 0.9270 0.9500]; %V
sU_hg_g = [0.0050*ones(1,length(U_hg_g)-1),0.0100]; %V

%Violet 1
U_hg_v1 = [1.5548 1.5590 1.5330 1.5340 1.5350]; %V
sU_hg_v1 = [0.0010*ones(1,length(U_hg_v1))]; %V

%Violet 2
U_hg_v2 = [1.7835 1.7827 1.7920 1.7721 1.7621]; %V
sU_hg_v2 = [0.0010*ones(1,length(U_hg_v2))]; %V

%Eenheden
disp('Eenheden: Volt')