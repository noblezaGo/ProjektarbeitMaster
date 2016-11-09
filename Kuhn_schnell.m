% T-Summenregel nach Kuhn schnell

function[Kr,Tn,Tv] = Kuhn_schnell(Ks,T1,T2,selectedController)
% TO DO

% Summenzeitkonstante bilden
TSum = T1+T2;

% % selectedController enthält den über das Popup-Menü ausgewählten Regler
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