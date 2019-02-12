function [yinter,syinter] = interpolatie(xinit,sx,yinit,sy,xinter,sxinter)
% % %Wat is dit??
% % xmax=max(xinit);
% % xmax1= max(xinit(find(xinit<xmax)));
% % xmin=min(xinit);
% % xmin1= min(xinit(find(xinit>xmin)));
% % ymax=max(yinit);
% % ymax1= max(yinit(find(yinit<ymax)));
% % ymin=min(yinit);
% % ymin1= min(yinit(find(yinit>ymin)));

    for n=1:length(xinter)
        x1=max(xinit(find(xinit<=xinter(n)))); % grootste punt vinden dat kleiner is dan x3 (met x3 de waarde waarvoor we y willen bepalen) => x1
        x2=min(xinit(find(xinit>xinter(n)))); % kleinste punt dat groter is dan x3 => x2
        i1=find(xinit==x1) ; %index horende bij (x1,y1)
        i2=find(xinit==x2) ; %index horende bij (x2,y2)
        y1=yinit(i1); %y1 bepalen
        y2=yinit(i2); %y2 bepalen

        %interpolatie tussen twee punten met een rechte
        yinter(n)=y1+(y2-y1)/(x2-x1)*(xinter(n)-x1);

        %Fouten horende bij punten (x1,y1) & (x2,y2)
        sx1=sx(i1);
        sx2=sx(i2);
        sy1=sy(i1);
        sy2=sx(i2);

        %Partieel afgeleiden (?)
        dy1=1-1/(x2-x1)*(xinter(n)-x1).*sy1;
        dy2=1/(x2-x1)*(xinter(n)-x1).*sy2;
        dx1=((xinter(n)-x2)/(x2-x1)^2) *(y2-y1).*sx1;
        dx2=(-(y2-y1)/(x2-x1)^2)*(xinter(n)-x1).*sx2;
        dxinter=(y2-y1)/(x2-x1)*sxinter(n);

        %Foutenpropagatie
        syinter(n)=sqrt(dy1.^2+dy2.^2+dx1.^2+dx2.^2+dxinter.^2);
    end
end

