function [a,sa,b,sb] = LinRegWillOf(X,Y,sY)
sizex=size(X);
sizey=size(Y);
s=sizex(1)*sizex(2);
xy=0;
xx=0;
yy=0;
yax=0;
yaxb=0;

for i=1:s
    xy=xy+X(i)*Y(i);
    xx=xx+X(i)*X(i);
    yy=yy+Y(i)*Y(i);
end

a=(s*xy-sum(X)*sum(Y))/(s*xx-(sum(X))^2);

for i=1:s
    yax=yax+(Y(i)-a*X(i));
end

b=yax/s;

for i=1:s
    yaxb=yaxb+(Y(i)-a*X(i)-b)^2;
end

sa=sqrt((yaxb)/((s-2)*(xx-((sum(X))^2)/s)));
sb=sa*sqrt(xx/s);

% x = [min(X)-10,max(X)+10];
%     y = a*x+b;
%     ymax = (a+sa)*x+b+sb;
%     ymin = (a-sa)*x+b-sb;
%     plot(x,y,'b--'); hold on
%     plot(x,ymin,'r--'), plot(x,ymax,'r-.')
%     errorbar(X,Y,sY,'k.')

a
sa
b
sb


end

