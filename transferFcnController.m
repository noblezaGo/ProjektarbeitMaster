% Bestimmung der Übertragungsfunktion des Reglers
% Funktion erstellt einen Regler aus den Parametern Kr,Tn,Tv
% Kr: Reglerverstärkung
% Tn: Nachstellsteit
% Tv: Vorhaltezeit
% typeOfController:
% 'P-Regler','PI-Regler','I-Regler','PD-Regler','PID-Regler'

% Für P-Regler: Tn,Tv == 0 an Funktion übergeben
% Für PI-Regler: Tv == 0 an Funktion übergeben
% Für PD-Regler: Tn == 0 an Funktion übergeben
% Für I-Regler: Tv == 0 übergeben

function[Gr] = transferFcnController(Kr,Tn,Tv,typeOfController)

s = tf('s');


switch typeOfController
    case 'P-Regler'
        Gr = Kr;
        
    case 'PI-Regler'
        if(Tn>0)
            Gr = Kr*(1 + 1/(Tn*s));
        end
        
    case 'PID-Regler'
        if(Tn>0)
            % TO DO: idealer oder realer PID?
            T1 = 0.1; % Zeitkonstante des Tiefpasses im D-Anteil
            Gr = Kr*(1 + 1/(Tn*s) + Tv*s/(1+T1*s));
        end
        
    case 'PD-Regler'
        T1 = 0.1; % Zeitkonstante des Tiefpasses im D-Anteil
        Gr = Kr*(1 + Tv*s/(1+T1*s));
        
    case 'I-Regler'
        Gr = Kr/(Tn*s);
        
    otherwise
        errordlg('Error in Function transferFcnController');
end

if(exist('Gr','var')==0)
    errordlg('Error in Function transferFcnController. Failed to calculate controller.');
end

% % P-Anteil des Reglers
% pAnteil = Kr;   
% 
% % I-Anteil des Reglers
% if(Tn==0)               % Bei Wahl des P-Reglers ist Tn==0. Mit if-Abfrage Fehler abfangen, der bei Tn==0 ausgelöst wird.   
%     iAnteil = 0;        % iAnteil muss 0 gesetzt werden, da Tn im Nenner steht
% else
%     iAnteil = Kr/(Tn*s); 
% end
% 
% % D-Anteil des Reglers
% dAnteil = Kr*Tv*s/(1+T1*s);
% 
% % Übertragungsfunktion Regler, Standardform
% Gr = pAnteil + iAnteil + dAnteil;
end