function  [x_avg,sx_avg] = gemiddelde(x,sx)
x_avg = sum(x)/length(x);
sx_avg = sqrt(sum((x-(x_avg*ones(1,length(x)))).^2)/(length(x)*(length(x)-1)));
end

