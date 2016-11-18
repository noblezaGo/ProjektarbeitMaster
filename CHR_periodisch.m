% CHR-Verfahren f�r gutes F�hrungsverhalten und periodischem Regelverlauf
% mit 20% �berschwingen

function[KR,Tn,Tv] = CHR_periodisch(K,Ta,Tu,selectedController)
% selectedController enth�lt den �ber das Popup-Men� ausgew�hlten Regler
switch selectedController
    case 'P-Regler'
        % P-Regler
        KR = 0.7*Ta/(K*Tu);
        Tn = 0;
        Tv = 0;
        disp('Chosen Controller: P');
    case 'PI-Regler'
        % PI-Regler
        KR = (0.6*Ta)/(K*Tu);
        Tn = Ta;
        Tv = 0;
        disp('Chosen Controller: PI');
    case 'PID-Regler'
        % PID-Regler
        KR = (0.95*Ta)/(K*Tu);
        Tn = 1.35*Ta;
        Tv = 0.47*Tu;        
        disp('Chosen Controller: PID');
        
    otherwise 
        %Throw Error
end