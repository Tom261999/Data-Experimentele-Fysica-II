% Nota: ergens in het script lijken waarden plots gecleared te worden
% zonder daar een rede voor is, ook alle clear's weghalen veranderd dat
% niet? Alle sections appart laten runnen om de waarden te verzamelen.
clear

%% Globaal

uitwerking_globaal
clc, close all
clear data i lengtevar m test tijd y v_in v_gem v_gem_avg sv_gem_avg
t_1 = [8.41-0.01 8.41+0.01];
t_2 = [18.2-0.1 18.2+0.1];

% Dan voor de eerste piek (globaal):
    for i = 1:length(t)
        if t(i) >= min(t_1) && t(i) <= max(t_1)
            t_nuttig(i) = t(i);
        end
    end
    for i = length(t_nuttig):-1:1
        if t_nuttig(i) == 0
            t_nuttig(i) = [ ];
        end
    end

    % Dan vinden we de nuttige indices
    index(1) = [find(t_nuttig(1) == t,1)];


    % technische gezien uitmiddelen, maar we vinden maar 1 nuttige index!
    V_in_globaal(1) = v_in_avg(index);
    sV_in_globaal(1) = sv_in_avg(index);
    clear t_nuttig index t_1
    
% Dan voor de tweede piek (globaal):
    for i = 1:length(t)
        if t(i) >= min(t_2) && t(i) <= max(t_2)
            t_nuttig(i) = t(i);
        end
    end
    for i = length(t_nuttig):-1:1
        if t_nuttig(i) == 0
            t_nuttig(i) = [ ];
        end
    end

    % Dan vinden we de nuttige indices
    for i = 1:length(t_nuttig)
        index(i) = [find(t_nuttig(i) == t,1)];
    end
    
    % uitmiddelen (gewogen gemiddelde!)
    [temp, stemp] = GewogenGemf(v_in_avg(index),sv_in_avg(index));
    V_in_globaal(2) = temp;
    sV_in_globaal(2) = stemp;
    clear t_2 temp stemp t_nuttig index v_in_avg sv_in_avg t i

%% Eerste piek

uitwerking_eerste
clc, close all
clear data i lengten sync m test tijd y v_in v_gem v_gem_avg sv_gem_avg
t_1 = [17.23-0.02 17.23+0.02];
t_2 = [18.05-0.03 18.05+0.03];
t_3 = [20.83-0.04 20.83+0.04];

% Dan voor de eerste piek (eerste):
    for i = 1:length(t)
        if t(i) >= min(t_1) && t(i) <= max(t_1)
            t_nuttig(i) = t(i);
        end
    end
    for i = length(t_nuttig):-1:1
        if t_nuttig(i) == 0
            t_nuttig(i) = [ ];
        end
    end

    %Dan vinden we de nuttige indices:
    for i = 1:length(t_nuttig)
        index(i) = [find(t_nuttig(i) == t,1)];
    end

    % uitmiddelen (gewogen gemiddelde!)
    [temp, stemp] = GewogenGemf(v_in_avg(index),sv_in_avg(index));
    V_in_eerste(1) = temp;
    sV_in_eerste(1) = stemp;
    clear t_1 index i temp stemp t_nuttig

% Dan voor de tweede piek (eerste):
    for i = 1:length(t)
        if t(i) >= min(t_2) && t(i) <= max(t_2)
            t_nuttig(i) = t(i);
        end
    end
    for i = length(t_nuttig):-1:1
        if t_nuttig(i) == 0
            t_nuttig(i) = [ ];
        end
    end

    %Dan vinden we de nuttige indices:
    for i = 1:length(t_nuttig)
        index(i) = [find(t_nuttig(i) == t,1)];
    end

    % uitmiddelen (gewogen gemiddelde!)
    [temp, stemp] = GewogenGemf(v_in_avg(index),sv_in_avg(index));
    V_in_eerste(2) = temp;
    sV_in_eerste(2) = stemp;
    clear t_2 index i temp stemp t_nuttig

% Dan voor de derde piek (eerste):
    for i = 1:length(t)
        if t(i) >= min(t_3) && t(i) <= max(t_3)
            t_nuttig(i) = t(i);
        end
    end
    for i = length(t_nuttig):-1:1
        if t_nuttig(i) == 0
            t_nuttig(i) = [ ];
        end
    end

    %Dan vinden we de nuttige indices:
    for i = 1:length(t_nuttig)
        index(i) = [find(t_nuttig(i) == t,1)];
    end

    % uitmiddelen (gewogen gemiddelde!)
    [temp, stemp] = GewogenGemf(v_in_avg(index),sv_in_avg(index));
    V_in_eerste(3) = temp;
    sV_in_eerste(3) = stemp;
    clear t_3 index i temp stemp t_nuttig t

%% Tweede piek

uitwerking_tweede
clc, close all
clear data i lengten sync m test tijd y v_in v_gem v_gem_avg sv_gem_avg
t_1 = [10.92-0.01 10.92+0.01];
t_2 = [13.4-0.4 13.4+0.4];
t_3 = [16.9-0.3 16.9+0.3];
t_4 = [21.2-0.3 21.2+0.3];

% Dan voor de eerste piek (tweede):
    for i = 1:length(t)
        if t(i) >= min(t_1) && t(i) <= max(t_1)
            t_nuttig(i) = t(i);
        end
    end
    for i = length(t_nuttig):-1:1
        if t_nuttig(i) == 0
            t_nuttig(i) = [ ];
        end
    end

    %Dan vinden we de nuttige indices:
    for i = 1:length(t_nuttig)
        index(i) = [find(t_nuttig(i) == t,1)];
    end

    % technische gezien uitmiddelen, maar we vinden maar 1 nuttige index!
    V_in_tweede(1) = v_in_avg(index);
    sV_in_tweede(1) = sv_in_avg(index);
    clear i index t_1 t_nuttig

% Dan voor de tweede piek (tweede):
    for i = 1:length(t)
        if t(i) >= min(t_2) && t(i) <= max(t_2)
            t_nuttig(i) = t(i);
        end
    end
    for i = length(t_nuttig):-1:1
        if t_nuttig(i) == 0
            t_nuttig(i) = [ ];
        end
    end

    %Dan vinden we de nuttige indices:
    for i = 1:length(t_nuttig)
        index(i) = [find(t_nuttig(i) == t,1)];
    end
    [temp, stemp] = GewogenGemf(v_in_avg(index),sv_in_avg(index));
    V_in_tweede(2) = temp;
    sV_in_tweede(2) = stemp;
    clear i index t_2 t_nuttig temp stemp

% Dan voor de derde piek (tweede):
    for i = 1:length(t)
        if t(i) >= min(t_3) && t(i) <= max(t_3)
            t_nuttig(i) = t(i);
        end
    end
    for i = length(t_nuttig):-1:1
        if t_nuttig(i) == 0
            t_nuttig(i) = [ ];
        end
    end

    %Dan vinden we de nuttige indices:
    for i = 1:length(t_nuttig)
        index(i) = [find(t_nuttig(i) == t,1)];
    end
    [temp, stemp] = GewogenGemf(v_in_avg(index),sv_in_avg(index));
    V_in_tweede(3) = temp;
    sV_in_tweede(3) = stemp;
    clear i index t_3 t_nuttig temp stemp

% Dan voor de vierde piek (tweede):
    for i = 1:length(t)
        if t(i) >= min(t_4) && t(i) <= max(t_4)
            t_nuttig(i) = t(i);
        end
    end
    for i = length(t_nuttig):-1:1
        if t_nuttig(i) == 0
            t_nuttig(i) = [ ];
        end
    end

    %Dan vinden we de nuttige indices:
    for i = 1:length(t_nuttig)
        index(i) = [find(t_nuttig(i) == t,1)];
    end
    [temp, stemp] = GewogenGemf(v_in_avg(index),sv_in_avg(index));
    V_in_tweede(4) = temp;
    sV_in_tweede(4) = stemp;
    clear i index t_4 t_nuttig temp stemp v_in_avg sv_in_avg t