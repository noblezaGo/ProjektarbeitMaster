% T-Summenregel nach Kuhn
function[Kr,Tn,Tv] = Kuhn_normal(Ks,T1,T2,selectedController)
% TO DO

% Summenzeitkonstante bilden
TSum = T1+T2;

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