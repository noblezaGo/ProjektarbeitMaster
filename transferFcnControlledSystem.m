% Bestimmung der Übertragungsfunktion Gs der Strecke
function[Gs] = transferFcnControlledSystem(konstanteK,zeitkonstantenT,totzeitTt,typeOfControlledSystem)

s = tf('s');

% NaN ersetzen durch 0
% Wenn die Strecke z.B. nur eine Zeitkonstante enthält, ist zeitkonstantenT(2) und zeitkonstantenT(3) = NaN 
% zeitkonstantenT(isnan(zeitkonstantenT)) = 0;
% 
% T1 = zeitkonstantenT(1);
% T2 = zeitkonstantenT(2);
% T3 = zeitkonstantenT(3);

TProd = 1; % Startwert muss 1 sein, da in Schleife für i=1 mit 1 multipliziert werden muss
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


end
end