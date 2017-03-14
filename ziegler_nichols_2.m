% Reglereinstellung nach Ziegler-Nichols-Verfahren 2. Möglichkeit

% Funktion gibt Reglerparameter Kr,Tn,Tv zurück
% Kr: Reglerverstärkung
% Tn: Nachstellzeit
% Tv: Vorhaltezeit

% Der Funktion müssen Streckenparameter übergeben werden:

% Ks: Verstärkung K der Strecke

% Ta: Anstiegszeit. Zur Bestimmung von Ta Wendetangente an S-förmige Sprungantwort
% anlegen. Zeit vom Schnittpunkt der Wendetangente mit der x-Achse bis Erreichen der
% Wendetangente des Wertes Ks definiert Ta.

% Tu: Verzugszeit. Zur Bestimmung von Tu Wendetangente an S-förmige Sprungantwort
% anlegen. Zeit von t=0 bis Schnittpunkt der Wendetangente mit der x-Achse
% definiert Tu.

% selectedController: Definiert den Regler, der verwendet werden soll.
% Parameter muss vom Typ String sein. Zulässige Parameterwerte:
% 'P-Regler', 'PI-Regler' oder 'PID-Regler'

function[Kr,Tn,Tv] = ziegler_nichols_2(Ks,Ta,Tu,selectedController)
% selectedController enthält den über das Popup-Menü ausgewählten Regler
switch selectedController
    case 'P-Regler'        
        Kr = Ta/(Ks*Tu);
        Tn = 0;
        Tv = 0;
        
    case 'PI-Regler'        
        Kr = (0.9*Ta)/(Ks*Tu);
        Tn = 3.33*Tu;
        Tv = 0;
        
    case 'PID-Regler'        
        Kr = (1.2*Ta)/(Ks*Tu);
        Tn = 2*Tu;
        Tv = 0.5*Tu;        
       
        
    otherwise
        % Errorhandling
        errordlg('Error in Function "ziegler_nichols_2". Content of parameter "selectedController" is not allowed.');  
        return
end