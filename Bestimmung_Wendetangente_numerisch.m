% Bestimmung Wendetangente numerisch
function [Tu,Ta] =  Bestimmung_Wendetangente_numerisch(K,zeitkonstantenT,totzeitTt,simulationTime)



%s = tf('s');

% NaN ersetzen durch 0
% % Wenn die Strecke z.B. nur eine Zeitkonstante enthält, ist zeitkonstantenT(2) und zeitkonstantenT(3) = NaN 
% zeitkonstantenT(isnan(zeitkonstantenT)) = 0;
% 
% T1 = zeitkonstantenT(1);
% T2 = zeitkonstantenT(2);
% T3 = zeitkonstantenT(3);

% allg. Formel der Übertragungsfkt PTn
% PT1-Strecke: T2==0, T3==0
% PT2-Strecke: T3==0
%Gs = K/((1+T1*s)*(1+T2*s)*(1+T3*s)) * exp(-s*totzeitTt);
anzT = numel(zeitkonstantenT);

switch anzT
    case 2
        H = @(s) K/((zeitkonstantenT(1)*s+1)*(zeitkonstantenT(2)*s+1) * s) * exp(-s*totzeitTt);
        
    case 3
        H = @(s) K/((zeitkonstantenT(1)*s+1)*(zeitkonstantenT(2)*s+1)*(zeitkonstantenT(3)*s+1) * s) * exp(-s*totzeitTt);
        
    otherwise
        % Throw Error
end

% for i=1:numel(zeitkonstantenT)
%    TProd = TProd * (1+zeitkonstantenT(i)*s); % Produkt aus (1+Ti*s)
% end 
% 
% % H wird definiert als anonyme Funktion
% H = @(s) K/(TProd * s) * exp(-s*totzeitTt);
% %K/((T1*s+1) * (T2*s+1)*s);

%% Sprungantwort in Zeitbereich wandeln

% Zeitvektor, über den die inverse Laplace-Transformation gemacht wird
% Start von time bei 0.01, da inverse Laplace-Transformation von 0 nicht
% existiert
dt = 0.01;
time = 0.01:dt:simulationTime;

% Funktion talbot_inversion führt numerische Laplace-Transformation durch
h = talbot_inversion(H,time);

%% Wendepunkt berechnen -> größte Steigung
dh = zeros(length(h)-1,1);
for i=1:1:length(h)-1
    dh(i) = h(i+1)-h(i);
end
[dhmax,index] = max(dh);

WPx = time(index);
WPy = h(index);

% figure(3);
% % Plot Sprungantwort
% plot(time,h);
% hold on;
% % WPyNum =double(subs(h,t,WPxNum));
% % Plot Wendepunkt
% plot(WPx,WPy,'+');


%% Bestimmung der Wendetangente
% Schnittpunkt cWT der Wendetangente mit der y-Achse mit Koordinaten des
% Wendepunktes WPx, WPy und der Steigung dWP im Wendepunkt 

dWP = dhmax/dt; % Steigung berechnen, durch dt teilen da dhmax die Steigung im Schritt dt angibt
cWT = WPy - dWP*WPx;

% Funktion der Wendetangente
% tVec = 0:dt:simulationTime;
% WT = dWP*tVec + cWT;
% plot(tVec,WT);

%% Bestimmung von Tu und Ta
%  x-Koordinate des Schnittpunktes der Wendetangente mit x-Achse ist Zeit Tu
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