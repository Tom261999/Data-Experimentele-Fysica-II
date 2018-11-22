function [V_L, V_U] = voltages(type)
%De mogelijke argumenten horende bij de respectievelijke datasets zijn
%'globaal', 'eerste' en 'tweede'. De functie zal daarbij [V_L, V_U]
%teruggegeven, wat respectievelijk de lower en upper bounds waren van de
%aangelegde potentialen.

if strcmp(type,'globaal')
    V_L = 6.1;
    V_U = 60.0;
elseif strcmp(type,'eerste')
    V_L = 8.8;
    V_U = 31.1;
elseif strcmp(type,'tweede')
    V_L = 37.6;
    V_U = 45.3;
else
    error('Fout input argument, typ "help voltages" voor meer info.')
end
disp('De voltages zijn gegeven in Volt, de nauwkeurigheid is gegeven door 0.1V')
end