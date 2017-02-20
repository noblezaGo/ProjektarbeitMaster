% Verfahren nach Reinisch
% geeignet f�r PTn und ITn-Strecken mit oder ohne Totzeit
% nach Buch Reinisch S.281 Tafel 7.7

% PI-Regler nach Reinisch muss umgerechnet werden: Kr = Kir*Tn; Td=Tn
% PID-Regler nach Reinisch ist in multiklikativer Form angegeben, muss
% umgerechnet werden
function[Kr,Tn,Tv] = Reinisch(Ks,zeitkonstantenT,totzeitTt,streckentyp,ueberschwingweite,selectedController)

anzT = numel(zeitkonstantenT);

% Sortierung der Zeitkonstanten nach absteigender Gr��e
zeitkonstantenTSort = sort(zeitkonstantenT,'descent');

% Regelstrecke wird in Programm in der Form K/prod(1+Ti*s), i=1..n eingegeben
% F�r Reinisch Verfahren wird die Strecke in der Form
% K/(1+T1*s+T2*s^2+...Tn*s^n) angegeben

% Umrechnung Zeitkonstanten aufgrund Unterschied in der Regelstreckenform:
% kann mit Koeffizientenvergleich bestimmt werden

if(anzT==2)
    % A1 = T1+T2
    A1 = sum(zeitkonstantenT);
    % A2 = T1*T2
    A2 = prod(zeitkonstantenT);
               
elseif(anzT==3)
    % A1 = T1+T2+T3
    A1 = sum(zeitkonstantenT);
    % A2 = T1*T2 + T1*T3 + T2*T3
    A2 = zeitkonstantenT(1)*zeitkonstantenT(2)+zeitkonstantenT(1)*zeitkonstantenT(3)+zeitkonstantenT(2)*zeitkonstantenT(3);
else
            % Throw Error
end

C1 = A1 + totzeitTt;
C2 = A2+totzeitTt*A1+(totzeitTt^2)/2;

% zeitkonstantenTSort(1) ist gr��te Zeitkonstante der Strecke 
C1Strich = C1-zeitkonstantenTSort(1);
C2Strich = C2-zeitkonstantenTSort(1)*C1Strich;

C1ZweiStrich = C1-zeitkonstantenTSort(1)-zeitkonstantenTSort(2);
C2ZweiStrich = C2-zeitkonstantenTSort(1)*C1Strich-zeitkonstantenTSort(2)*C1ZweiStrich;

% Vorgabe der Parameter a und c f�r die gew�nschte �berschungweite der
% Sprungantwort
switch ueberschwungweite
    case 0
        a = 4;
        c = 0;
    case 5
        a = 1.9;
        c = 0;
    case 10
        a = 1.4;
        c = 1;
    case 15
        a = 1;
        c = 1;
    case 20
        a = 0.83;
        c = 1.4;
    case 30
        a = 0.51;
        c = 1.4;
    case 40
        a = 0.31;
        c = 1.4;
    case 50
        a = 0.18;
        c = 1.4;
    case 60
        a = 0.11;
        c = 1.4;
    otherwise
        % throw error
    
end

% Reinisch Verfahren ist geeignet f�r PTn und ITn Strecken 
switch streckentyp
    case 'PTn-Strecke'
        
        switch selectedController
            case 'P-Regler'
                gamma = C2Strich/C1Strich^2;
                
                ak = a+c*gamma;
        
                % Beschr�nkungen pr�fen
                % Kreisverst�rkung V0 darf nicht gr��er als 10 sein
                V0 = zeitkonstantenTSort(1)/(ak*C1Strich);
                if(V0>10)
                    % Throw Error: Verfahren nicht anwendbar f�r ausgew�hlten
                    % Regler
                end

                    % Reglerparameter zuweisen
                    Kr = zeitkonstantenTSort(1)/(Ks*ak*C1Strich);
        
            case 'I-Regler'
                gamma = C2/C1^2;
                
                ak = a+c*gamma;
                
                % keine Beschr�nkungen
                
                Kir = 1/(Ks*ak*C1);
                % I-Regler nach Reinisch: Kir/s
                % I-Regler hier: Kr/s -> Kir = Kr
                Kr = Kir;

            case 'PI-Regler'
                gamma = C2Strich/C1Strich^2;
                
                ak = a+c*gamma;
                
                % keine Beschr�nkungen
                
                Kir = 1/Ks*ak*C1Strich;
                Td = zeitkonstantenTSort(1);
                
                % Umwandlung in PI-Regler Form G=Kr*(1+1/Tn*s)
                Kr = Kir*Td;
                Tn = Td;              
                
               
            case 'PD-Regler'
                gamma = C2ZweiStrich/C1ZweiStrich^2;
                
                ak = a+c*gamma;

                 % Beschr�nkungen pr�fen
                % Kreisverst�rkung V0 darf nicht gr��er als 10 sein
                V0 = zeitkonstantenTSort(1)/(ak*C1ZweiStrich);
                if(V0>10)
                    % Throw Error: Verfahren nicht anwendbar f�r ausgew�hlten
                    % Regler
                end
                
                Kr = zeitkonstantenTSort(1)/(Ks*ak*C1ZweiStrich);
                Td = zeitkonstantenTSort(2);
                
                % Td bei Reinisch entspricht hier Tv
                Tv = Td;
                
            case 'PID-Regler'
                
                gamma = C2ZweiStrich/C1ZweiStrich^2;
                
                ak = a+c*gamma;
                
                % keine Beschr�nkung
                
                % PID-Regler in multiplikativer Form
                Kir = 1/(Ks*ak*C1ZweiStrich);
                Tda = zeitkonstantenTSort(1);
                Tdb = zeitkonstantenTSort(2);
                
                % Umrechnung in PID-Regler additive Form
                Kr = Kir;
                Tn = Tda+Tdb;
                Tv = Tda*Tdb/(Tda+Tdb);
                
                

            otherwise % Throw Error
    
    
        end
        
        
        
        
    case 'ITn-Strecke'
        
        switch selectedController
            case 'P-Regler'
                gamma = C2/C1^2;  
                
                ak = a+c*gamma;
                
                % keine Beschr�nkung
                
                Kr = 1/(Ks*ak*C1);         

            case 'PD-Regler'

                gamma = C2Strich/C1Strich^2;
                
                ak = a+c*gamma;
                
                % keine Beschr�nkung
                
                Kr = 1/(Ks*ak*C1Strich);
                Td = zeitkonstantenTSort(1);
                Tv = Td;
                
            otherwise % Throw Error
    
    
        end
        
    otherwise % Throw Error
        
end



