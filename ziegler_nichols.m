% Ziegler-Nichols

function[KR,Tn,Tv] = ziegler_nichols(K,Ta,Tu,selectedController)
% selectedController enthält den über das Popup-Menü ausgewählten Regler
switch selectedController
    case 'P-Regler'
        % P-Regler
        KR = Ta/(K*Tu);
        Tn = 0;
        Tv = 0;
        disp('Chosen Controller: P');
    case 'PI-Regler'
        % PI-Regler
        KR = (0.9*Ta)/(K*Tu);
        Tn = 3.33*Tu;
        Tv = 0;
        disp('Chosen Controller: PI');
    case 'PID-Regler'
        % PID-Regler
        KR = (1.2*Ta)/(K*Tu);
        Tn = 2*Tu;
        Tv = 0.5*Tu;        
        disp('Chosen Controller: PID');
        
    otherwise 
        %Throw Error
end