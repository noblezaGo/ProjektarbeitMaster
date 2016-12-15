% Bestimmung der Übertragungsfunktion Gs der Strecke
% konstanteK: Verstärkung K der Strecke
% zeitkonstantenT: Array mit den Zeitkonstanten der Strecke
% totzeitTt: Totzeit der Strecke
% typeofControlledSystem: String der den Streckentyp beinhaltet. Funktion hat 3 Streckentypen
% implementiert. 
% Streckentypen: 'PTn-Strecke','ITn-Strecke','DTn-Strecke'
function[Gs] = transferFcnControlledSystem(konstanteK,zeitkonstantenT,totzeitTt,typeOfControlledSystem)

s = tf('s');

TProd = 1; % Startwert muss 1 sein, da in Schleife für i=1(1.Schleifendurchgang) TProd definiert sein muss und mit der 1. Zeitkonstanten multipliziert wird
switch typeOfControlledSystem
    case 'PTn-Strecke'
        for i=1:numel(zeitkonstantenT)
            TProd = TProd * (1+zeitkonstantenT(i)*s); % Produkt aus (1+Ti*s)
        end      
        Gs = konstanteK/TProd * exp(-s*totzeitTt); % Übertragungsfunktion der PTn-Strecke
        
    case 'ITn-Strecke'
        for i=1:numel(zeitkonstantenT)
            TProd = TProd * (1+zeitkonstantenT(i)*s); % Produkt aus (1+Ti*s)
        end
        Gs = konstanteK/(s*TProd) * exp(-s*totzeitTt); % Übertragungsfunktion der ITn-Strecke
        
    case 'DTn-Strecke'
        for i=1:numel(zeitkonstantenT)
            TProd = TProd * (1+zeitkonstantenT(i)*s); % Produkt aus (1+Ti*s)
        end
        Gs = s*konstanteK/TProd * exp(-s*totzeitTt); % Übertragungsfunktion der DTn-Strecke       

    otherwise
        errordlg('Error in function "transferFcnControlledSystem". Content of parameter "typeOfControlledSystems" cannot be handled by the function.'); 
       
end
end