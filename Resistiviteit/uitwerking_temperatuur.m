clear, close all
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

%clear d sd D sD davg sdavg Davg sDavg stemp sstemp Stemp sStemp %niet meer nodig in verdere berekningen

%%
dun_temperatuur

Ivec = [I1 I2 I3 I4 I5 I6 I7];
sIvec = [sI1 sI2 sI3 sI4 sI5 sI6 sI7];
Vmat = [V1', V2', V3', V4', V5', V6', V7'];
sVmat = [sV1', sV2', sV3', sV4', sV5', sV6', sV7'];
clear I1 I2 I3 I4 I5 I6 I7 sI1 sI2 sI3 sI4 sI5 sI6 sI7
clear V1 V2 V3 V4 V5 V6 V7 sV1 sV2 sV3 sV4 sV5 sV6 sV7

for i = 1:7
    [kvec(i),skvec(i)] = LinRegfalt(L,Vmat(:,i));
end
clear i

rhovec = s*kvec./Ivec;
srhovec = sqrt((skvec.*s./Ivec).^2+(ss.*kvec./Ivec).^2+(s.*sIvec.*kvec./(Ivec.^2)).^2);

figure('name','Invloed Temperatuur (dun)')
errorbar(T,rhovec,srhovec)
set(gcf, 'Position', [100, 200, 800, 550])
title('Resistiviteit i.f.v. Temperatuur (dun)')
xlabel('Temperatuur (°C)'), ylabel('Resistiviteit (\Omega\cdot m)')
%clear rhovec srhovec Ivec sIvec kvec skvec Vmat sVmat

%%
% % %ZONDER LAATSTE ELEMENT -> __NIET MEER NODIG DATA-ANOMALIE GEELIMINEERD__
% % dun_temperatuur
% % 
% % Ivec = [I1 I2 I3 I4 I5 I6 I7];
% % sIvec = [sI1 sI2 sI3 sI4 sI5 sI6 sI7];
% % Vmat = [V1', V2', V3', V4', V5', V6', V7'];
% % sVmat = [sV1', sV2', sV3', sV4', sV5', sV6', sV7'];
% % clear I1 I2 I3 I4 I5 I6 I7 sI1 sI2 sI3 sI4 sI5 sI6 sI7
% % clear V1 V2 V3 V4 V5 V6 V7 sV1 sV2 sV3 sV4 sV5 sV6 sV7
% % 
% % for i = 1:7
% %     [kvec(i),skvec(i)] = LinRegfalt(L,Vmat(:,i));
% % end
% % clear i
% % 
% % rhovec = s*kvec./Ivec;
% % srhovec = sqrt((skvec.*s./Ivec).^2+(ss.*kvec./Ivec).^2+(s.*sIvec.*kvec./(Ivec.^2)).^2);
% % 
% % T(7) = [];
% % sT(7) = [];
% % rhovec(7) = [];
% % srhovec(7) = [];
% % 
% % figure('name','Invloed Temperatuur (dun); zonder foutief element')
% % errorbar(T,rhovec,srhovec)
% % title('Resistiviteit i.f.v. Temperatuur (dun)')
% % xlabel('Temperatuur (°C)'), ylabel('Resistiviteit (\Omega\cdot m)')
% % clear rhovec srhovec Ivec sIvec kvec skvec Vmat sVmat
% % 
% % %%
% % dik_temperatuur
% % 
% % Ivec = [I1 I2 I3 I4 I5 I6 I7];
% % sIvec = [sI1 sI2 sI3 sI4 sI5 sI6 sI7];
% % Vmat = [V1', V2', V3', V4', V5', V6', V7'];
% % sVmat = [sV1', sV2', sV3', sV4', sV5', sV6', sV7'];
% % clear I1 I2 I3 I4 I5 I6 I7 sI1 sI2 sI3 sI4 sI5 sI6 sI7
% % clear V1 V2 V3 V4 V5 V6 V7 sV1 sV2 sV3 sV4 sV5 sV6 sV7
% % 
% % for i = 1:7
% %     [kvec(i),skvec(i)] = LinRegfalt(L,Vmat(:,i));
% % end
% % clear i
% % 
% % rhovec = s*kvec./Ivec;
% % srhovec = sqrt((skvec.*s./Ivec).^2+(ss.*kvec./Ivec).^2+(s.*sIvec.*kvec./(Ivec.^2)).^2);
% % 
% % figure('name','Invloed Temperatuur (dik)')
% % errorbar(T,rhovec,srhovec)
% % title('Resistiviteit i.f.v. Temperatuur (dik)')
% % xlabel('Temperatuur (°C)'), ylabel('Resistiviteit (\Omega\cdot m)')
% % clear rhovec srhovec Ivec sIvec kvec skvec Vmat sVmat
% % 
% % %%
% % %ZONDER FOUTIEF ELEMENT
% % 
% % dik_temperatuur
% % 
% % Ivec = [I1 I2 I3 I4 I5 I6 I7];
% % sIvec = [sI1 sI2 sI3 sI4 sI5 sI6 sI7];
% % Vmat = [V1', V2', V3', V4', V5', V6', V7'];
% % sVmat = [sV1', sV2', sV3', sV4', sV5', sV6', sV7'];
% % clear I1 I2 I3 I4 I5 I6 I7 sI1 sI2 sI3 sI4 sI5 sI6 sI7
% % clear V1 V2 V3 V4 V5 V6 V7 sV1 sV2 sV3 sV4 sV5 sV6 sV7
% % 
% % for i = 1:7
% %     [kvec(i),skvec(i)] = LinRegfalt(L,Vmat(:,i));
% % end
% % clear i
% % 
% % rhovec = s*kvec./Ivec;
% % srhovec = sqrt((skvec.*s./Ivec).^2+(ss.*kvec./Ivec).^2+(s.*sIvec.*kvec./(Ivec.^2)).^2);
% % 
% % T(2) = [];
% % sT(2) = [];
% % rhovec(2) = [];
% % srhovec(2) = [];
% % 
% % figure('name','Invloed Temperatuur (dik); zonder foutief element')
% % errorbar(T,rhovec,srhovec)
% % title('Resistiviteit i.f.v. Temperatuur (dik)')
% % xlabel('Temperatuur (°C)'), ylabel('Resistiviteit (\Omega\cdot m)')
% % clear rhovec srhovec Ivec sIvec kvec skvec Vmat sVmat