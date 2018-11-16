clc, clear, close all
format long
%oppervlaktes
diameters %importeert de data van diameters.m

% % [davg,sdavg] = gemiddelde(d,sd);
% % [Davg,sDavg] = gemiddelde(D,sD);

stemp = pi.*(d./2).^2; %opp dunne draad
sstemp = pi.*sd.*d/2;

Stemp = pi.*(D./2).^2; %opp dikke draad
sStemp = pi.*sD.*D./2;

[s,ss] = GewogenGemf(stemp,sstemp);
[S,sS] = GewogenGemf(Stemp,sStemp);

clear d sd D sD davg sdavg Davg sDavg stemp sstemp Stemp sStemp %niet meer nodig in verdere berekningen

%%
%resistiviteit dun: V = (rho*I/S)L
dun_resistiviteit

%stoom 1
figure('Name','Lineaire regressie van stroom 1 (dunne draad)')
[k1,sk1] = LinRegf(L,V1);
errorbar(L,V1,sV1,'k.');
legend('y=k_1*x','y=(k_1-sk_1)*x','y=(k_1+s_{k1})*x','Data','Location','northwest')
xlabel('Lengte L (m)')
ylabel('Potentiaal V_1 (V)')
title('Stroom 1 (dun)')
hold off

%subplots stromen 2-5
figure('Name','Lineaire regressie van stromen 2-5 (dunne draad)')
subplot(2,2,1)
[k2,sk2] = LinRegf(L,V2);
errorbar(L,V2,sV2,'k.')
legend('y=k_2*x','y=(k_2-sk_2)*x','y=(k_2+s_{k2})*x','Data','Location','northwest')
title('Stroom 2 (dun)')
xlabel('Lengte L (m)')
ylabel('Potentiaal V_2 (V)')
subplot(2,2,2)
[k3,sk3] = LinRegf(L,V3);
errorbar(L,V3,sV3,'k.')
legend('y=k_3*x','y=(k_3-sk_3)*x','y=(k_3+s_{k3})*x','Data','Location','northwest')
title('Stroom 3 (dun)')
xlabel('Lengte L (m)')
ylabel('Potentiaal V_3 (V)')
subplot(2,2,3)
[k4,sk4] = LinRegf(L,V4);
errorbar(L,V4,sV4,'k.')
legend('y=k_4*x','y=(k_4-sk_4)*x','y=(k_4+s_{k4})*x','Data','Location','northwest')
title('Stroom 4 (dun)')
xlabel('Lengte L (m)')
ylabel('Potentiaal V_4 (V)')
subplot(2,2,4)
[k5,sk5] = LinRegf(L,V5);
errorbar(L,V5,sV5,'k.')
legend('y=k_5*x','y=(k_5-sk_5)*x','y=(k_5+s_{k5})*x','Data','Location','northwest')
title('Stroom 5 (dun)')
xlabel('Lengte L (m)')
ylabel('Potentiaal V_5 (V)')

Ivec = [I1 I2 I3 I4 I5];
sIvec = [sI1 sI2 sI3 sI4 sI5];
kvec = [k1 k2 k3 k4 k5];
skvec = [sk1 sk2 sk3 sk4 sk5];

clear V1 V2 V3 V4 V5 sV1 sV2 sV3 sV4 sV5
clear k1 k2 k3 k4 k5 sk1 sk2 sk3 sk4 sk5
clear I1 I2 I3 I4 I5 sI1 sI2 sI3 sI4 sI5

%Uit k vinden we dan rho: rho = k*s/I
for i = 1:5
    rhovec(i) = kvec(i)*s/Ivec(i);
    srhovec(i) = sqrt(skvec(i)^2*s^2/Ivec(i)^2+...
        ss^2*kvec(i)^2/Ivec(i)^2+...
        sIvec(i)^2*kvec(i)^2*s^2/Ivec(i)^4);
end
clear i

disp('rhovec ='),disp(rhovec)
disp('srhovec='),disp(srhovec)

[rhoavg,srhoavg] = GewogenGemf(rhovec,srhovec)

clear Ivec kvec sIvec skvec rhoavg srhoavg rhovec srhovec

%%
dik_resistiviteit

%Stroom 1
figure('Name','Lineaire regressie van stroom 1 (dikke draad)')
[k1,sk1] = LinRegf(L,V1);
errorbar(L,V1,sV1,'k.');
legend('y=k_1*x','y=(k_1-sk_1)*x','y=(k_1+s_{k1})*x','Data','Location','northwest')
xlabel('Lengte L (m)')
ylabel('Potentiaal V_1 (V)')
title('Stroom 1')
hold off

%subplots stromen 2-5
figure('Name','Lineaire regressie van stromen 2-5 (dikke draad)')
subplot(2,2,1)
[k2,sk2] = LinRegf(L,V2);
errorbar(L,V2,sV2,'k.')
legend('y=k_2*x','y=(k_2-sk_2)*x','y=(k_2+s_{k2})*x','Data','Location','northwest')
title('Stroom 2 (dik)')
xlabel('Lengte L (m)')
ylabel('Potentiaal V_2 (V)')
subplot(2,2,2)
[k3,sk3] = LinRegf(L,V3);
errorbar(L,V3,sV3,'k.')
legend('y=k_3*x','y=(k_3-sk_3)*x','y=(k_3+s_{k3})*x','Data','Location','northwest')
title('Stroom 3 (dik)')
xlabel('Lengte L (m)')
ylabel('Potentiaal V_3 (V)')
subplot(2,2,3)
[k4,sk4] = LinRegf(L,V4);
errorbar(L,V4,sV4,'k.')
legend('y=k_4*x','y=(k_4-sk_4)*x','y=(k_4+s_{k4})*x','Data','Location','northwest')
title('Stroom 4 (dik)')
xlabel('Lengte L (m)')
ylabel('Potentiaal V_4 (V)')
subplot(2,2,4)
[k5,sk5] = LinRegf(L,V5);
errorbar(L,V5,sV5,'k.')
legend('y=k_5*x','y=(k_5-sk_5)*x','y=(k_5+s_{k5})*x','Data','Location','northwest')
title('Stroom 5 (dik)')
xlabel('Lengte L (m)')
ylabel('Potentiaal V_5 (V)')

Ivec = [I1 I2 I3 I4 I5];
sIvec = [sI1 sI2 sI3 sI4 sI5];
kvec = [k1 k2 k3 k4 k5];
skvec = [sk1 sk2 sk3 sk4 sk5];

clear V1 V2 V3 V4 V5 sV1 sV2 sV3 sV4 sV5
clear k1 k2 k3 k4 k5 sk1 sk2 sk3 sk4 sk5
clear I1 I2 I3 I4 I5 sI1 sI2 sI3 sI4 sI5

%Uit k vinden we dan rho: rho = k*S/I
for i = 1:5
    rhovec(i) = kvec(i)*S/Ivec(i);
    srhovec(i) = sqrt(skvec(i)^2*S^2/Ivec(i)^2+...
        sS^2*kvec(i)^2/Ivec(i)^2+...
        sIvec(i)^2*kvec(i)^2*S^2/Ivec(i)^4);
end
clear i

disp('rhovec ='),disp(rhovec)
disp('srhovec='),disp(srhovec)

[rhoavg,srhoavg] = GewogenGemf(rhovec,srhovec)

clear Ivec kvec sIvec skvec rhoavg srhoavg rhovec srhovec