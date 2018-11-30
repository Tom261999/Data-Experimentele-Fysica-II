clear, clc
data_globaal
figure('name','globaal')
assen = [0 40 0 1.6]
subplot(1,2,1)
plot(t_in_1,v_in_1,'b.--')
title('Ingestuurd voltage')
xlabel('tijd')
ylabel('Voltage (V)')
axis(assen)
subplot(1,2,2)
plot(t_gem_1,v_gem_1,'b.--')
title('Gemeten voltage')
xlabel('tijd')
ylabel('Voltage (V)')
axis(assen)

%%
clear, clc
data_eerste
figure('name','eerste')
assen = [0 40 0 0.35]
subplot(1,2,1)
plot(t_in_1,v_in_1,'b.--')
title('Ingestuurd voltage')
xlabel('tijd')
ylabel('Voltage (V)')
axis(assen)
subplot(1,2,2)
plot(t_gem_1,v_gem_1,'b.--')
title('Gemeten voltage')
xlabel('tijd')
ylabel('Voltage (V)')
axis(assen)

%%
clear, clc
data_tweede
figure('name','tweede')
assen = [0 40 0 0.3]
subplot(1,2,1)
plot(t_in_4,v_in_4,'b.--')
title('Ingestuurd voltage')
xlabel('tijd')
ylabel('Voltage (V)')
axis(assen)
subplot(1,2,2)
plot(t_gem_4,v_gem_4,'b.--')
title('Gemeten voltage')
xlabel('tijd')
ylabel('Voltage (V)')
axis(assen)