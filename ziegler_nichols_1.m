% Ziegler-Nichols 1. Variante
% geeignet f�r PT2-Strecken und h�her
% es wird untersucht bei welcher Reglerverst�rkung KrKrit das System
% Dauerschwingungen mit der Frequenz omegaKrit ausf�hrt

% Der Funktion m�ssen Streckenparameter �bergeben werden
% Ks: Verst�rkung K der Strecke

% zeitkonstantenT: Array, das die Streckenzeitkonstanten beinhaltet

% totzeitTt: Totzeit der Strecke

% selectedController: Definiert den Regler, der verwendet werden soll.
% Parameter muss vom Typ String sein. Zul�ssige Parameterwerte:
% 'P-Regler', 'PI-Regler' oder 'PID-Regler'

function[Kr,Tn,Tv] = ziegler_nichols_1(Ks,zeitkonstantenT,totzeitTt,selectedController)

s = tf('s');

anzT = numel(zeitkonstantenT);

% Strecken�bertragungsfunktion Gs erstellen
switch anzT
    % PT2-Strecke
    case 2
        Gs = Ks/((1+zeitkonstantenT(1)*s)*(1+zeitkonstantenT(2)*s)) * exp(-totzeitTt*s);
        
    % PT3-Strecke
    case 3
        Gs = Ks/((1+zeitkonstantenT(1)*s)*(1+zeitkonstantenT(2)*s)*(1+zeitkonstantenT(3)*s)) * exp(-totzeitTt*s);
        
    otherwise 
         % Errorhandling
        errordlg('Error in Function "ziegler_nichols_1". Function cannot handle amount of given time constants');
        return
end

% margin gibt die kritische Frequenz, bei der das System eine Phasendrehung von
% -180Grad hat (omegaAmpR). -> omegaKrit = omegaAmpR 
% Bei dieser Frequenz wird die Amplitudenreserve
% ermittelt(AmpR). Die Amplitudenreserve ist der Abstand des
% Amplitudengangs bei der krit. Frequenz von 0 dB. Wenn das System um den
% Betrag der Amplitudenreserve verst�rkt wird, f�hrt das System unged�mpfte
% Schwingungen aus -> Kkrit = AmpR
if(exist('Gs','var'))    
    [AmpR, PhaseR, omegaAmpR, omegaDurchtritt] = margin(Gs);
else 
     % Errorhandling
        errordlg('Error in Function "ziegler_nichols_1". Variable Gs does not exist');
        return
end
        
omegaKrit = omegaAmpR;  % Kritische Frequenz, bei der Dauerschwingungen ausgef�hrt werden, wenn das System mit Kkrit verst�rkt wird
Kkrit = AmpR;   % Kritische Verst�rkung, bei der das System Dauerschwingungen mit der Frequenz omegaKrit ausf�hrt
Tkrit = 2*pi/omegaKrit; % Einstellregeln aus Tabelle richten sich nach Tkrit

% Einstellregeln
switch selectedController
    case 'P-Regler'
        Kr = 0.5*Kkrit;
        Tn = 0;
        Tv = 0;
        
    case 'PI-Regler'
        Kr = 0.45*Kkrit;
        Tn = 0.85*Tkrit;
        Tv = 0;
        
    case 'PID-Regler'
        Kr = 0.6*Kkrit;
        Tn = 0.5*Tkrit;
        Tv = 0.125*Tkrit;
        
    otherwise
        % Errorhandling
        errordlg('Error in Function "ziegler_nichols_1". Content of parameter "selectedController" is not allowed.');  
        return


end