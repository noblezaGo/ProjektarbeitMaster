% Bestimmung Wendetangente numerisch

% Funktionsargument:
% K: Streckenverstärkung
% zeitkonstantenT: Streckenzeitkonstanten als Vektor, max. 3
% totzeitTt: Totzeit der Strecke
% simulationTime: Zeitvektor, über den simuliert wird

function [Tu,Ta] =  Bestimmung_Wendetangente_numerisch(K,zeitkonstantenT,totzeitTt,simulationTime)

%% Sprungsantwort im Laplace-Bereich berechnen

anzT = numel(zeitkonstantenT);
% H: anonyme Funktion der Sprungantwort im Laplace-Bereich
switch anzT
    case 2
        H = @(s) K/((zeitkonstantenT(1)*s+1)*(zeitkonstantenT(2)*s+1) * s) * exp(-s*totzeitTt);
        
    case 3
        H = @(s) K/((zeitkonstantenT(1)*s+1)*(zeitkonstantenT(2)*s+1)*(zeitkonstantenT(3)*s+1) * s) * exp(-s*totzeitTt);
        
    otherwise
        % Errorhandling
        errordlg('Error in Function "Bestimmung_Wendetangente_numerisch". Function cannot handle amount of given time constants');
        return
end



%% Sprungantwort in Zeitbereich wandeln

% Zeitvektor, über den die inverse Laplace-Transformation gemacht wird
% Start von time bei 0.01, da inverse Laplace-Transformation von 0 nicht
% existiert
dt = 0.01;
time = 0.01:dt:simulationTime;

% Funktion talbot_inversion führt numerische Laplace-Transformation durch
if(exist('H','var'))
h = talbot_inversion(H,time);
else 
    % Errorhandling
        errordlg('Error in Function "Bestimmung_Wendetangente_numerisch". Variable H does not exist');
        return
end
%% Wendepunkt berechnen -> größte Steigung
dh = zeros(length(h)-1,1);
for i=1:1:length(h)-1
    dh(i) = h(i+1)-h(i);
end
[dhmax,index] = max(dh);
% dhmax: max. Steigungsdelta 

% x-Koordinate des Wendepunkts
WPx = time(index);
% y-Koordinate des Wendepunkts
WPy = h(index);


%% Bestimmung der Wendetangente
% Schnittpunkt cWT der Wendetangente mit der y-Achse mit Koordinaten des
% Wendepunktes WPx, WPy und der Steigung dWP im Wendepunkt berechnen

dWP = dhmax/dt; % Steigung der WT berechnen. dhmax durch dt teilen da dhmax das Steigungsdelta im Schritt dt angibt
cWT = WPy - dWP*WPx; % Schnittspunkt der WT mit y-Achse, c=y(WPx,WPy)-mx

% Funktion der Wendetangente
% tVec = 0:dt:simulationTime;
% WT = dWP*tVec + cWT;

%% Bestimmung von Tu und Ta/Tg
%  x-Koordinate des Schnittpunktes der Wendetangente mit x-Achse ist Zeit Tu
% Nullstelle der Wendetangentenfunktion WT -> WT == 0
Tu = -cWT/dWP;

% x-Koordinate des Schnittpunktes der Wendetangente mit y=K
%SPK = (K-cWT)/dWP;

% Zeit Ta bzw Tg
Ta = K/dWP;


end