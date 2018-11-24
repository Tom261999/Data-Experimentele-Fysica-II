% load('Datasets\globaal.mat')

%%
%Alle datasets overelkaar geplot:

figure('name','Alle datasets : Gemeten portentiaal'), hold on
plot(t_gem_1,v_gem_1)
plot(t_gem_2,v_gem_2)
plot(t_gem_3,v_gem_3)
plot(t_gem_4,v_gem_4)
plot(t_gem_5,v_gem_5), hold off

lengten = [length(t_gem_1), length(t_gem_2), length(t_gem_3), length(t_gem_4), length(t_gem_5)];

for i = 1:min(lengten)
    t_avg(i) = mean([t_gem_1(i), t_gem_2(i), t_gem_3(i), t_gem_4(i), t_gem_5(i)]);
    v_avg(i) = mean([v_gem_1(i), v_gem_2(i), v_gem_3(i), v_gem_4(i), v_gem_5(i)]);
end

figure('name','Uitgemiddelde waarden')
plot(t_avg,v_avg)

disp('Is dit wel nuttig?')

%%
%Datasets aanpassen opdat ze samen starten, we nemen 0.025 als grenswaarde
%voor ruis. (Puur op het zicht bepaald!)

for i = 1:length(v_gem_1)
    if v_gem_1(i) < 0.025
        v_gem_1(i) = 0.025;
    end
end

plot(t_gem_1,v_gem_1)

%Idem voor de andere grafieken:
for i = 1:length(v_gem_2)
    if v_gem_2(i) < 0.025
        v_gem_2(i) = 0.025;
    end
end
for i = 1:length(v_gem_3)
    if v_gem_3(i) < 0.025
        v_gem_3(i) = 0.025;
    end
end
for i = 1:length(v_gem_4)
    if v_gem_4(i) < 0.025
        v_gem_4(i) = 0.025;
    end
end
for i = 1:length(v_gem_5)
    if v_gem_5(i) < 0.025
        v_gem_5(i) = 0.025;
    end
end
