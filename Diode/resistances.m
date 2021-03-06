function R = resistances(name)
% Mogelijke argumenten: 'diode', 'groen', 'geel', 'gloei', 'diodegloei',
% 'ldr'. Opmerking: gebruik deze functie als volgt: " R =
% resistances(name) " opdat R de vector is dat weergegeven wordt.
disp('Alle weerstanden zijn gegeven in Ohm')

if strcmp(name,'diode')
    R = [100 10^4 10^7 10^7 100 100 100];
    disp('R bevat 7 elementen')
    disp('Het n-de element hoort bij de n-de stroom en spanning.')
elseif strcmp(name,'groen')
    R = [100 10^4 10^7 100];
    disp('R bevat 4 elementen')
    disp('Het n-de element hoort bij de n-de stroom en spanning.')
elseif strcmp(name,'geel')
    R = [100 10^4 10^7];
    disp('R bevat 3 elementen')
    disp('Het n-de element hoort bij de n-de stroom en spanning.')
elseif strcmp(name,'gloei')
    R = [100 10^4];
    disp('R bevat 2 elementen')
    disp('Het n-de element hoort bij de n-de stroom en spanning.')
elseif strcmp(name,'diodegloei')
    R = [100];
    disp('R bevat 1 element')
    disp('Het n-de element hoort bij de n-de stroom en spanning.')
elseif strcmp(name,'ldr')
    R = [130000 80 500];
    disp('R bevat 3 elementen')
    disp('Het n-de element hoort bij de n-de stroom en spanning.')
end
end
