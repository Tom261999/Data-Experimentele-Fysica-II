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
figure
plot(t,v_gem_avg), hold on

%% Nulwaarden weggooien?

for i = length(t):-1:1
    if v_gem_avg(i) <= 0.03;
        v_gem_avg(i) = [ ];
        t(i) = [ ];
    end
end

%De laatste is hardnekkig en moet handmatig verwijderd worden:
t(994) = [ ];
v_gem_avg(994) = [ ];
t(993) = [ ];
v_gem_avg(993) = [ ];

figure(69)
plot(t,v_gem_avg), title('plot zonder nulwaarden'), hold on

%% lin reg

[a,sa,b,sb] = LinRegWillOf(t,v_gem_avg)
y = (a.*t+b)';
plot(t,y)

figure(42069)
plot(t,(v_gem_avg-y))
