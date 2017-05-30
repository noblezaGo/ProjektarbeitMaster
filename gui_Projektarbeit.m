function varargout = gui_Projektarbeit(varargin)
%GUI_PROJEKTARBEIT MATLAB code file for gui_Projektarbeit.fig
%      GUI_PROJEKTARBEIT, by itself, creates a new GUI_PROJEKTARBEIT or raises the existing
%      singleton*.
%
%      H = GUI_PROJEKTARBEIT returns the handle to a new GUI_PROJEKTARBEIT or the handle to
%      the existing singleton*.
%
%      GUI_PROJEKTARBEIT('Property','Value',...) creates a new GUI_PROJEKTARBEIT using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to gui_Projektarbeit_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUI_PROJEKTARBEIT('CALLBACK') and GUI_PROJEKTARBEIT('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUI_PROJEKTARBEIT.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_Projektarbeit

% Last Modified by GUIDE v2.5 22-Dec-2016 12:24:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_Projektarbeit_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_Projektarbeit_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
end


% --- Executes just before gui_Projektarbeit is made visible.
function gui_Projektarbeit_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)



%% Defaulteinstellungen Bedienmöglichkeiten. Buttons/Popupmenüs die am Anfang nicht bedient werden sollen werden ausgegraut.
handles.popupmenuVerfahren.Enable = 'off';  % Ausgrauen des Popupmenüs Verfahren
handles.popupmenuRegler.Enable = 'off'; % Ausgrauen des Popupmenüs Regler
handles.radiobuttonPlotStepClosedLoop.Enable = 'off';   % Ausgrauen des Radiobuttons zum Plotten des geschlossenen Regelkreises
handles.pushbuttonStreckenparameter.Enable = 'off'; % Ausgrauen des Buttons Streckenparameter

%% Text Popupmenü Strecke
handles.textPopupmenuStrecke = {'PTn-Strecke','ITn-Strecke','DTn-Strecke'};
handles.popupmenuStrecke.String = [{''},handles.textPopupmenuStrecke];

%% Text Popupmenü Verfahren
handles.textPopupmenuVerfahren = {'Ziegler-Nichols 1. Variante','Ziegler-Nichols 2. Variante','Chien Hrones Reswick (CHR)','Kuhn normal','Kuhn schnell','Skogestad','Reinisch'};
handles.popupmenuVerfahren.String = {''};


%% Text Popupmenü Regler
handles.textPopupmenuRegler = {'P-Regler','PI-Regler','PD-Regler','PID-Regler'};
handles.popupmenuRegler.String = {''};


%% Anzeige Grafik P-Regler
handles.grafikUebertragungsfunktionPRegler=imread('UebertragungsfunktionPRegler','png');   % Einlesen der Grafik 
 % Bildgröße bestimmen
 % heightImgPRegler: Höhe der Grafik
 % widthImgPRegler: Breite der Grafik
[heightImgPRegler,widthImgPRegler,dimImgPRegler] = size(handles.grafikUebertragungsfunktionPRegler);

% Subpanel mit der Größe des Bildes des P-Reglers erstellen
handles.subpanelPRegler = uipanel(handles.panelRegler,'BackgroundColor','white','BorderType','none','Units','pixels','Position',[220,37,widthImgPRegler,heightImgPRegler],'Visible','off');
% Axes wird in Subpanel erstellt
handles.axesPRegler = axes(handles.subpanelPRegler,'Units','normalized','Position',[0,0,1,1]);
% Bild wird in Axes angezeigt
image(handles.axesPRegler,handles.grafikUebertragungsfunktionPRegler);
axis off

%% Anzeige Grafik PI-Regler
handles.grafikUebertragungsfunktionPIRegler=imread('UebertragungsfunktionPIRegler','png');   % Einlesen der Grafik 
 % Bildgröße bestimmen
 % heightImgPIRegler: Höhe der Grafik
 % widthImgPIRegler: Breite der Grafik
[heightImgPIRegler,widthImgPIRegler,dimImgPIRegler] = size(handles.grafikUebertragungsfunktionPIRegler);

% Subpanel mit der Größe des Bildes des P-Reglers erstellen
handles.subpanelPIRegler = uipanel(handles.panelRegler,'BackgroundColor','white','BorderType','none','Units','pixels','Position',[150,22,widthImgPIRegler,heightImgPIRegler],'Visible','off');
% Axes wird in Subpanel erstellt
handles.axesPIRegler = axes(handles.subpanelPIRegler,'Units','normalized','Position',[0,0,1,1]);
% Bild wird in Axes angezeigt
image(handles.axesPIRegler,handles.grafikUebertragungsfunktionPIRegler);
axis off

%% Anzeige Grafik PD-Regler
handles.grafikUebertragungsfunktionPDRegler = imread('UebertragungsfunktionPDRegler','png');   % Einlesen der Grafik
 % Bildgröße bestimmen
 % heightImgPDRegler: Höhe der Grafik
 % widthImgPDRegler: Breite der Grafik
[heightImgPDRegler,widthImgPDRegler,dimImgPDRegler] = size(handles.grafikUebertragungsfunktionPDRegler);

% Subpanel mit der Größe des Bildes des PD-Reglers erstellen
handles.subpanelPDRegler = uipanel(handles.panelRegler,'BackgroundColor','white','BorderType','none','Units','pixels','Position',[180,35,widthImgPDRegler,heightImgPDRegler],'Visible','off');
% Axes wird in Subpanel erstellt
handles.axesPDRegler = axes(handles.subpanelPDRegler,'Units','normalized','Position',[0,0,1,1]);
% Bild wird in Axes angezeigt
image(handles.axesPDRegler,handles.grafikUebertragungsfunktionPDRegler);
axis off

%% Anzeige Grafik I-Regler
handles.grafikUebertragungsfunktionIRegler=imread('UebertragungsfunktionIRegler','png');   % Einlesen der Grafik 
 % Bildgröße bestimmen
 % heightImgPRegler: Höhe der Grafik
 % widthImgPRegler: Breite der Grafik
[heightImgIRegler,widthImgIRegler,dimImgIRegler] = size(handles.grafikUebertragungsfunktionIRegler);

% Subpanel mit der Größe des Bildes des I-Reglers erstellen
handles.subpanelIRegler = uipanel(handles.panelRegler,'BackgroundColor','white','BorderType','none','Units','pixels','Position',[220,21,widthImgIRegler,heightImgIRegler],'Visible','off');
% Axes wird in Subpanel erstellt
handles.axesIRegler = axes(handles.subpanelIRegler,'Units','normalized','Position',[0,0,1,1]);
% Bild wird in Axes angezeigt
image(handles.axesIRegler,handles.grafikUebertragungsfunktionIRegler);
axis off


%% Anzeige Grafik PID-Regler
handles.grafikUebertragungsfunktionPIDRegler=imread('UebertragungsfunktionPIDRegler','png');   % Einlesen der Grafik 
 % Bildgröße bestimmen
 % heightImgPIDRegler: Höhe der Grafik
 % widthImgPIDRegler: Breite der Grafik
[heightImgPIDRegler,widthImgPIDRegler,dimImgPIDRegler] = size(handles.grafikUebertragungsfunktionPIDRegler);

% Axes wird in Subpanel erstellt
handles.subpanelPIDRegler = uipanel(handles.panelRegler,'BackgroundColor','white','BorderType','none','Units','pixels','Position',[150,25,widthImgPIDRegler,heightImgPIDRegler],'Visible','off');
% Bild wird in Axes angezeigt
handles.axesPIDRegler = axes(handles.subpanelPIDRegler,'Units','normalized','Position',[0,0,1,1]);
image(handles.axesPIDRegler,handles.grafikUebertragungsfunktionPIDRegler);
axis off

%% Anzeige Grafik Sprungantwort Strecke
handles.grafikSprungantwortStrecke = imread('SprungantwortStrecke','png');    % Einlesen der Grafik
 % Bildgröße bestimmen
 % heightImgSprungantwortStrecke: Höhe der Grafik
 % widthImgSprungantwortStrecke: Breite der Grafik
[heightImgSprungantwortStrecke,widthImgSprungantwortStrecke,dimImgSprungantwortStrecke] = size(handles.grafikSprungantwortStrecke);

% Axes wird in Subpanel erstellt
handles.subpanelSprungantwortStrecke = uipanel(handles.buttongroupPlot,'BackgroundColor','white','BorderType','none','Units','pixels','Position',[280,21,widthImgSprungantwortStrecke,heightImgSprungantwortStrecke],'Visible','on');
% Bild wird in Axes angezeigt
handles.axesSprungantwortStrecke = axes(handles.subpanelSprungantwortStrecke,'Units','normalized','Position',[0,0,1,1]);
image(handles.axesSprungantwortStrecke,handles.grafikSprungantwortStrecke);
axis off

%% Anzeige Grafik Sprungantwort geschlossener Regelkreis
handles.grafikSprungantwortClosedLoop = imread('SprungantwortClosedLoop','png');
% Bildgröße bestimmen
 % heightImgSprungantwortClosedLoop: Höhe der Grafik
 % widthImgSprungantwortClosedLoop: Breite der Grafik
[heightImgSprungantwortClosedLoop,widthImgSprungantwortClosedLoop,dimImgSprungantwortClosedLoop] = size(handles.grafikSprungantwortClosedLoop);

% Axes wird in Subpanel erstellt
handles.subpanelSprungantwortClosedLoop = uipanel(handles.buttongroupPlot,'BackgroundColor','white','BorderType','none','Units','pixels','Position',[250,16,widthImgSprungantwortClosedLoop,heightImgSprungantwortClosedLoop],'Visible','off');
% Bild wird in Axes angezeigt
handles.axesSprungantwortClosedLoop = axes(handles.subpanelSprungantwortClosedLoop,'Units','normalized','Position',[0,0,1,1]);
image(handles.axesSprungantwortClosedLoop,handles.grafikSprungantwortClosedLoop);
axis off

%% Popupmenü Überschwingweite für Reinisch und CHR
handles.textUeberschwingweite = uicontrol('style','text','position',[260 432 120 20],'FontSize',8,'BackgroundColor','white','Visible','off','String','Überschwingweite:');
handles.popupmenuUeberschwingweite = uicontrol('style','popupmenu','position',[400 436 100 20],'Visible','off');


%% Figure zum Plotten der Sprungantwort

% Plot beschriften
axes(handles.axes1);
title('Systemsprungantwort');
xlabel('t in s');
ylabel('h(t)');

% Choose default command line output for gui_Projektarbeit
%handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_Projektarbeit wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end


% --- Outputs from this function are returned to the command line.
function varargout = gui_Projektarbeit_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%varargout{1} = handles.output;
end

% --- Executes on selection change in popupmenuStrecke.
function popupmenuStrecke_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuStrecke (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuStrecke contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuStrecke

contents = cellstr(get(hObject,'String'));
selectedItemStrecke = contents{get(hObject,'Value')};

% Wenn Feld mit Inhalt im Popupmenü-Strecke angewählt wird, geht
% das Eingabefenster der Streckenparameter auf
if(isempty(selectedItemStrecke)==0)
    
    gui_Strecke(hObject);   % gui_Strecke callen    

    handles.pushbuttonStreckenparameter.Enable = 'on';  % Button Streckenparameter aktivieren
else 
    % Wenn Feld ohne Inhalt angewählt wird
    handles.pushbuttonStreckenparameter.Enable = 'off';  % Button Streckenparameter deaktivieren
    
end

guidata(hObject,handles);
end

% --- Executes during object creation, after setting all properties.
function popupmenuStrecke_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuStrecke (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in pushbuttonStreckenparameter.
function pushbuttonStreckenparameter_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonStreckenparameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Das handle zu diesem pushbutton wird der GUI zur Eingabe der
% Streckenparameter übergeben

% Wenn figure "figStreckenparameter" in den handles existiert, wird das Fenster zur Eingabe der Streckenparameter sichtbar
% gemacht. "figStreckenparameter" wird beim Drücken des "Übernehmen"-
% Pushbuttons im Streckeneingabefenster zu den handles der mainfigure hinzugefügt.
if(isfield(handles,'figStreckenparameter'))
    handles.figStreckenparameter.Visible = 'on';
    
% Wenn Fenster zur Eingabe der Streckenparameter schon einmal über das
% Popupmenü "Regelstrecke" geöffnet wurde, aber nicht übernehmen gedrückt
% wurde, ist der Pushbutton "Streckenparameter" sichtbar. Die figure
% "figStreckenparameter" wurde dann aber nicht den handles der mainfigure
% hinzugefügt. Drücken des Pushbuttons "Streckenparameter" soll dann das
% Fenster zur Eingabe der Streckenparameter neu öffnen.
else 
    gui_Strecke(hObject);   % gui_Strecke callen  
end

%gui_Strecke(hObject);
% Die eingegebenen Streckenparameter werden von der gui_Strecke im handle
% "handles" gespeichert und stehen somit in diesem m-File zur Verfügung
end



% --- Executes on selection change in popupmenuVerfahren.
function popupmenuVerfahren_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuVerfahren (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuVerfahren contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuVerfahren

% contents enthält Tabelle mit Inhalten des Popup-Menüs
contents = get(hObject,'String');

% get(hObject,'Value') gibt Nummer des ausgewählten Eintrages zurück
% selectedItemVerfahren enthält ausgewähltes Berechnungsverfahren
selectedItemVerfahren = contents{get(hObject,'Value')};

%% Je nach ausgewähltem Verfahren wird entschieden, welche Regler angewählt werden können
% textPopupmenuVerfahren ist ein cell array, das strings von allen
% implementierten Verfahren enthält und in der openingFcn definiert wird
switch selectedItemVerfahren
    % Wenn Ziegler-Nichols als Verfahren gewählt wurde, stehen als Regler
    % P,PI und PID zu Verfügung
    % Default-Einstellung ist P-Regler
    
    % IMMER value auf 1 zuerst zurücksetzen bevor die string property neu
    % gesetzt wird
    case handles.textPopupmenuVerfahren(1) % Ziegler-Nichols 1.Var
        set(handles.popupmenuRegler, 'Value', 1); % default geben
        set(handles.popupmenuRegler, 'String', {'P-Regler','PI-Regler','PID-Regler'}); % Reglerauswahl geben        
        
        % Grafik der Übertragungsfunktion des P-Reglers anzeigen
        handles.subpanelPIRegler.Visible = 'off';
        handles.subpanelPDRegler.Visible = 'off';
        handles.subpanelPIDRegler.Visible = 'off';
        handles.subpanelIRegler.Visible = 'off';
        handles.subpanelPRegler.Visible = 'on';
        
        % Popupmenü Überschwingweite ausblenden
        handles.textUeberschwingweite.Visible = 'off';
        handles.popupmenuUeberschwingweite.Visible = 'off';
    
    case handles.textPopupmenuVerfahren(2) % Ziegler-Nichols 2.Var
        set(handles.popupmenuRegler, 'Value', 1); % default geben
        set(handles.popupmenuRegler, 'String', {'P-Regler','PI-Regler','PID-Regler'}); % Reglerauswahl geben        
        
        % Grafik der Übertragungsfunktion des P-Reglers anzeigen
        handles.subpanelPIRegler.Visible = 'off';
        handles.subpanelPDRegler.Visible = 'off';
        handles.subpanelPIDRegler.Visible = 'off';
        handles.subpanelIRegler.Visible = 'off';
        handles.subpanelPRegler.Visible = 'on';
        
        % Popupmenü Überschwingweite ausblenden
        handles.textUeberschwingweite.Visible = 'off';
        handles.popupmenuUeberschwingweite.Visible = 'off';
        
    % Wenn CHR als Verfahren gewählt wurde, stehen als Regler
    % P,PI und PID zu Verfügung
    % Default-Einstellung ist P-Regler
    case handles.textPopupmenuVerfahren(3) % CHR 
        set(handles.popupmenuRegler, 'Value', 1);
        set(handles.popupmenuRegler, 'String', {'P-Regler','PI-Regler','PID-Regler'});        
        
        % Grafik der Übertragungsfunktion des P-Reglers anzeigen
        handles.subpanelPIRegler.Visible = 'off';
        handles.subpanelPDRegler.Visible = 'off';
        handles.subpanelPIDRegler.Visible = 'off';
        handles.subpanelIRegler.Visible = 'off';
        handles.subpanelPRegler.Visible = 'on';
        
        % Popupmenü Überschwingweite ausblenden
        handles.popupmenuUeberschwingweite.Value = 1; % default geben
        handles.popupmenuUeberschwingweite.String = {'0%' '20%'};
        handles.textUeberschwingweite.Visible = 'on';
        handles.popupmenuUeberschwingweite.Visible = 'on';
        
    
    case handles.textPopupmenuVerfahren(4)  % Kuhn normal
        set(handles.popupmenuRegler, 'Value', 1);
        set(handles.popupmenuRegler, 'String', {'P-Regler','PI-Regler','PD-Regler','PID-Regler'});        
        
        % Grafik der Übertragungsfunktion des P-Reglers anzeigen
         handles.subpanelPIRegler.Visible = 'off';
        handles.subpanelPDRegler.Visible = 'off';
        handles.subpanelPIDRegler.Visible = 'off';
        handles.subpanelIRegler.Visible = 'off';
        handles.subpanelPRegler.Visible = 'on';  
        
        % Popupmenü Überschwingweite ausblenden
        handles.textUeberschwingweite.Visible = 'off';
        handles.popupmenuUeberschwingweite.Visible = 'off';
      
        % Grafik der Übertragungsfunktion des PI-Reglers anzeigen
    case handles.textPopupmenuVerfahren(5)  % Kuhn schnell
        set(handles.popupmenuRegler, 'Value', 1);
        set(handles.popupmenuRegler, 'String', {'PI-Regler','PID-Regler'});        
        
        % Grafik der Übertragungsfunktion des PI-Reglers anzeigen
        handles.subpanelPDRegler.Visible = 'off';
        handles.subpanelPIDRegler.Visible = 'off';
        handles.subpanelPRegler.Visible = 'off';
        handles.subpanelIRegler.Visible = 'off';
        handles.subpanelPIRegler.Visible = 'on';
        
        % Popupmenü Überschwingweite ausblenden
        handles.textUeberschwingweite.Visible = 'off';
        handles.popupmenuUeberschwingweite.Visible = 'off';
        
    case handles.textPopupmenuVerfahren(6); % Skogestad
        
        % alle Grafiken ausblenden
        handles.subpanelPDRegler.Visible = 'off';
        handles.subpanelPIDRegler.Visible = 'off';
        handles.subpanelPRegler.Visible = 'off';
        handles.subpanelIRegler.Visible = 'off';
        handles.subpanelPIRegler.Visible = 'off';
        
        % Popupmenü Überschwingweite ausblenden
        handles.textUeberschwingweite.Visible = 'off';
        handles.popupmenuUeberschwingweite.Visible = 'off';
        
        % Je nach gewählter Strecke und Anzahl Zeitkonstanten steht entweder PI-oder
        % PID-Regler zur Verfügung
        contentPopupmenuStrecke = get(handles.popupmenuStrecke,'String');
        selectedControlledSystem = contentPopupmenuStrecke{get(handles.popupmenuStrecke,'Value')};
        
        anzT = numel(handles.zeitkonstantenT);  % Anzahl Zeitkonstanten der Strecke
        
        set(handles.popupmenuRegler, 'Value', 1); 
           
        switch selectedControlledSystem
            case handles.textPopupmenuStrecke(1)    % PTn-Strecke  
                
                if(anzT==1)
                   handles.popupmenuRegler.String = {'PI-Regler'};    % bei PT1-Strecke wird nach dem Skogestad-Verfahren ein PI-Regler verwendet
                   
                   % Grafik der Übertragungsfunktion des PI-Reglers anzeigen
                   handles.subpanelPIRegler.Visible = 'on';
                   
                elseif(anzT==2)
                    handles.popupmenuRegler.String = {'PID-Regler'};    % bei PT2-Strecke wird nach dem Skogestad-Verfahren ein PID-Regler verwendet
                    % Grafik der Übertragungsfunktion des PID-Reglers anzeigen
                    handles.subpanelPIDRegler.Visible = 'on';
                end
                
            case handles.textPopupmenuStrecke(2)    % ITn-Strecke
                
                if(anzT==0)
                   handles.popupmenuRegler.String = {'PI-Regler'};    % bei I-Strecke wird nach dem Skogestad-Verfahren ein PI-Regler verwendet
                   
                   % Grafik der Übertragungsfunktion des PI-Reglers anzeigen
                   handles.subpanelPIRegler.Visible = 'on';
                elseif(anzT==1)
                    handles.popupmenuRegler.String = {'PID-Regler'};    % bei IT1-Strecke wird nach dem Skogestad-Verfahren ein PID-Regler verwendet
                    % Grafik der Übertragungsfunktion des PID-Reglers anzeigen
                    handles.subpanelPIDRegler.Visible = 'on';
                end
        end
        
      case handles.textPopupmenuVerfahren(7); % Reinisch
        
        % alle Grafiken ausblenden, Grafik P-Regler einblenden
        handles.subpanelPDRegler.Visible = 'off';
        handles.subpanelPIDRegler.Visible = 'off';
        handles.subpanelPIRegler.Visible = 'off';
        handles.subpanelIRegler.Visible = 'off';
        handles.subpanelPRegler.Visible = 'on';
        
        % Wenn PTn-Strecke gewählt wurde steht P,PI,I,PD,PID-Regler zur
        % Verfügung.
        % Wenn ITn-Strecke gewählt wurde steht P und PD-Regler zur
        % Verfügung
        contentPopupmenuStrecke = get(handles.popupmenuStrecke,'String');
        selectedControlledSystem = contentPopupmenuStrecke{get(handles.popupmenuStrecke,'Value')};
               
        set(handles.popupmenuRegler, 'Value', 1);    
        
        switch selectedControlledSystem
            
            % bei PT2-Strecke oder höhere Ordnung stehen alle Regler zur
            % Verfügung
            % bei PT1-Strecke nur P-Regler,I-Regler,PI-Regler
            case handles.textPopupmenuStrecke(1)    % PTn-Strecke 
                % Anzahl Zeitkonstanten
                anzT = numel(handles.zeitkonstantenT);
                
                if(anzT>=2)
                    handles.popupmenuRegler.String = {'P-Regler','PI-Regler','I-Regler','PD-Regler','PID-Regler'};
                elseif(anzT==1)
                    handles.popupmenuRegler.String = {'P-Regler','PI-Regler','I-Regler'};
                end
            
            case handles.textPopupmenuStrecke(2) % ITn-Strecke
                handles.popupmenuRegler.String = {'P-Regler','PD-Regler'};            
            
        end
        
        % Popupmenü Überschwingweite einblenden
        handles.popupmenuUeberschwingweite.Value = 1;   % default geben
        handles.popupmenuUeberschwingweite.String = {'0%' '5%' '10%' '15%' '20%' '30%' '40%' '50%' '60%'};
        handles.textUeberschwingweite.Visible = 'on';
        handles.popupmenuUeberschwingweite.Visible = 'on';      
                    
            
end
        
        
set(handles.popupmenuRegler,'Enable','on'); 

guidata(hObject,handles);
end



% --- Executes during object creation, after setting all properties.
function popupmenuVerfahren_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuVerfahren (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    
end
end

% --- Executes on selection change in popupmenuRegler.
function popupmenuRegler_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuRegler (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuRegler contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuRegler

contents = cellstr(get(hObject,'String'));
selectedController = contents{get(hObject,'Value')};

%% Grafik der Reglerübertragungsfunktion
switch selectedController
    case 'P-Regler' 
     % Grafik der Übertragungsfunktion des P-Reglers anzeigen
        handles.subpanelPIRegler.Visible = 'off';
        handles.subpanelPDRegler.Visible = 'off';
        handles.subpanelPIDRegler.Visible = 'off';
        handles.subpanelIRegler.Visible = 'off';
        handles.subpanelPRegler.Visible = 'on';
    
    % Grafik der Übertragungsfunktion des PI-Reglers anzeigen
    case 'PI-Regler'
        handles.subpanelPIDRegler.Visible = 'off';
        handles.subpanelPDRegler.Visible = 'off';
        handles.subpanelPRegler.Visible = 'off';
        handles.subpanelIRegler.Visible = 'off';
        handles.subpanelPIRegler.Visible = 'on';
    
    % Grafik der Übertragungsfunktion des PD-Reglers anzeigen
    case 'PD-Regler'
        handles.subpanelPIDRegler.Visible = 'off';
        handles.subpanelPRegler.Visible = 'off';
        handles.subpanelPIRegler.Visible = 'off';
        handles.subpanelIRegler.Visible = 'off';
        handles.subpanelPDRegler.Visible = 'on';
   
    % Grafik der Übertragungsfunktion des PID-Reglers anzeigen
    case 'PID-Regler'       
        handles.subpanelPRegler.Visible = 'off';
        handles.subpanelPDRegler.Visible = 'off';
        handles.subpanelPIRegler.Visible = 'off'; 
        handles.subpanelIRegler.Visible = 'off';
        handles.subpanelPIDRegler.Visible = 'on';
    
    % Grafik der Übertragungsfunktion des I-Reglers anzeigen
    case 'I-Regler'
        handles.subpanelPRegler.Visible = 'off';
        handles.subpanelPDRegler.Visible = 'off';
        handles.subpanelPIRegler.Visible = 'off'; 
        handles.subpanelPIDRegler.Visible = 'off';
        handles.subpanelIRegler.Visible = 'on';

    
   
end        

end

% --- Executes during object creation, after setting all properties.
function popupmenuRegler_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuRegler (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



% --- Executes on button press in pushbuttonClearFigure.
function pushbuttonClearFigure_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonClearFigure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Plot figure wird zurückgesetzt, alle Plots gelöscht
cla(handles.axes1);
% Legende wird aus plot figure gelöscht
legend(handles.axes1,'off');
% handels.Anzahl enthält Info, wie oft Start Button gedrückt wurde
% Info wird für die Legendenbeschriftung benutzt
% Zurücksetzen des Zählers, um bei Legendenbeschriftung wieder von vorn zu
% zählen anzufangen
handles.AnzahlStartButtonPushed = 0;

guidata(hObject,handles);
end


function editSimulationStartTime_Callback(hObject, eventdata, handles)
% hObject    handle to editSimulationStartTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSimulationStartTime as text
%        str2double(get(hObject,'String')) returns contents of editSimulationStartTime as a double

end

% --- Executes during object creation, after setting all properties.
function editSimulationStartTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSimulationStartTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function editSimulationStopTime_Callback(hObject, eventdata, handles)
% hObject    handle to editSimulationStopTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSimulationStopTime as text
%        str2double(get(hObject,'String')) returns contents of editSimulationStopTime as a double

end

% --- Executes during object creation, after setting all properties.
function editSimulationStopTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSimulationStopTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in radiobuttonPlotStepControlledSystem.
function radiobuttonPlotStepControlledSystem_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonPlotStepControlledSystem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonPlotStepControlledSystem

% Grafik der Formel zur Sprungantwort Strecke anzeigen
handles.subpanelSprungantwortClosedLoop.Visible = 'off';
handles.subpanelSprungantwortStrecke.Visible = 'on';

end

% --- Executes on button press in radiobuttonPlotStepClosedLoop.
function radiobuttonPlotStepClosedLoop_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonPlotStepClosedLoop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonPlotStepClosedLoop

% Grafik der Formel zur Sprungantwort des geschlossenen Regelkreises anzeigen
handles.subpanelSprungantwortStrecke.Visible = 'off';
handles.subpanelSprungantwortClosedLoop.Visible = 'on';

end



% --- Executes on button press in startbutton.
function startbutton_Callback(hObject, eventdata, handles)
% hObject    handle to startbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Zuweisung der Streckenparameter, die in den handles gespeichert sind
% Streckenparameter werden in "gui_Strecke" den handles zugewiesen
if(isfield(handles,'konstanteK'))
    konstanteK = handles.konstanteK;
else
    errordlg('Bitte Streckenparameter eingeben');
    return
end

if(isfield(handles,'zeitkonstantenT'))
    zeitkonstantenT = handles.zeitkonstantenT;
else
    errordlg('Bitte Streckenparameter eingeben');
    return
end

if(isfield(handles,'totzeitTt'))
    totzeitTt = handles.totzeitTt;
else
    errordlg('Bitte Streckenparameter eingeben');
    return
end


%% Eingaben auslesen

% Eingegebener Streckentyp auslesen
contentPopupmenuAuswahlStrecke = get(handles.popupmenuStrecke,'String');
selectedItemStrecke = contentPopupmenuAuswahlStrecke{get(handles.popupmenuStrecke,'Value')}
if(isempty(selectedItemStrecke))
    errordlg('Bitte Regelstrecke auswählen');
    return
end

% Eingegebenes Verfahren auslesen
contentPopupmenuVerfahren = get(handles.popupmenuVerfahren,'String');
selectedItemVerfahren = contentPopupmenuVerfahren{get(handles.popupmenuVerfahren,'Value')};

% Eingegebener Regler auslesen
contentPopupmenuRegler = get(handles.popupmenuRegler,'String');
selectedItemController = contentPopupmenuRegler{get(handles.popupmenuRegler,'Value')};

% Eingebene Simulationszeiten auslesen
simulationStartTime = str2double(get(handles.editSimulationStartTime,'String'));
simulationStopTime = str2double(get(handles.editSimulationStopTime,'String'));

% Art des Plottes auslesen
stateRadiobuttonPlotClosedLoop = get(handles.radiobuttonPlotStepClosedLoop,'Value');
stateRadiobuttonPlotControlledSystem = get(handles.radiobuttonPlotStepControlledSystem,'Value');

%% Abfrage, ob die Sprungantwort der Strecke oder des geschlossenen geregelten Kreises geplottet werden soll
if(stateRadiobuttonPlotClosedLoop) % Radiobutton im Panel "Plot" auf "Sprungantwort geschlossener Regelkreis" eingestellt
    %% Bestimmung der Reglerparameter Kr,Tn,Tv
    % geschlossener Regelkreis wurde ausgewählt
    % Bestimmung der Regelparameter KR,Tn,Tv nach dem ausgewählten Verfahren
    % ausgewählter Regler wird als Parameter 'selectedItemController' übergeben
    
    if(isempty(selectedItemVerfahren)) % Prüfen ob Entwurfsverfahren ausgewählt wurde
        errordlg('Bitte Entwurfsverfahren auswählen');
        return
    else
        switch selectedItemVerfahren
            case handles.textPopupmenuVerfahren(1) % Ziegler-Nichols 1. Variante                
                [Kr,Tn,Tv] = ziegler_nichols_1(konstanteK,zeitkonstantenT,totzeitTt,selectedItemController);
                
            case handles.textPopupmenuVerfahren(2) % Ziegler-Nichols 2. Variante
                % Call der Funktion Bestimmung_Wendetangente -> Tu und Ta werden
                % zurückgegeben
                [Tu,Ta] = Bestimmung_Wendetangente_numerisch(konstanteK,zeitkonstantenT,totzeitTt,simulationStopTime);
                [Kr,Tn,Tv] = ziegler_nichols_2(konstanteK,Ta,Tu,selectedItemController);
                
            case handles.textPopupmenuVerfahren(3) % CHR 
                % Call der Funktion Bestimmung_Wendetangente -> Tu und Ta werden
                % zurückgegeben
                
                % Eingegebene Überschwungweite auslesen
                content = get(handles.popupmenuUeberschwingweite,'String');
                ueberschwingweite = content{get(handles.popupmenuUeberschwingweite,'Value')};                
                
                [Tu,Ta] = Bestimmung_Wendetangente_numerisch(konstanteK,zeitkonstantenT,totzeitTt,simulationStopTime);
                
                if(strcmp(ueberschwingweite,'20%')) % strcmp:Stringvergleich
                    % CHR periodisch bei gewählten 20% Überschwingen
                    [Kr,Tn,Tv] = CHR_periodisch(konstanteK,Ta,Tu,selectedItemController);
                elseif(strcmp(ueberschwingweite,'0%'))
                    % CHR aperiodisch bei gewählten 20% Überschwingen
                    [Kr,Tn,Tv] = CHR_aperiodisch(konstanteK,Ta,Tu,selectedItemController);
                end                    

            case handles.textPopupmenuVerfahren(4)  % Kuhn normal
                [Kr,Tn,Tv] = Kuhn_normal(konstanteK,zeitkonstantenT,totzeitTt,selectedItemController);

            case handles.textPopupmenuVerfahren(5)  % Kuhn schnell
                [Kr,Tn,Tv] = Kuhn_schnell(konstanteK,zeitkonstantenT,totzeitTt,selectedItemController);

            case handles.textPopupmenuVerfahren(6)  % Skogestad
                [Kr,Tn,Tv] = Skogestad(konstanteK,zeitkonstantenT,totzeitTt,selectedItemStrecke);
                
            case handles.textPopupmenuVerfahren(7) % Reinisch
                % Eingegebene Überschwungweite auslesen
                content = get(handles.popupmenuUeberschwingweite,'String');
                ueberschwingweite = content{get(handles.popupmenuUeberschwingweite,'Value')};
                [Kr,Tn,Tv] = Reinisch(konstanteK,zeitkonstantenT,totzeitTt,selectedItemStrecke,ueberschwingweite,selectedItemController);
        end
    end


    %% Bestimmung der Übertragungsfunktion Gr des Reglers
    Gr = transferFcnController(Kr,Tn,Tv,selectedItemController);

    %% Bestimmung der Übertragungsfunktion Gs der Strecke
    Gs = transferFcnControlledSystem(konstanteK,zeitkonstantenT,totzeitTt,selectedItemStrecke);

    %% Bestimmung der Übertragungsfunktion des geschlossenen Regelkreises
    Gtot = Gr*Gs/(1+Gr*Gs);    
    
    %% Erstellung des Plots, Sprungantwort geschlossener Regelkreis
    % Plot der Sprungantwort in Axes1
    axes(handles.axes1);

    hold all;
    
    %Simulationszeit vorgeben
    simulationTime = simulationStartTime : 0.01 : simulationStopTime;

    % y-Werte berechnen über vorgegebener Sumilationszeit
    [y,t] = step(Gtot,simulationTime);

    % Sprungantwort plotten
    % als Name erscheint das gewählte Entwurfsverfahren in der Legende
    plot(t,y, 'DisplayName', selectedItemVerfahren);

    legend('-DynamicLegend'); % undokumentierte Matlab-Funktion-> erstellt Legende dynamisch in Abhängigkeit von Anzahl Plots
   

elseif(stateRadiobuttonPlotControlledSystem) % Radiobutton auf "Sprungantwort Regelstrecke" eingestellt
    %% Sprungantwort der Strecke soll geplottet werden
    % Bestimmung der Übertragungsfunktion Gs der Strecke
    Gs = transferFcnControlledSystem(konstanteK,zeitkonstantenT,totzeitTt,selectedItemStrecke);
    % Gesamtübertragungsfunktion Gtot wird geplottet, Gs wird Gtot
    % zugewiesenen
    Gtot = Gs;
    
     %% Erstellung des Plots, Sprungantwort Regelstrecke
    % Plot der Sprungantwort in Axes1
    axes(handles.axes1);

    hold all;

    %Simulationszeit vorgeben
    simulationTime = simulationStartTime : 0.01 : simulationStopTime;

    % y-Werte berechnen über vorgegebener Sumilationszeit
    [y,t] = step(Gtot,simulationTime);

    % Sprungantwort plotten
    % In der Legende erscheint als Name der ausgewählte Streckentyp
    plot(t,y, 'DisplayName', selectedItemStrecke);

    legend('-DynamicLegend'); % undokumentierte Matlab-Funktion-> erstellt Legende dynamisch in Abhängigkeit von Anzahl Plots
    
else
    % Errorhandling
    errordlg('Fehler bei Auslesen der Radiobuttons im Feld "Plot"','Error','modal');
end  
    

guidata(hObject,handles)
end
