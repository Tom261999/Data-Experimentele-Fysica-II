function [k,sk] = LinRegf(X,Y)
sizex=size(X);
sizey=size(Y);
s=sizex(1)*sizex(2);
a=0;
b=0;
c=0;
    if isequal(sizex,sizey) == 0
        error('Vectoren X en Y hebben niet hetzelfde aantal elementen.')
    else
        for i=1:s
            a=a+X(i)*Y(i);
            b=b+X(i)*X(i);
            c=c+Y(i)*Y(i);
        end
        k = a/b;
        sk = sqrt((1/s)*(c/b-k^2));
    end
    x = [min(X),max(X)];
    y = k*x;
    ymax = (k+sk)*x;
    ymin = (k-sk)*x;
    plot(x,y,'b--'); hold on
    plot(x,ymin,'r--'), plot(x,ymax,'r-.')
end

