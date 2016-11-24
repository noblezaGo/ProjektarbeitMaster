% Bestimmung der Übertragungsfunktion Gs der Strecke
function[Gs] = transferFcnControlledSystem(konstanteK,zeitkonstantenT,totzeitTt)

s = tf('s');


% NaN ersetzen durch 0
% Wenn die Strecke z.B. nur eine Zeitkonstante enthält, ist zeitkonstantenT(2) und zeitkonstantenT(3) = NaN 
zeitkonstantenT(isnan(zeitkonstantenT)) = 0;

T1 = zeitkonstantenT(1);
T2 = zeitkonstantenT(2);
T3 = zeitkonstantenT(3);

Gs = konstanteK/((1+T1*s)*(1+T2*s)*(1+T3*s)) * exp(-s*totzeitTt);

end