clear, clc, close all
run('verwerking.m')

%% NTC: Opwarming

[a,sa,b,sb] = LinRegWillOf(theta_ntc,X_ntc,s_X_ntc);

disp('Voor NTC (opwarming):')
disp(['    ','a = ',num2str(a),'+-',num2str(sa)])
disp(['    ','b = ',num2str(b),'+-',num2str(sb)])

% Plot maken
    figure(), grid on, box on, hold on;
    errorbar(theta_ntc,X_ntc,s_X_ntc,s_X_ntc,ones(1,length(theta_ntc)),...
        ones(1,length(theta_ntc)),'k.','MarkerSize',12)

    title('Weerstand NTC: Opwarming: Lineaire Regressie')
    xlabel('Temperatuur \theta (°C)')
    ylabel('Weerstand X (\Omega)')
    axis([15 70 1000 7000])
    
    x = [min(theta_ntc),max(theta_ntc)];
    
    y_fit = a*x+b;
    y_p = (a+sa)*x+(b+sb);
    y_m = (a-sa)*x+(b-sb);
    
    plot(x,y_fit,'b--')
    plot(x,y_p,'r-.')
    plot(x,y_m,'r-.')
    
    legend('Data','Lineaire Fit','Foutenspie')
    
    tc_ntc_warm = a/b;
    s_tc_ntc_warm = sqrt(sa^2*(1/b)+sb^2*(-a/b^2)^2);
    disp(['TC_NTC_warm = ',num2str(tc_ntc_warm),'+-',...
        num2str(s_tc_ntc_warm)])
    
    clear a b sa sb y_fit y_p y_m x
    
%% PTC: Opwarming

[a,sa,b,sb] = LinRegWillOf(theta_ptc,X_ptc,s_X_ptc);

disp('Voor PTC (opwarming):')
disp(['    ','a = ',num2str(a),'+-',num2str(sa)])
disp(['    ','b = ',num2str(b),'+-',num2str(sb)])

% Plot maken
    figure(), grid on, box on, hold on;
    errorbar(theta_ptc,X_ptc,s_X_ptc,s_X_ptc,ones(1,length(theta_ptc)),...
        ones(1,length(theta_ptc)),'k.','MarkerSize',12)

    title('Weerstand PTC: Opwarming: Lineaire Regressie')
    xlabel('Temperatuur \theta (°C)')
    ylabel('Weerstand X (\Omega)')
    axis([15 70 200 1000])
    
    x = [min(theta_ptc),max(theta_ptc)];
    
    y_fit = a*x+b;
    y_p = (a+sa)*x+(b+sb);
    y_m = (a-sa)*x+(b-sb);
    
    plot(x,y_fit,'b--')
    plot(x,y_p,'r-.')
    plot(x,y_m,'r-.')
    
    legend('Data','Lineaire Fit','Foutenspie','Location','northwest')
    
    tc_ptc_warm = a/b;
    s_tc_ptc_warm = sqrt(sa^2*(1/b)+sb^2*(-a/b^2)^2);
    disp(['TC_PTC_warm = ',num2str(tc_ptc_warm),'+-',...
        num2str(s_tc_ptc_warm)])
    
    clear a b sa sb y_fit y_p y_m x

%% Afkoeling

% NTC

    [a,sa,b,sb] = LinRegWillOf(afkoeling_temperatuur(1,:),...
        X_afkoeling(1,:),s_X_afkoeling(1,:));

    disp('Voor NTC (afkoeling):')
    disp(['    ','a = ',num2str(a),'+-',num2str(sa)])
    disp(['    ','b = ',num2str(b),'+-',num2str(sb)])

    % Plot maken
        figure(), grid on, box on, hold on;
        errorbar(afkoeling_temperatuur(1,:),X_afkoeling(1,:),...
            s_X_afkoeling(1,:),s_X_afkoeling(1,:),ones(1,length(...
            afkoeling_temperatuur(1,:))),ones(1,length(...
            afkoeling_temperatuur(1,:))),'k.','MarkerSize',12)

        title('Weerstand NTC: Afkoeling: Lineaire Regressie')
        xlabel('Temperatuur \theta (°C)')
        ylabel('Weerstand X (\Omega)')
        %axis([15 70 1000 7000])

        x = [min(afkoeling_temperatuur(1,:)),max(...
            afkoeling_temperatuur(1,:))];

        y_fit = a*x+b;
        y_p = (a+sa)*x+(b+sb);
        y_m = (a-sa)*x+(b-sb);

        plot(x,y_fit,'b--')
        plot(x,y_p,'r-.')
        plot(x,y_m,'r-.')

        legend('Data','Lineaire Fit','Foutenspie')
        
        tc_ntc_koel = a/b;
        s_tc_ntc_koel = sqrt(sa^2*(1/b+sb^2*(-a/b^2)^2));
        disp(['TC_NTC_koel = ',num2str(tc_ntc_koel),'+-',...
            num2str(s_tc_ntc_koel)])

        clear a b sa sb y_fit y_p y_m x
        

% PTC

    [a,sa,b,sb] = LinRegWillOf(afkoeling_temperatuur(2,:),...
        X_afkoeling(2,:),s_X_afkoeling(2,:));

    disp('Voor PTC (afkoeling):')
    disp(['    ','a = ',num2str(a),'+-',num2str(sa)])
    disp(['    ','b = ',num2str(b),'+-',num2str(sb)])

    % Plot maken
        figure(), grid on, box on, hold on;
        errorbar(afkoeling_temperatuur(2,:),X_afkoeling(2,:),...
            s_X_afkoeling(2,:),s_X_afkoeling(2,:),ones(1,length(...
            afkoeling_temperatuur(2,:))),ones(1,length(...
            afkoeling_temperatuur(2,:))),'k.','MarkerSize',12)

        title('Weerstand PTC: Afkoeling: Lineaire Regressie')
        xlabel('Temperatuur \theta (°C)')
        ylabel('Weerstand X (\Omega)')
        %axis([15 70 1000 7000])

        x = [min(afkoeling_temperatuur(2,:)),max(...
            afkoeling_temperatuur(2,:))];

        y_fit = a*x+b;
        y_p = (a+sa)*x+(b+sb);
        y_m = (a-sa)*x+(b-sb);

        plot(x,y_fit,'b--')
        plot(x,y_p,'r-.')
        plot(x,y_m,'r-.')

        legend('Data','Lineaire Fit','Foutenspie')
        
        tc_ptc_koel = a/b;
        s_tc_ptc_koel = sqrt(sa^2*(1/b+sb^2*(-a/b^2)^2));
        disp(['TC_PTC_koel = ',num2str(tc_ptc_koel),'+-',...
            num2str(s_tc_ptc_koel)])

        clear a b sa sb y_fit y_p y_m x