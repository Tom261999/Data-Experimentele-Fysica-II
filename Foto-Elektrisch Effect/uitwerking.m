clear, clc, close all
c = 2.998*10^8; %m/s
e = 1.602*10^-19; %C

%% Achtergrondmetingen
run('achtergrond.m')
[U_achter,sU_achter] = gemiddelde(U_achter);

%% Intensiteitafhankelijkheid
run('intensiteit.m')
percentage = [20 40 60 80 100];

% De 3 meetwaarden voor iedere instensiteit uitmiddelen:
[U_20,sU_20] = gemiddelde(U_20);
[U_40,sU_40] = gemiddelde(U_40);
[U_60,sU_60] = gemiddelde(U_60);
[U_80,sU_80] = gemiddelde(U_80);
[U_100,sU_100] = gemiddelde(U_100);

% In nuttige vecotren dan:
U_intens = [U_20 U_40 U_60 U_80 U_100];
sU_intens = [sU_20 sU_40 sU_60 sU_80 sU_100];
clear sU_20 sU_40 sU_60 sU_80 sU_100 U_20 U_40 U_60 U_80 U_100

% Dan de achtergrond aftrekken:
U_intens = U_intens - U_achter*ones(1,5);

% Met foutenpropagatie:
for i = 1:5
    sU_intens(i) = sqrt(sU_intens(i)^2+sU_achter^2);
end
clear i

% Figuur
figure(1)
errorbar(percentage,U_intens,sU_intens,sU_intens,'b.'), hold on
plot(percentage,U_intens,'k.','MarkerSize',12)
axis([0 120 0.25 0.45])
xlabel('Percentage doorgelaten licht')
ylabel('Spanning U (V)')
title('Spanning i.f.v. Intensiteit')
grid on
hold off

%% Hg-lamp
run('Hg.m')

% Uitmiddelen:
[U_hg_y,sU_hg_y] = gemiddelde(U_hg_y);
[U_hg_g,sU_hg_g] = gemiddelde(U_hg_g);
[U_hg_v1,sU_hg_v1] = gemiddelde(U_hg_v1);
[U_hg_v2,sU_hg_v2] = gemiddelde(U_hg_v2);

legende_hg = ["Geel" "Groen" "Violet 1" "Violet 2"];
U_hg = [U_hg_y U_hg_g U_hg_v1 U_hg_v2];
sU_hg = [sU_hg_y sU_hg_g sU_hg_v1 sU_hg_v2];
clear U_hg_y U_hg_g U_hg_v1 U_hg_v2 sU_hg_y sU_hg_g sU_hg_v1 sU_hg_v2

% Achtergrond aftrekken
U_hg = U_hg - U_achter*ones(1,4);

% Met foutenpropagatie:
for i = 1:4
    sU_hg(i) = sqrt(sU_hg(i)^2+sU_achter^2);
end
clear i

golflengten_hg = (10^(-10)).*[5846 5490 4358 4047]; %meter
frequenties_hg = c./golflengten_hg; %zie http:\\telescript.denayer.wenk.be/~eko/labo_fysica/SPTheorie_v2010.pdf

%% Ne-lamp
run('Ne.m')

%Uitmiddelen
[U_ne_ro,sU_ne_ro] = gemiddelde(U_ne_ro);
[U_ne_y,sU_ne_y] = gemiddelde(U_ne_y);
[U_ne_r,sU_ne_r] = gemiddelde(U_ne_r);

legende_ne = ["Rood Outlier" "Geel" "Rood"];
U_ne = [U_ne_ro U_ne_y U_ne_r];
sU_ne = [sU_ne_ro sU_ne_y sU_ne_r];
clear U_ne_ro U_ne_y U_ne_r sU_ne_ro sU_ne_y sU_ne_r

% Achtergrond aftrekken
U_ne = U_ne - U_achter*ones(1,3);

% Met foutenpropagatie
for i = 1:3
    sU_ne(i) = sqrt(sU_ne(i)^2+sU_achter^2);
end
clear i

golflengten_ne = (10^(-10)).*[7280 5880 6680]; %m
% golflengten_ne = (10^(-10)).*[7525 5551 6232]; %m
frequenties_ne = c./golflengten_ne;

%% Plot alle spanningen t.o.v. frequenties

figure(2)
plot(frequenties_hg,U_hg,'r*'), hold on, plot(frequenties_ne,U_ne,'b*')
title('Spanning i.f.v. frequentie')
xlabel('Frequentie f (Hz)')
ylabel('Spanning U (V)')
legend('Hg','Ne','location','northwest')
title(legend,'Spectraallamp')

%% Lineaire regressie
U = [U_ne,U_hg];
sU = [sU_ne,sU_hg];
f = [frequenties_ne,frequenties_hg];

figure(3)
[a,sa,b,sb] = LinRegWillOf(f,U,sU)
x = 10^14.*[4,7.5];
    y = a*x+b;
    ymax = (a+sa)*x+b+sb;
    ymin = (a-sa)*x+b-sb;
    plot(x,y,'b--'); hold on
    plot(x,ymin,'r--'), plot(x,ymax,'r-.')
    neonplot = errorbar(f(1:3),U(1:3),sU(1:3),'r.')
    kwikplot = errorbar(f(4:7),U(4:7),sU(4:7),'b.')
xlabel('Frequentie f (Hz)')
ylabel('Spanning U (V)')
title('Lineaire regressie')
legend([neonplot kwikplot],'Ne','Hg','location','northwest')
title(legend,'Spectraallamp')
grid on

%% Planck's constante

h = a*e
sh = e*sa

%% Werkfunctie
W0 = abs(b)
sW0 = sb
% W0 = e*abs(b)
% sW0 = e*sb

%% Drempelwaarde

f_0 = -b/a
sf_0 = sqrt(sa^2*(b/a^2)^2+sb^2*(1/a)^2)