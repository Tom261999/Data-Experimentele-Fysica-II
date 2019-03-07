clear, clc, close all
run('verwerking.m')

%% Opwarming NTC

figure(), grid on, box on, hold on;
%plot(theta_ntc,X_ntc,'k.','MarkerSize',12);
errorbar(theta_ntc,X_ntc,s_X_ntc,s_X_ntc,ones(1,length(theta_ntc)),...
    ones(1,length(theta_ntc)),'k.','MarkerSize',12)

title('Weerstand NTC: Opwarming')
xlabel('Temperatuur \theta (°C)')
ylabel('Weerstand X (\Omega)')
axis([15 70 1000 7000])

% 2 fits op subplots
figure(), grid on, box on, hold all;
    % Kwadratische fit
    subplot(1,2,1), grid on, box on, hold all
    errorbar(theta_ntc,X_ntc,s_X_ntc,s_X_ntc,ones(1,length(theta_ntc)),...
    ones(1,length(theta_ntc)),'k.','MarkerSize',12)

    xlabel('Temperatuur \theta (°C)')
    ylabel('Weerstand X (\Omega)')
    axis([15 70 -8000 12000])
    
    q_fit = 2.18.*theta_ntc.^2-297.*theta_ntc+1.17*10^4;
    q_p = (2.18+0.75).*theta_ntc.^2+(-297+62).*theta_ntc+(1.17+0.13)*10^4;
    q_m = (2.18-0.75).*theta_ntc.^2+(-297-62).*theta_ntc+(1.17-0.13)*10^4;
    
    plot(theta_ntc,q_fit,'b--')
    plot(theta_ntc,q_p,'r-.')
    plot(theta_ntc,q_m,'r-.')
    
    legend('Data','Fit','Foutenspie')
    title(legend,'Kwadratische Fit')
    
    clear q_fit q_p q_m
    
    % Exponentiele fit
    subplot(1,2,2), grid on, box on, hold all
    errorbar(theta_ntc,X_ntc,s_X_ntc,s_X_ntc,ones(1,length(theta_ntc)),...
    ones(1,length(theta_ntc)),'k.','MarkerSize',12)

    xlabel('Temperatuur \theta (°C)')
    ylabel('Weerstand X (\Omega)')
    axis([15 70 0 14000])
    
    q_fit = 1.32*10^4*exp(-0.035*theta_ntc);
    q_p = (1.32+0.14)*10^4*exp((-0.035+0.032)*theta_ntc);
    q_m = (1.32-0.14)*10^4*exp((-0.035-0.032)*theta_ntc);
    
    plot(theta_ntc,q_fit,'b--')
    plot(theta_ntc,q_p,'r-.')
    plot(theta_ntc,q_m,'r-.')
    
    legend('Data','Fit','Foutenspie')
    title(legend,'Exponentiële Fit')
    
    clear q_fit q_p q_m
    
%% Opwarming PTC

figure(), grid on, box on, hold on;
errorbar(theta_ptc,X_ptc,s_X_ptc,s_X_ptc,ones(1,length(theta_ptc)),...
    ones(1,length(theta_ptc)),'k.','MarkerSize',12)

title('Weerstand PTC: Opwarming')
xlabel('Temperatuur \theta (°C)')
ylabel('Weerstand X (\Omega)')
axis([15 70 200 1000])

% 2 fits op subplots
figure(), grid on, box on, hold all;
    % Kwadratische fit
    subplot(1,2,1), grid on, box on, hold all
    errorbar(theta_ptc,X_ptc,s_X_ptc,s_X_ptc,ones(1,length(theta_ptc)),...
    ones(1,length(theta_ptc)),'k.','MarkerSize',12)

    xlabel('Temperatuur \theta (°C)')
    ylabel('Weerstand X (\Omega)')
    axis([15 70 0 1200])
    
    q_fit = 0.371.*theta_ptc.^2-18.6.*theta_ptc+494;
    q_p = (0.371+0.039).*theta_ptc.^2+(-18.6+3.4).*theta_ptc+(494+68);
    q_m = (0.371-0.039).*theta_ptc.^2+(-18.6-3.4).*theta_ptc+(494-68);
    
    plot(theta_ptc,q_fit,'b--')
    plot(theta_ptc,q_p,'r-.')
    plot(theta_ptc,q_m,'r-.')
    
    legend('Data','Fit','Foutenspie','Location','northwest')
    title(legend,'Kwadratische Fit')
    
    clear q_fit q_p q_m
    
    % Exponentiele fit
    subplot(1,2,2), grid on, box on, hold all
    errorbar(theta_ptc,X_ptc,s_X_ptc,s_X_ptc,ones(1,length(theta_ptc)),...
    ones(1,length(theta_ptc)),'k.','MarkerSize',12)

    xlabel('Temperatuur \theta (°C)')
    ylabel('Weerstand X (\Omega)')
    axis([15 70 0 1200])
    
    q_fit = 100*exp(0.0325*theta_ptc);
    q_p = (100+14)*exp((0.0325+0.0025)*theta_ptc);
    q_m = (100-14)*exp((0.0325-0.0025)*theta_ptc);
    
    plot(theta_ptc,q_fit,'b--')
    plot(theta_ptc,q_p,'r-.')
    plot(theta_ptc,q_m,'r-.')
    
    legend('Data','Fit','Foutenspie','Location','northwest')
    title(legend,'Exponentiële Fit')
    
    clear q_fit q_p q_m
    
%% Afkoeling

%NTC
figure(), grid on, box on, hold on;
errorbar(afkoeling_temperatuur(1,:),X_afkoeling(1,:),s_X_afkoeling(1,:),...
    s_X_afkoeling(1,:),ones(1,length(afkoeling_temperatuur(1,:))),...
    ones(1,length(afkoeling_temperatuur(1,:))),'k.','MarkerSize',12)

title('Weerstand NTC: Afkoeling')
xlabel('Temperatuur \theta (°C)')
ylabel('Weerstand X (\Omega)')

%PTC
figure(), grid on, box on, hold on;
errorbar(afkoeling_temperatuur(2,:),X_afkoeling(2,:),s_X_afkoeling(2,:),...
    s_X_afkoeling(2,:),ones(1,length(afkoeling_temperatuur(2,:))),...
    ones(1,length(afkoeling_temperatuur(2,:))),'k.','MarkerSize',12)

title('Weerstand PTC: Afkoeling')
xlabel('Temperatuur \theta (°C)')
ylabel('Weerstand X (\Omega)')
