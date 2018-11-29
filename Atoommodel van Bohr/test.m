[t_in,v_in] = importdatabohr('globaal\ingestuurde potentiaal\set 1.txt');
[t_gem,v_gem] = importdatabohr('globaal\gemeten potentiaal\set 1.txt');

plot(t_in,v_in)
hold on
plot(t_gem,v_gem)
hold off
legend('ingestuurd','gemeten','location','northwest')
