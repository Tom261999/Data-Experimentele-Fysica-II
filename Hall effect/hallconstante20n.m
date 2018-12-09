n_plaatje20

magneetveld
Ib
UH
Idaal
Bdaal

Ib(find((Ib<=max(Idaal)) & (Ib>=min(Idaal))));

Uh=UH(1:30)
 [Bb1,sBb1]=interpolatie2(Idaal,sIdaal,Bdaal,sBdaal,Ib,sIb)
 R=0.0001*Uh./(Bb1*0.020)

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

disp('gemiddelde:')
gemiddelde(R)
disp('seems alright to me, voor ongedopeerd germanium is R_H = 0.012 m^3/C --Tom')
error('Nog fout op gemiddelde R waarde berekenen!')

