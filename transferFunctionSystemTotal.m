% Funktion gibt �bertragungsfunktion Gtotal des Reglers zur�ck
function[Gtotal] = transferFunctionSystemTotal(konstanteK,zeitkonstanteT1,zeitkonstanteT2,Kr,Tn,Tv,TransportDelay)
s = tf('s');

%% �bertragungsfunktion der Strecke
Gs = konstanteK/((zeitkonstanteT1*s+1)*(zeitkonstanteT2*s+1)) * exp(-s*TransportDelay);
% TO DO: Iparam nicht verwenden sonder Tv -> �nderung in
% gui_Projektarbeit.m

%% �bertragungsfunktion des Reglers
T1 = 1; % Zeitkonstante des Tiefpasses im D-Anteil

% P-Anteil des Reglers
pAnteil = Kr;   

% I-Anteil des Reglers
if(Tn==0)               % Bei Wahl des P-Reglers ist Tn==0. Mit if-Abfrage Fehler abfangen, der bei Tn==0 ausgel�st wird.   
    iAnteil = 0;        % iAnteil muss 0 gesetzt werden, da Tn im Nenner steht
else
    iAnteil = Kr/(Tn*s); 
end

% D-Anteil des Reglers
dAnteil = Kr*Tv*s/(1+T1*s);

% �bertragungsfunktion Regler, additive Form
Gr = pAnteil + iAnteil + dAnteil;

%% �bertragungsfunktion Gesamtsystem
Gtotal = Gs*Gr/(1+Gs*Gr);
end

