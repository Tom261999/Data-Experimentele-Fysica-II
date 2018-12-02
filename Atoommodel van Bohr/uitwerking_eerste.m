clear, clc, close all
load('Datasets\eerste.mat')

%% Alle sets synchroniseren

for i = 1:length(v_gem_1)
    if v_gem_1(i) < 0.03
        v_gem_1(i) = 0.03;
    end
end

%Idem voor de andere grafieken:
for i = 1:length(v_gem_2)
    if v_gem_2(i) < 0.03
        v_gem_2(i) = 0.03;
    end
end
for i = 1:length(v_gem_3)
    if v_gem_3(i) < 0.03
        v_gem_3(i) = 0.03;
    end
end
for i = 1:length(v_gem_4)
    if v_gem_4(i) < 0.03
        v_gem_4(i) = 0.03;
    end
end
for i = 1:length(v_gem_5)
    if v_gem_5(i) < 0.03
        v_gem_5(i) = 0.03;
    end
end


%------

%Nu kunnen we proberen de datasets te synchroniseren:

i = 1;
while i < length(v_gem_1)
    if v_gem_1(i) <= 0.03 
        sync(1) = i;
        i = i+1;
    elseif v_gem_1(i) > 0.03
        break
    end
end
i = 1;
while i < length(v_gem_2)
    if v_gem_2(i) <= 0.03 
        sync(2) = i;
        i = i+1;
    elseif v_gem_2(i) > 0.03
        break
    end
end
i = 1;
while i < length(v_gem_3)
    if v_gem_3(i) <= 0.03 
        sync(3) = i;
        i = i+1;
    elseif v_gem_3(i) > 0.03
        break
    end
end
i = 1;
while i < length(v_gem_4)
    if v_gem_4(i) <= 0.03 
        sync(4) = i;
        i = i+1;
    elseif v_gem_4(i) > 0.03
        break
    end
end
i = 1;
while i < length(v_gem_5)
    if v_gem_5(i) <= 0.03 
        sync(5) = i;
        i = i+1;
    elseif v_gem_5(i) > 0.03
        break
    end
end
clear i

sync(2) = sync(2)-1;
sync(5) = sync(5)-6;
sync(3) = sync(3)+7;
disp('sync = '), disp(sync)

lengten = [length(v_gem_1), length(v_gem_2), length(v_gem_3), length(v_gem_4), length(v_gem_5)]


t_gem_1 = t_gem_1(sync(1):1000+sync(1));
% t_gem_2 = t_gem_2(sync(2):1000+sync());
% t_gem_3 = t_gem_3(sync(3):1000+sync());
% t_gem_4 = t_gem_4(sync(4):1000+sync());
% t_gem_5 = t_gem_5(sync(5):1000+sync());

v_gem_1 = v_gem_1(sync(1):1000+sync(1));
v_gem_2 = v_gem_2(sync(2):1000+sync(2));
v_gem_3 = v_gem_3(sync(3):1000+sync(3));
v_gem_4 = v_gem_4(sync(4):1000+sync(4));
v_gem_5 = v_gem_5(sync(5):1000+sync(5));

t_in_1 = t_in_1(sync(1):1000+sync(1));
% t_in_2 = t_in_2(sync(2):1000+sync());
% t_in_3 = t_in_3(sync(3):1000+sync());
% t_in_4 = t_in_4(sync(4):1000+sync());
% t_in_5 = t_in_5(sync(5):1000+sync());

v_in_1 = v_in_1(sync(1):1000+sync(1));
v_in_2 = v_in_2(sync(2):1000+sync(2));
v_in_3 = v_in_3(sync(3):1000+sync(3));
v_in_4 = v_in_4(sync(4):1000+sync(4));
v_in_5 = v_in_5(sync(5):1000+sync(5));
t = t_gem_1; %universele tijd nu;
clear t_in_1 t_in_2 t_in_3 t_in_4 t_in_5
clear t_gem_1 t_gem_2 t_gem_3 t_gem_4 t_gem_5
disp('hoera! gesynchroniseerd!')

%% Afkappen na zekere waarde opdat we geen nutteloze waarden overhouden

t = t(1:940);

v_gem_1 = v_gem_1(1:940);
v_gem_2 = v_gem_2(1:940);
v_gem_3 = v_gem_3(1:940);
v_gem_4 = v_gem_4(1:940);
v_gem_5 = v_gem_5(1:940);

v_in_1 = v_in_1(1:940);
v_in_2 = v_in_2(1:940);
v_in_3 = v_in_3(1:940);
v_in_4 = v_in_4(1:940);
v_in_5 = v_in_5(1:940);

%% plot voor controle

figure(1)
hold on
plot(t,v_gem_1,'x--')
plot(t,v_gem_2,'x--')
plot(t,v_gem_3,'x--')
plot(t,v_gem_4,'x--')
plot(t,v_gem_5,'x--')
legend('1','2','3','4','5')
title('controleplot')
hold off

v_in = [v_in_1, v_in_2, v_in_3, v_in_4, v_in_5];
v_gem = [v_gem_1, v_gem_2, v_gem_3, v_gem_4, v_gem_5];

clear v_in_1 v_in_2 v_in_3 v_in_4 v_in_5
clear v_gem_1 v_gem_2 v_gem_3 v_gem_4 v_gem_5
clear t_in_1 t_in_2 t_in_3 t_in_4 t_in_5
clear t_gem_1 t_gem_2 t_gem_3 t_gem_4 t_gem_5

for i = 1:940
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
title('Gemiddelde data: eerste piek')
ylabel('Voltage (V)')
xlabel('Tijd')
figure
plot(t,v_gem_avg), hold on

%% Rechte opstellen en er van aftrekken

m = (max(v_gem_avg)-min(v_gem_avg))/(max(t)-min(t));
y = m*(t-t(600))+v_gem_avg(600);
plot(t,y)

test = (v_gem_avg-y');

figure(42069)
plot(t,test,'b.')
xlabel('tijd')
title('Eerste piek data: transformatie')

disp('daar gauss-fit op zetten!')
disp('4de orde geeft structuur goed weer, zo kunnen we de nevepieken ook goed bepalen.')

%% Klaar voor gaussische fit
tijd = t;
data = test;