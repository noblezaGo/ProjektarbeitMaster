% CHR-Verfahren für gutes Führungsverhalten und aperiodischem Regelverlauf

function[KR,Tn,Tv] = CHR_aperiodisch(K,Ta,Tu,selectedController)
% selectedController enthält den über das Popup-Menü ausgewählten Regler
switch selectedController
    case 'P-Regler'
        % P-Regler
        KR = 0.3*Ta/(K*Tu);
        Tn = 0;
        Tv = 0;
        disp('Chosen Controller: P');
    case 'PI-Regler'
        % PI-Regler
        KR = (0.35*Ta)/(K*Tu);
        Tn = 1.2*Ta;
        Tv = 0;
        disp('Chosen Controller: PI');
    case 'PID-Regler'
        % PID-Regler
        KR = (0.6*Ta)/(K*Tu);
        Tn = Ta;
        Tv = 0.5*Tu;        
        disp('Chosen Controller: PID');
        
    otherwise 
        %Throw Error
end