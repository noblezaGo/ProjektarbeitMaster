% Bestimmung der �bertragungsfunktion des Reglers
% Funktion erstellt einen Regler aus den Parametern Kr,Tn,Tv
% Kr: Reglerverst�rkung
% Tn: Nachstellsteit
% Tv: Vorhaltezeit

% F�r P-Regler: Tn,Tv == 0 an Funktion �bergeben
% F�r PI-Regler: Tv == 0 an Funktion �bergeben
% F�r PD-Regler: Tn == 0 an Funktion �bergeben

function[Gr] = transferFcnController(Kr,Tn,Tv)

s = tf('s');

% TO DO: idealer oder realer PID?
T1 = 0.1; % Zeitkonstante des Tiefpasses im D-Anteil

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

% �bertragungsfunktion Regler, Standardform
Gr = pAnteil + iAnteil + dAnteil;
end