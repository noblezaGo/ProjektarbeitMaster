% Verfahren nach Reinisch
% geeignet für PTn und ITn-Strecken mit oder ohne Totzeit
% nach Buch Reinisch S.281 Tafel 7.7

% PI-Regler nach Reinisch muss umgerechnet werden: Kr = Kir*Tn; Td=Tn
% PID-Regler nach Reinisch ist in multiklikativer Form angegeben, muss
% umgerechnet werden

% Der Funktion müssen Streckenparameter übergeben werden
% Ks: Verstärkung K der Strecke

% zeitkonstantenT: Array, das die Streckenzeitkonstanten beinhaltet

% totzeitTt: Totzeit der Strecke

% streckentyp: String der den Streckentyp beinhaltet. Funktion hat 2 Streckentypen
% implementiert. 
% Streckentypen: 'PTn-Strecke','ITn-Strecke'

% ueberschwingweite: String mit der gewünschten Überschwingweite:
% '0%','5%','10%','15%','20%','30%','40%','50%','60%'

% selectedController: Definiert den Regler, der verwendet werden soll.
% Parameter muss vom Typ String sein. Zulässige Parameterwerte:
% 'P-Regler', 'PI-Regler','PD-Regler oder 'PID-Regler' für PTn-Strecken
% 'P-Regler' oder 'PD-Regler' für ITn-Strecken
function[Kr,Tn,Tv] = Reinisch(Ks,zeitkonstantenT,totzeitTt,streckentyp,ueberschwingweite,selectedController)

% Kr, Tn, Tv initialisieren mit 0
Kr = 0;
Tn = 0;
Tv = 0;

anzT = numel(zeitkonstantenT);

% Sortierung der Zeitkonstanten nach absteigender Größe
zeitkonstantenTSort = sort(zeitkonstantenT,'descend');

% Regelstrecke wird in Programm in der Form K/prod(1+Ti*s), i=1..n eingegeben
% Für Reinisch Verfahren wird die Strecke in der Form
% K/(1+T1*s+T2*s^2+...Tn*s^n) angegeben

% Umrechnung Zeitkonstanten aufgrund Unterschied in der Regelstreckenform:
% kann mit Koeffizientenvergleich bestimmt werden

    if(anzT==1)
        A1 = zeitkonstantenT(1);
        A2 = 0;

    elseif(anzT==2)
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
        errordlg('Error in function "Reinisch". Unknown value of Parameter "anzT".');
        return
    end

C1 = A1 + totzeitTt;
C2 = A2+totzeitTt*A1+(totzeitTt^2)/2;


    % Vorgabe der Parameter a und c für die gewünschte Überschungweite der
    % Sprungantwort
    switch ueberschwingweite
        case '0%'
            a = 4;
            c = 0;
        case '5%'
            a = 1.9;
            c = 0;
        case '10%'
            a = 1.4;
            c = 1;
        case '15%'
            a = 1;
            c = 1;
        case '20%'
            a = 0.83;
            c = 1.4;
        case '30%'
            a = 0.51;
            c = 1.4;
        case '40%'
            a = 0.31;
            c = 1.4;
        case '50%'
            a = 0.18;
            c = 1.4;
        case '60%'
            a = 0.11;
            c = 1.4;
        otherwise
            % throw error
            errordlg('Error in function "Reinisch". Parameter "ueberschwingweite" contains unknown value.');
            return

    end

% Reinisch Verfahren ist geeignet für PTn und ITn Strecken 
    switch streckentyp
        case 'PTn-Strecke'

            switch selectedController
                case 'P-Regler'

                    % zeitkonstantenTSort(1) ist größte Zeitkonstante der Strecke 
                    % zeitkonstantenTSort(2) ist zweitgrößte Zeitkonstante der Strecke 
                    C1Strich = C1-zeitkonstantenTSort(1);
                    C2Strich = C2-zeitkonstantenTSort(1)*C1Strich;

                    gamma = C2Strich/C1Strich^2;

                    ak = a+c*gamma;

                    % Beschränkungen prüfen
                    % Kreisverstärkung V0 darf nicht größer als 10 sein
                    V0 = zeitkonstantenTSort(1)/(ak*C1Strich);
                    if(V0<10)
                        % Throw Error: Verfahren nicht anwendbar für ausgewählten
                        % Regler
                        errordlg('Verfahren nicht anwendbar für ausgewählten Regler. Kreisverstärkung V0 ist zu klein. Dominante Zeitkonstante oder Überschwingweite vergrößern.','Error','modal');
                        return
                    end

                        % Reglerparameter zuweisen
                        Kr = zeitkonstantenTSort(1)/(Ks*ak*C1Strich);



                case 'I-Regler'                             

                    gamma = C2/C1^2;

                    ak = a+c*gamma;

                    % keine Beschränkungen

                   
                    % I-Regler nach Reinisch: G=Kir/s;  Kir = 1/(Ks*ak*C1);
                    % I-Regler in transferFcnController definiert: G=Kr/(Tn*s) 
                    % -> Kr = 1/Ks; Tn=ak*C1
                    Kr = 1/Ks;
                    Tn = ak*C1;

                case 'PI-Regler'
                    % zeitkonstantenTSort(1) ist größte Zeitkonstante der Strecke 
                    % zeitkonstantenTSort(2) ist zweitgrößte Zeitkonstante der Strecke 
                    C1Strich = C1-zeitkonstantenTSort(1);
                    C2Strich = C2-zeitkonstantenTSort(1)*C1Strich;

                    gamma = C2Strich/C1Strich^2;

                    ak = a+c*gamma;

                    % keine Beschränkungen

                    Kir = 1/(Ks*ak*C1Strich);
                    Td = zeitkonstantenTSort(1);

                    % Umwandlung in PI-Regler Form G=Kr*(1+1/Tn*s)
                    Kr = Kir*Td;
                    Tn = Td;              


                case 'PD-Regler'

                    % zeitkonstantenTSort(1) ist größte Zeitkonstante der Strecke 
                    % zeitkonstantenTSort(2) ist zweitgrößte Zeitkonstante der Strecke 
                    C1Strich = C1-zeitkonstantenTSort(1);                
                    C1ZweiStrich = C1-zeitkonstantenTSort(1)-zeitkonstantenTSort(2);
                    C2ZweiStrich = C2-zeitkonstantenTSort(1)*C1Strich-zeitkonstantenTSort(2)*C1ZweiStrich;

                    % Verfahren ist mit PD-Regler nur geeignet für
                    % PT2-Strecken oder höher
                    if(anzT==1)
                        errordlg('Verfahren ist mit ausgewähltem Regler nicht für PT1-Strecke geeignet.');
                        return
                    end

                    gamma = C2ZweiStrich/C1ZweiStrich^2;

                    ak = a+c*gamma;

                     % Beschränkungen prüfen
                    % Kreisverstärkung V0 darf nicht größer als 10 sein
                    V0 = zeitkonstantenTSort(1)/(ak*C1ZweiStrich);
                    if(V0<10)
                        % Throw Error: Verfahren nicht anwendbar für ausgewählten
                        % Regler
                        errordlg('Verfahren nicht anwendbar für ausgewählten Regler. Kreisverstärkung V0 ist zu klein. Dominante Zeitkonstante oder Überschwingweite vergrößern.','Error','modal');
                        return
                    end

                    Kr = zeitkonstantenTSort(1)/(Ks*ak*C1ZweiStrich);
                    Td = zeitkonstantenTSort(2);

                    % Td bei Reinisch entspricht hier Tv
                    Tv = Td;

                case 'PID-Regler'
                    % zeitkonstantenTSort(1) ist größte Zeitkonstante der Strecke 
                    % zeitkonstantenTSort(2) ist zweitgrößte Zeitkonstante der Strecke 
                    C1Strich = C1-zeitkonstantenTSort(1);               
                    C1ZweiStrich = C1-zeitkonstantenTSort(1)-zeitkonstantenTSort(2);
                    C2ZweiStrich = C2-zeitkonstantenTSort(1)*C1Strich-zeitkonstantenTSort(2)*C1ZweiStrich;

                    % Verfahren ist mit PID-Regler nur geeignet für
                    % PT2-Strecken oder höher
                    if(anzT==1)
                        errordlg('Verfahren ist mit ausgewähltem Regler nicht für PT1-Strecke geeignet');
                        return
                    end

                    gamma = C2ZweiStrich/C1ZweiStrich^2;

                    ak = a+c*gamma;

                    % keine Beschränkung

                    % PID-Regler in multiplikativer Form
                    Kir = 1/(Ks*ak*C1ZweiStrich);
                    Tda = zeitkonstantenTSort(1);
                    Tdb = zeitkonstantenTSort(2);

                    % Umrechnung in PID-Regler additive Form
                    Kr = Kir*(Tda+Tdb);
                    Tn = Tda+Tdb;
                    Tv = Tda*Tdb/(Tda+Tdb);



                otherwise % Throw Error
                    errordlg('Error in funtion "Reinisch". Unknown value of parameter "selectedController".');
                    return


            end




        case 'ITn-Strecke'

            switch selectedController
                case 'P-Regler'
                    gamma = C2/C1^2;  

                    ak = a+c*gamma;

                    % keine Beschränkung

                    Kr = 1/(Ks*ak*C1);         

                case 'PD-Regler'
                    % zeitkonstantenTSort(1) ist größte Zeitkonstante der Strecke 
                    % zeitkonstantenTSort(2) ist zweitgrößte Zeitkonstante der Strecke 
                    C1Strich = C1-zeitkonstantenTSort(1);
                    C2Strich = C2-zeitkonstantenTSort(1)*C1Strich;

                    gamma = C2Strich/C1Strich^2;

                    ak = a+c*gamma;

                    % keine Beschränkung

                    Kr = 1/(Ks*ak*C1Strich);
                    Td = zeitkonstantenTSort(1);
                    Tv = Td;

                otherwise % Throw Error
                    errordlg('Error in funtion "Reinisch". Unknown value of parameter "selectedController".');
                    return


            end

        otherwise % Throw Error
            errordlg('Error in funtion "Reinisch". Unknown value of parameter "streckentyp".');
            return

    end
end



