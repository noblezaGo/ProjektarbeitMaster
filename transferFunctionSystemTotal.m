% Funktion gibt Übertragungsfunktion Gtotal des Reglers zurück
function[Gtotal] = transferFunctionSystemTotal(konstanteK,zeitkonstanteT1,zeitkonstanteT2,Kr,Tn,Tv,TransportDelay)
s = tf('s');

%% Übertragungsfunktion der Strecke
Gs = konstanteK/((zeitkonstanteT1*s+1)*(zeitkonstanteT2*s+1)) * exp(-s*TransportDelay);
% TO DO: Iparam nicht verwenden sonder Tv -> Änderung in
% gui_Projektarbeit.m

%% Übertragungsfunktion des Reglers
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

% Übertragungsfunktion Regler, additive Form
Gr = pAnteil + iAnteil + dAnteil;

%% Übertragungsfunktion Gesamtsystem
Gtotal = Gs*Gr/(1+Gs*Gr);
end

