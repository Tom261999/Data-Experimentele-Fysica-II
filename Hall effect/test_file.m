n_plaatje20

magneetveld
Ib
UH
Idaal
Bdaal

[Bb1,sBb1]=interpolatie(Idaal,sIdaal,Bdaal,sBdaal,Ib,sIb)

R=0.001*UH./(Bb1*0.020);

deletevalue = [3 4];

for i = length(deletevalue):-1:1
    R(deletevalue(i)) = [];
    Bb1(deletevalue(i)) = [];
end


UH
R
Bb1

figure(2)
plot(Bb1,R,'k.')
