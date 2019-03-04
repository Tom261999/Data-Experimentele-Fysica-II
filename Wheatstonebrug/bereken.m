function [X,sX] = bereken(K,M,L,sK,sM,sL)
% Functie berekent (voor scalairen!) X mbv input (K,M,L,sK,sM,sL)

% Formule
X = K.*M./L;

% Foutenpropagatie
pK = M./L;
pM = K./L;
pL = -M*K./L.^2;

sX = sqrt( (sK.*pK).^2 + (sM.*pM).^2 + (sL.*pL).^2);

end