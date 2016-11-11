% Bestimmung Wendetangente numerisch
function [Tu,Ta] =  Bestimmung_Wendetangente(K,T1,T2,simulationTime)

s = tf('s');


% Zeitkonstante Zähler Regelstrecke
%K = 1;

% Zeitkonstante T1 und T2 Nenner Regelstrecke
% T1 : Zeitkonstante1 der Strecke
% T2 : Zeitkonstante2 der Strecke

% Berechnung der Wendetangente für Ziegler-Nichols / CHR

%F = K/(T^2*s^2+2*Daempfung*T*s+1);

% Übertragungsfkt
% G = K/((T1*s+1) * (T2*s+1));

% Sprungantwort
% H = @(s) K/((T1*s+1) * (T2*s+1)*s);

% H wird definiert als anonyme Funktion
H = @(s) K/((T1*s+1) * (T2*s+1)*s);

% Sprungantwort in Zeitbereich wandeln

% Zeitvektor, über den die inverse Laplace-Transformation gemacht wird
dt = 0.01;
time = 0.01:dt:simulationTime;

% Funktion talbot_inversion führt numerische Laplace-Transformation durch
h = talbot_inversion(H,time);

% Wendepunkt berechnen -> größte Steigung
dh = zeros(length(h)-1,1);
for i=1:1:length(h)-1
    dh(i) = h(i+1)-h(i);
end
[dhmax,index] = max(dh);

WPx = time(index);
WPy = h(index);

% figure(1);
% % Plot Sprungantwort
% plot(time,h);
% hold on;
% % WPyNum =double(subs(h,t,WPxNum));
% % Plot Wendepunkt
% plot(WPx,WPy,'+');
% 
% % Bestimmung der Wendetangente
% Schnittpunkt cWT der Wendetangente mit der y-Achse mit Koordinaten des
% Wendepunktes WPx, WPy und der Steigung dWP im Wendepunkt 

dWP = dhmax/dt; % Steigung berechnen, durch dt teilen da dhmax die Steigung im Schritt dt angibt
cWT = WPy - dWP*WPx;

% Funktion der Wendetangente
tVec = 0:dt:simulationTime;
WT = dWP*tVec + cWT;
% plot(tVec,WT);

% % x-Koordinate des Schnittpunktes der Wendetangente mit x-Achse ist Zeit Tu
% Nullstelle der Funktion WT -> WT == 0
Tu = -cWT/dWP;

% x-Koordinate des Schnittpunktes der Wendetangente mit y=K
SPK = (K-cWT)/dWP;

% Zeit Ta
Ta = SPK - Tu;

% % Erste Ableitung an Stelle WPx -> Steigung mWT der Wendetangente
% dhdt = diff(h,t,1);
% mWT = double(subs(dhdt,t,WPxNum));
% 
% % Schnittpunkt cWT der Wendetangente mit der y-Achse
% cWT = WPyNum-WPxNum*mWT;
% 
% % Funktion der Wendetangente
% WT = mWT*t+cWT;
% % fplot(WT,[0,20])
% 
% % Schnittpunkt der Wendetangente mit x-Achse, Zeit Tu
% Tu = double(solve(WT==0,t));
% 
% % Schnittpunkt der Wendetangente mit y=K
% SPK = double(solve(WT==K,t));
% 
% % Zeit Ta
% Ta = SPK - Tu;

end