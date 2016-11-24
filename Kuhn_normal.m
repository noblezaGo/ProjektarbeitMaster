% T-Summenregel nach Kuhn normal
function[Kr,Tn,Tv] = Kuhn_normal(Ks,zeitkonstantenT,selectedController)
% TO DO

zeitkonstantenT(isnan(zeitkonstantenT)) = 0;

T1 = zeitkonstantenT(1);
T2 = zeitkonstantenT(2);
T3 = zeitkonstantenT(3);

% Summenzeitkonstante bilden
TSum = T1+T2+T3;

% % selectedController enthält den über das Popup-Menü ausgewählten Regler
switch selectedController
    % TO DO P-Regler Throw Error
    % Einstellungen nach Taschenbuch Regelungstechnik
    case 'PI-Regler'
        Kr = 0.5/Ks;
        Tn = 0.5 * TSum;
        Tv = 0;
        
    case 'PID-Regler'
        Kr = 1/Ks;
        Tn = 0.667 * TSum;
        Tv = 0.167 * TSum;
        
    otherwise % throw error
end

end