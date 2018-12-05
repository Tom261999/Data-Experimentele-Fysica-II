function [avgx,savgx] = GewogenGemf(X,sX)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
sizex=size(X);
s=sizex(1)*sizex(2);
a=0;
b=0;

for i=1:s
    a=a+(X(i)/(sX(i)+eps)^2);
    b=b+(1/(sX(i)+eps)^2); %+eps toegevoegd omwille van underflow voor atoommodel van bohr
end
avgx=a/b;
savgx=sqrt(1/b);
end

