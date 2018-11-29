clear, clc, close all
load('Datasets\globaal.mat')

%%
%Alle datasets overelkaar geplot:

figure('name','Alle datasets : Gemeten portentiaal'), hold on
plot(t_gem_1,v_gem_1)
plot(t_gem_2,v_gem_2)
plot(t_gem_3,v_gem_3)
plot(t_gem_4,v_gem_4)
plot(t_gem_5,v_gem_5), hold off

% % % lengten = [length(t_gem_1), length(t_gem_2), length(t_gem_3), length(t_gem_4), length(t_gem_5)];
% % % 
% % % for i = 1:min(lengten)
% % %     t_avg(i) = mean([t_gem_1(i), t_gem_2(i), t_gem_3(i), t_gem_4(i), t_gem_5(i)]);
% % %     v_avg(i) = mean([v_gem_1(i), v_gem_2(i), v_gem_3(i), v_gem_4(i), v_gem_5(i)]);
% % % end
% % % 
% % % figure('name','Uitgemiddelde waarden')
% % % plot(t_avg,v_avg)
% % % 
% % % disp('Is dit wel nuttig?')

%%
%Datasets aanpassen opdat ze samen starten, we nemen 0.0255 als grenswaarde
%voor ruis. (Puur op het zicht bepaald!)

for i = 1:length(v_gem_1)
    if v_gem_1(i) < 0.0255
        v_gem_1(i) = 0.0255;
    end
end

%Idem voor de andere grafieken:
for i = 1:length(v_gem_2)
    if v_gem_2(i) < 0.0255
        v_gem_2(i) = 0.0255;
    end
end
for i = 1:length(v_gem_3)
    if v_gem_3(i) < 0.0255
        v_gem_3(i) = 0.0255;
    end
end
for i = 1:length(v_gem_4)
    if v_gem_4(i) < 0.0255
        v_gem_4(i) = 0.0255;
    end
end
for i = 1:length(v_gem_5)
    if v_gem_5(i) < 0.0255
        v_gem_5(i) = 0.0255;
    end
end


%------

%Nu kunnen we proberen de datasets te synchroniseren:

i = 1;
while i < length(v_gem_1)
    if v_gem_1(i) <= 0.0255 
        sync(1) = i;
        i = i+1;
    elseif v_gem_1(i) > 0.0255
        break
    end
end
i = 1;
while i < length(v_gem_2)
    if v_gem_2(i) <= 0.0255 
        sync(2) = i;
        i = i+1;
    elseif v_gem_2(i) > 0.0255
        break
    end
end
i = 1;
while i < length(v_gem_3)
    if v_gem_3(i) <= 0.0255 
        sync(3) = i;
        i = i+1;
    elseif v_gem_3(i) > 0.0255
        break
    end
end
i = 1;
while i < length(v_gem_4)
    if v_gem_4(i) <= 0.0255 
        sync(4) = i;
        i = i+1;
    elseif v_gem_4(i) > 0.0255
        break
    end
end
i = 1;
while i < length(v_gem_5)
    if v_gem_5(i) <= 0.0255 
        sync(5) = i;
        i = i+1;
    elseif v_gem_5(i) > 0.0255
        break
    end
end
clear i

% disp('sync = '), disp(sync)
% disp('minimum is gegeven door i = '), disp(min(sync))
% disp('Dus ik zal er voor zorgen dat alle reeksen 100 plaatsen voor de start beginnen.')

% for i = 1:(sync(1)-100)
%     t_gem_1(i) = [ ];
%     v_gem_1(i) = [ ];
% end
% for i = 1:(sync(2)-100)
%     t_gem_2(i) = [ ];
%     v_gem_2(i) = [ ];
% end
% for i = 1:(sync(3)-100)
%     t_gem_3(i) = [ ];
%     v_gem_3(i) = [ ];
% end
% for i = 1:(sync(4)-100)
%     t_gem_4(i) = [ ];
%     v_gem_4(i) = [ ];
% end
% for i = 1:(sync(5)-100)
%     t_gem_5(i) = [ ];
%     v_gem_5(i) = [ ];
% end

% disp(' '), disp('De nieuwe plots:')
% figure('name','Alle datasets : Gesynchroniseerd'), hold on
% plot(t_gem_1,v_gem_1)
% plot(t_gem_2,v_gem_2)
% plot(t_gem_3,v_gem_3)
% plot(t_gem_4,v_gem_4)
% plot(t_gem_5,v_gem_5), hold off


%Nota: Dit stuk werkte niet, het begin vand e grafieken is te grillig.
%Echter is het stuk waar de potentiaal valt wel duidelijker, ik probeer nu
%vanaf daar de grafieken te synchroniseren.

%%
grens = 0.5; %Grenswaarde voor de verschillen
for i = 1:length(v_in_1)-1
    if v_in_1(i)-v_in_1(i+1) >= grens
        sync(1) = i;
    end
end
for i = 1:length(v_in_2)-1
    if v_in_2(i)-v_in_2(i+1) >= grens
        sync(2) = i+1;
    end
end
for i = 1:length(v_in_3)-1
    if v_in_3(i)-v_in_3(i+1) >= grens
        sync(3) = i;
    end
end
for i = 1:length(v_in_4)-1
    if v_in_4(i)-v_in_4(i+1) >= grens
        sync(4) = i;
    end
end
for i = 1:length(v_in_5)-1
    if v_in_5(i)-v_in_5(i+1) >= grens
        sync(5) = i;
    end
end

sync2 = sync-100.*ones(1,5);% I know it's messy, but at last, it works
sync2(2) = sync2(2)+1;
sync2(5) = sync2(5)+2;
sync2(3) = sync2(3)+70;
sync2(4) = sync2(4)+131;
disp('sync2 = '), disp(sync2)
%Dan verwijderen we de eerste sync2(i) meetwaarden uit de grafieken opdat
%deze zouden synchroniseren in de afzwakking:
for i = 1:sync2(1)
    t_gem_1(length(t_gem_1)) = [ ];
    v_gem_1(1) = [ ];
    t_in_1(length(t_in_1)) = [ ];
    v_in_1(1) = [ ];
end
for i = 1:sync2(2)
    t_gem_2(length(t_gem_2)) = [ ];
    v_gem_2(1) = [ ];
    t_in_2(length(t_in_2)) = [ ];
    v_in_2(1) = [ ];
end
for i = 1:sync2(3)
    t_gem_3(length(t_gem_3)) = [ ];
    v_gem_3(1) = [ ];
    t_in_3(length(t_in_3)) = [ ];
    v_in_3(1) = [ ];
end
for i = 1:sync2(4)
    t_gem_4(length(t_gem_4)) = [ ];
    v_gem_4(1) = [ ];
    t_in_4(length(t_in_4)) = [ ];
    v_in_4(1) = [ ];
end
for i = 1:sync2(5)
    t_gem_5(length(t_gem_5)) = [ ];
    v_gem_5(1) = [ ];
    t_in_5(length(t_in_5)) = [ ];
    v_in_5(1) = [ ];
end

% % nieuw plot:
figure('name','gesynchroniseerde curves'), hold on
plot(t_gem_1,v_gem_1,'x-')
plot(t_gem_2,v_gem_2,'x-')
plot(t_gem_3,v_gem_3,'x-')
plot(t_gem_4,v_gem_4,'x-')
plot(t_gem_5,v_gem_5,'x-'), hold off
legend('1','2','3','4','5')

clear i grens sync sync2
