% Reglereinstellung nach T-Summenregel von Kuhn, schnelle Einstellung

% Funktion gibt Reglerparameter Kr,Tn,Tv f�r PID-Regler zur�ck
% Kr: Reglerverst�rkung
% Tn: Nachstellzeit
% Tv: Vorhaltezeit

% Der Funktion m�ssen Streckenparameter �bergeben werden
% Ks: Verst�rkung K der Strecke
% zeitkonstantenT: Array, das die Streckenzeitkonstanten beinhaltet
% totzeitTt: Totzeit der Strecke
% selectedController: Definiert den Regler, der verwendet werden soll.
% Parameter muss vom Typ String sein. Zul�ssige Parameterwerte:
% 'PI-Regler' oder 'PID-Regler'

function[Kr,Tn,Tv] = Kuhn_schnell(Ks,zeitkonstantenT,totzeitTt,selectedController)


% zeitkonstantenT(isnan(zeitkonstantenT)) = 0;
% 
% T1 = zeitkonstantenT(1);
% T2 = zeitkonstantenT(2);
% T3 = zeitkonstantenT(3);
% Summenzeitkonstante bilden
TSum = sum(zeitkonstantenT)+totzeitTt;

% % selectedController enth�lt den �ber das Popup-Men� ausgew�hlten Regler
switch selectedController
    % TO DO P-Regler Throw Error
    % Einstellungen nach Taschenbuch Regelungstechnik
    case 'PI-Regler'
        Kr = 1/Ks;
        Tn = 0.7 * TSum;
        Tv = 0;
        
    case 'PID-Regler'
        Kr = 2/Ks;
        Tn = 0.8 * TSum;
        Tv = 0.194 * TSum;
        
    otherwise % throw error
end

end