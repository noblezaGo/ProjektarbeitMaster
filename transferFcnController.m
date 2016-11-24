% Bestimmung der Übertragungsfunktion des Reglers
function[Gr] = transferFcnController(Kr,Tn,Tv)

s = tf('s');

T1 = 1; % Zeitkonstante des Tiefpasses im D-Anteil

% P-Anteil des Reglers
pAnteil = Kr;   

% I-Anteil des Reglers
if(Tn==0)               % Bei Wahl des P-Reglers ist Tn==0. Mit if-Abfrage Fehler abfangen, der bei Tn==0 ausgelöst wird.   
    iAnteil = 0;        % iAnteil muss 0 gesetzt werden, da Tn im Nenner steht
else
    iAnteil = Kr/(Tn*s); 
end

% D-Anteil des Reglers
dAnteil = Kr*Tv*s/(1+T1*s);

% Übertragungsfunktion Regler, Standardform
Gr = pAnteil + iAnteil + dAnteil;
end