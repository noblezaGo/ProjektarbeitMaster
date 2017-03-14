% Reglereinstellung nach T-Summenregel von Kuhn, schnelle Einstellung

% Funktion gibt Reglerparameter Kr,Tn,Tv für PID-Regler zurück
% Kr: Reglerverstärkung
% Tn: Nachstellzeit
% Tv: Vorhaltezeit

% Der Funktion müssen Streckenparameter übergeben werden

% Ks: Verstärkung K der Strecke

% zeitkonstantenT: Array, das die Streckenzeitkonstanten beinhaltet

% totzeitTt: Totzeit der Strecke

% selectedController: Definiert den Regler, der verwendet werden soll.
% Parameter muss vom Typ String sein. Zulässige Parameterwerte:
% 'PI-Regler' oder 'PID-Regler'

function[Kr,Tn,Tv] = Kuhn_schnell(Ks,zeitkonstantenT,totzeitTt,selectedController)

% Summenzeitkonstante bilden
TSum = sum(zeitkonstantenT)+totzeitTt;

% selectedController enthält den über das Popup-Menü ausgewählten Regler
switch selectedController    
    % Einstellungen nach Taschenbuch Regelungstechnik
    case 'PI-Regler'
        Kr = 1/Ks;
        Tn = 0.7 * TSum;
        Tv = 0;
        
    case 'PID-Regler'
        Kr = 2/Ks;
        Tn = 0.8 * TSum;
        Tv = 0.194 * TSum;
        
    otherwise 
        % Errorhandling
        errordlg('Error in Function "Kuhn_schnell". Content of parameter "selectedController" is not allowed.');  
        return
end

end