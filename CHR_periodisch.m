% Reglereinstellung nach CHR-Verfahren f�r gutes F�hrungsverhalten und periodischem Regelverlauf
% mit 20% �berschwingen

% Funktion gibt Reglerparameter Kr,Tn,Tv f�r PID-Regler zur�ck
% Kr: Reglerverst�rkung
% Tn: Nachstellzeit
% Tv: Vorhaltezeit

% Der Funktion m�ssen Streckenparameter �bergeben werden:

% Ks: Verst�rkung K der Strecke

% Ta: Anstiegszeit. Zur Bestimmung von Ta Wendetangente an S-f�rmige Sprungantwort
% anlegen. Zeit vom Schnittpunkt der Wendetangente mit der x-Achse bis Erreichen der
% Wendetangente des Wertes Ks definiert Ta.

% Tu: Verzugszeit. Zur Bestimmung von Tu Wendetangente an S-f�rmige Sprungantwort
% anlegen. Zeit von t=0 bis Schnittpunkt der Wendetangente mit der x-Achse
% definiert Tu.

% selectedController: Definiert den Regler, der verwendet werden soll.
% Parameter muss vom Typ String sein. Zul�ssige Parameterwerte:
% 'P-Regler', 'PI-Regler' oder 'PID-Regler'

function[Kr,Tn,Tv] = CHR_periodisch(Ks,Ta,Tu,selectedController)
% selectedController enth�lt den �ber das Popup-Men� ausgew�hlten Regler
switch selectedController
    case 'P-Regler'
        % P-Regler
        Kr = 0.7*Ta/(Ks*Tu);
        Tn = 0;
        Tv = 0;
        disp('Chosen Controller: P');
    case 'PI-Regler'
        % PI-Regler
        Kr = (0.6*Ta)/(Ks*Tu);
        Tn = Ta;
        Tv = 0;
        disp('Chosen Controller: PI');
    case 'PID-Regler'
        % PID-Regler
        Kr = (0.95*Ta)/(Ks*Tu);
        Tn = 1.35*Ta;
        Tv = 0.47*Tu;        
        disp('Chosen Controller: PID');
        
    otherwise 
        % Errorhandling
        errordlg('Error in Function "CHR_periodisch". Content of parameter "selectedController" is not allowed.');  
end