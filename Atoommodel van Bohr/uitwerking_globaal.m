synchronisatie_globaal; clc; close all;

disp('minimale lengte avn de datavectoren:')
disp(min([length(t_gem_1), length(t_gem_2), length(t_gem_3), ...
    length(t_gem_4), length(t_gem_5)]))

%% Vectoren even lang maken
lengtevar = 1250;

t = t_gem_1(1:lengtevar);

v_gem_1 = v_gem_1(1:lengtevar);
v_gem_2 = v_gem_2(1:lengtevar);
v_gem_3 = v_gem_3(1:lengtevar);
v_gem_4 = v_gem_4(1:lengtevar);
v_gem_5 = v_gem_5(1:lengtevar);

v_in_1 = v_in_1(1:lengtevar);
v_in_2 = v_in_2(1:lengtevar);
v_in_3 = v_in_3(1:lengtevar);
v_in_4 = v_in_4(1:lengtevar);
v_in_5 = v_in_5(1:lengtevar);

figure('name','gesynchroniseerde curves'), hold on
plot(t,v_gem_1,'x-')
plot(t,v_gem_2,'x-')
plot(t,v_gem_3,'x-')
plot(t,v_gem_4,'x-')
plot(t,v_gem_5,'x-'), hold off
legend('1','2','3','4','5')

%% Vectoren uitmiddelen

v_in = [v_in_1, v_in_2, v_in_3, v_in_4, v_in_5];
v_gem = [v_gem_1, v_gem_2, v_gem_3, v_gem_4, v_gem_5];

clear v_in_1 v_in_2 v_in_3 v_in_4 v_in_5
clear v_gem_1 v_gem_2 v_gem_3 v_gem_4 v_gem_5
clear t_in_1 t_in_2 t_in_3 t_in_4 t_in_5
clear t_gem_1 t_gem_2 t_gem_3 t_gem_4 t_gem_5

for i = 1:lengtevar
    [temp, stemp] = gemiddelde(v_in(i,:));
    v_in_avg(i) = temp;
    sv_in_avg(i) = stemp;
    clear temp stemp    
    [temp, stemp] = gemiddelde(v_gem(i,:));
    v_gem_avg(i) = temp;
    sv_gem_avg(i) = stemp;
    clear temp stemp
end

figure
errorbar(t,v_gem_avg,sv_gem_avg,sv_gem_avg,'k.--')
title('Gemiddelde data: globaal')
xlabel('Tijd')
ylabel('Voltage (V)')

figure
plot(t,v_gem_avg), hold on

%% Nulwaarden weggooien?

for i = length(t):-1:1
    if v_gem_avg(i) <= 0.03;
        v_gem_avg(i) = [ ];
        v_in_avg(i) = [ ];
        t(i) = [ ];
        sv_gem_avg(i) = [ ];
        sv_in_avg(i) = [ ];
    end
end

%De laatste is hardnekkig en moet handmatig verwijderd worden:
t(994) = [ ];
t(993) = [ ];
v_gem_avg(994) = [ ];
v_gem_avg(993) = [ ];
sv_gem_avg(994) = [ ];
sv_gem_avg(993) = [ ];
v_in_avg(994) = [ ];
v_in_avg(993) = [ ];
sv_in_avg(994) = [ ];
sv_in_avg(993) = [ ];

figure(5)
plot(t,v_gem_avg,'b.'), title('Globale data: met rechte'), hold on

%% data optimaliseren voor gauss
% 
% [a,sa,b,sb] = LinRegWillOf(t,v_gem_avg)
% y = (a.*t+b)';
% [vl,vu] = voltages('globaal')
m = (max(v_gem_avg)-min(v_gem_avg))/(max(t)-min(t));
y = m*(t-t(550))+v_gem_avg(550);
plot(t,y,'r--')
xlabel('tijd')
ylabel('Voltage (V)')

test = (v_gem_avg-y');

figure(42069)
plot(t,test,'b.')
xlabel('tijd')
title('Globale data: transformatie')
disp('hierop een 8ste orde gauss fit (som van 8 gaussische functies) levert bruikbare waarden!')

%% Klaar voor gaussische fit
tijd = t;
data = test;