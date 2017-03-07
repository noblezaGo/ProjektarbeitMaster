% Reglereinstellung nach T-Summenregel von Kuhn, normale Einstellung

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
% 'P-Regler', 'PI-Regler','PD-Regler' oder 'PID-Regler'

function[Kr,Tn,Tv] = Kuhn_normal(Ks,zeitkonstantenT,totzeitTt,selectedController)


% zeitkonstantenT(isnan(zeitkonstantenT)) = 0;
% 
% T1 = zeitkonstantenT(1);
% T2 = zeitkonstantenT(2);
% T3 = zeitkonstantenT(3);

% Summenzeitkonstante bilden
TSum = sum(zeitkonstantenT)+totzeitTt;

% % selectedController enth�lt den �ber das Popup-Men� ausgew�hlten Regler
switch selectedController
    case 'P-Regler'
        Kr = 1/Ks;
        Tn = 0;
        Tv = 0;
    
    case 'PI-Regler'
        Kr = 0.5/Ks;
        Tn = 0.5 * TSum;
        Tv = 0;
        
    case 'PID-Regler'
        Kr = 1/Ks;
        Tn = 0.667 * TSum;
        Tv = 0.167 * TSum;
        
    case 'PD-Regler'
        Kr = 1/Ks;
        Tn = 0;
        Tv = 0.33 * TSum;
        
    otherwise 
        % Errorhandling
        errordlg('Error in Function "Kuhn_normal". Content of parameter "selectedController" is not allowed.'); 
        return
end

end