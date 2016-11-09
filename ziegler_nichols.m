% Ziegler-Nichols

function[Kr,Tn,Tv] = ziegler_nichols(Ks,Ta,Tu,selectedController)
% selectedController enthält den über das Popup-Menü ausgewählten Regler
switch selectedController
    case 'P-Regler'
        % P-Regler
        Kr = Ta/(Ks*Tu);
        Tn = 0;
        Tv = 0;
        disp('Chosen Controller: P');
    case 'PI-Regler'
        % PI-Regler
        Kr = (0.9*Ta)/(Ks*Tu);
        Tn = 3.33*Tu;
        Tv = 0;
        disp('Chosen Controller: PI');
    case 'PID-Regler'
        % PID-Regler
        Kr = (1.2*Ta)/(Ks*Tu);
        Tn = 2*Tu;
        Tv = 0.5*Tu;        
        disp('Chosen Controller: PID');
        
    otherwise 
        %Throw Error
end