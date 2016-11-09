% Projektarbeit 
function [Tu,Ta] =  Bestimmung_Wendetangente(K,T1,T2)
syms s t;

% Zeitkonstante Zähler Regelstrecke
%K = 1;

% Zeitkonstante T1 und T2 Nenner Regelstrecke
% T1 : Zeitkonstante1 der Strecke
% T2 : Zeitkonstante2 der Strecke

% Berechnung der Wendetangente für Ziegler-Nichols / CHR
% Übertragungsfkt
G = K/((T1*s+1) * (T2*s+1));
%F = K/(T^2*s^2+2*Daempfung*T*s+1);


% Sprungantwort im Laplace Bereich
H = G * 1/s;

% Sprungantwort in Zeitbereich wandeln
h = ilaplace(H);

% Zweite Ableitung berechnen
dhd2t = diff(h,t,2);

% Zweite Ableitung zu Null setzen und x-Wert des Wendepubktes berechnen
WPx = solve(dhd2t==0,t);
% symbolische Variable in numerische Variable wandeln
% bei kleiner Dämpfung steht in double(WPx) ein sehr kleiner
% Imaginärteil, dadurch kommt es zu einem Fehler bei der Berechnung der
% Wendetangente(kein Plot möglich)
WPxNum = real(double(WPx));

% Wendepunkt im Bereich <0 wird aus Matrix eliminiert
WPxCheckPositive = WPxNum>0;
% WPxNum enthält Wendepunkt im Bereich >0
WPxNum = WPxCheckPositive' * WPxNum;

% Dritte Ableitung berechnen
dhd3t = diff(dhd2t,t,1);

% Wert der dritten Ableitung an Stelle WPx
dh3dtWPx = subs(dhd3t,t,WPxNum);
dh3dtWPxNum = double(dh3dtWPx);
if(dh3dtWPxNum==0)
    % Throw Error
end

% figure(1);
% % Plot Sprungantwort
% fplot(h,[0,20]);
% hold on;
WPyNum =double(subs(h,t,WPxNum));
% Plot Wendepunkt
% plot(WPxNum,WPyNum,'+');

% Bestimmung der Wendetamgente
% Erste Ableitung an Stelle WPx -> Steigung mWT der Wendetangente
dhdt = diff(h,t,1);
mWT = double(subs(dhdt,t,WPxNum));

% Schnittpunkt cWT der Wendetangente mit der y-Achse
cWT = WPyNum-WPxNum*mWT;

% Funktion der Wendetangente
WT = mWT*t+cWT;
% fplot(WT,[0,20])

% Schnittpunkt der Wendetangente mit x-Achse, Zeit Tu
Tu = double(solve(WT==0,t));

% Schnittpunkt der Wendetangente mit y=K
SPK = double(solve(WT==K,t));

% Zeit Ta
Ta = SPK - Tu;
end