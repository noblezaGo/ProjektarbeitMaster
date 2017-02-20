% Bestimmung der Übertragungsfunktion des Reglers
% Funktion erstellt einen Regler aus den Parametern Kr,Tn,Tv
% Kr: Reglerverstärkung
% Tn: Nachstellsteit
% Tv: Vorhaltezeit

% Für P-Regler: Tn,Tv == 0 an Funktion übergeben
% Für PI-Regler: Tv == 0 an Funktion übergeben
% Für PD-Regler: Tn == 0 an Funktion übergeben

function[Gr] = transferFcnController(Kr,Tn,Tv)

s = tf('s');

% TO DO: idealer oder realer PID?
T1 = 0.1; % Zeitkonstante des Tiefpasses im D-Anteil

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