% Skogestad Verfahren
% Funktion gibt Reglerparameter Kr,Tn,Tv für PID-Regler bzw PI-Regler zurück. 
% Kr: Reglerverstärkung
% Tn: Nachstellzeit
% Tv: Vorhaltezeit 

% Der Funktion müssen Streckenparameter übergeben werden
% Ks: Verstärkung K der Strecke

% zeitkonstantenT: Array, das die Streckenzeitkonstanten beinhaltet

% totzeitTt: Totzeit der Strecke

% streckentyp: String der den Streckentyp beinhaltet. Funktion hat 2 Streckentypen
% implementiert. Streckentypen: 'PTn-Strecke','ITn-Strecke'

function[Kr,Tn,Tv]= Skogestad(Ks,zeitkonstantenT,totzeitTt,streckentyp)

% Tc von Skogestad wird gleich der Totzeit angenommen
Tc = totzeitTt;

% Reglereinstellungen werden in Abhängigkeit des Streckentyps vorgenommen
%% Bestimmung des Streckentyps


anzT = numel(zeitkonstantenT);

switch streckentyp
    case 'PTn-Strecke'
        if(totzeitTt~=0 && anzT==1)
            strecke = 'PT1MitTotzeit';           
        
        elseif(totzeitTt~=0 && anzT==2)
            strecke = 'PT2MitTotzeit';            
         end
           

    case 'ITn-Strecke'
        if(totzeitTt~=0 && anzT==0)
            strecke = 'IMitTotzeit';        
        
        elseif(totzeitTt~=0 && anzT==1)
            strecke = 'IT1MitTotzeit';       
        
        end
        
    otherwise 
        % Errorhandling
        errordlg('Error in Function "Skogestad". Content of parameter "streckentyp" cannot be handled by the function.');  
        return
end

% Errorhandling wenn übergebene Parameter nicht für Skogestad Methode
% geeignet sind
% Abfrage ob "Strecke" existert. Wenn nicht muss Fehler geworfen werden
if(exist('strecke','var')==0)
    % Errorhandling
        errordlg('Error in function "Skogestad". Parameters Kr,Tn,Tv cannot be calculated with Skogestad method for given input parameters. Skogestad method is not applicable for given controlled system.');  
        return
end

% Zeitkonstanten der Strecke in absteigender Größe nach sortieren
Tsort = sort(zeitkonstantenT,'descend');

% Reglerparameter nach Skogestad für seriellen PID bzw. PI-Regler
switch strecke
    case 'PT1MitTotzeit'
        % PI-Regler
        KcController = Tsort(1)/(Ks*(Tc+totzeitTt));
        T1Controller = min(Tsort(1),4*(Tc+totzeitTt));
        T2Controller = 0;
        
    case 'PT2MitTotzeit'
        % PID-Regler
        KcController = Tsort(1)/(Ks*(Tc+totzeitTt));
        T1Controller = min(Tsort(1),4*(Tc+totzeitTt));
        T2Controller = Tsort(2);
        
    case 'IMitTotzeit'
        % PI-Regler
        KcController = 1/(Ks*(Tc+totzeitTt));
        T1Controller = 4*(Tc+totzeitTt);
        T2Controller = 0;
        
    case 'IT1MitTotzeit'
        % PID-Regler
        KcController = 1/(Ks*(Tc+totzeitTt));
        T1Controller = 4*(Tc+totzeitTt);
        T2Controller = Tsort(1);
        
    otherwise 
        % Errorhandling
        errordlg('Error in Function "Skogestad". Content of parameter "streckentyp" cannot be handled by the function.');  
        return
        
end      
   

% Umrechnung von Regler in serieller Form zu Regler in additiver Form
% mit Koeffizientenvergleich ausgerechnet, Umrechnung gilt für PI- sowie
% für PID-Regler
Kr = KcController*(1+T2Controller/T1Controller);
Tn = T1Controller+T2Controller;
Tv = T1Controller*T2Controller/(T1Controller+T2Controller);

end