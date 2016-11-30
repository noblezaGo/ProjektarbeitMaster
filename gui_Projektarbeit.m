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

% Last Modified by GUIDE v2.5 30-Nov-2016 13:47:42

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

handles.popupmenu_Regler.Enable = 'off';
%% Anzeige Grafik P-Regler
handles.grafikUebertragungsfunktionPRegler=imread('C:\Users\David\Studium\Master\Projektarbeit\UebertragungsfunktionPRegler','png');   % Einlesen der Grafik 
 % Bildgröße bestimmen
 % heightImgPRegler: Höhe der Grafik
 % widthImgPRegler: Breite der Grafik
[heightImgPRegler,widthImgPRegler,dimImgPRegler] = size(handles.grafikUebertragungsfunktionPRegler);

% Subpanel mit der Größe des Bildes des P-Reglers erstellen
handles.subpanelPRegler = uipanel(handles.panelRegler,'BackgroundColor','white','BorderType','none','Units','pixels','Position',[220,35,widthImgPRegler,heightImgPRegler]);
% Axes wird in Subpanel erstellt
handles.axesPRegler = axes(handles.subpanelPRegler,'Units','normalized','Position',[0,0,1,1]);
% Bild wird in Axes angezeigt
image(handles.axesPRegler,handles.grafikUebertragungsfunktionPRegler);
axis off

%% Anzeige Grafik PI-Regler
handles.grafikUebertragungsfunktionPIRegler=imread('C:\Users\David\Studium\Master\Projektarbeit\UebertragungsfunktionPIRegler','png');   % Einlesen der Grafik 
 % Bildgröße bestimmen
 % heightImgPIRegler: Höhe der Grafik
 % widthImgPIRegler: Breite der Grafik
[heightImgPIRegler,widthImgPIRegler,dimImgPIRegler] = size(handles.grafikUebertragungsfunktionPIRegler);

% Subpanel mit der Größe des Bildes des P-Reglers erstellen
handles.subpanelPIRegler = uipanel(handles.panelRegler,'BackgroundColor','white','BorderType','none','Units','pixels','Position',[150,17,widthImgPIRegler,heightImgPIRegler],'Visible','off');
% Axes wird in Subpanel erstellt
handles.axesPIRegler = axes(handles.subpanelPIRegler,'Units','normalized','Position',[0,0,1,1]);
% Bild wird in Axes angezeigt
image(handles.axesPIRegler,handles.grafikUebertragungsfunktionPIRegler);
axis off


%% Axes zur Anzeige Grafik PID-Regler
handles.grafikUebertragungsfunktionPIDRegler=imread('C:\Users\David\Studium\Master\Projektarbeit\UebertragungsfunktionPIDRegler','png');   % Einlesen der Grafik 
 % Bildgröße bestimmen
 % heightImgPIDRegler: Höhe der Grafik
 % widthImgPIDRegler: Breite der Grafik
[heightImgPIDRegler,widthImgPIDRegler,dimImgPIDRegler] = size(handles.grafikUebertragungsfunktionPIDRegler);

% Axes wird in Subpanel erstellt
handles.subpanelPIDRegler = uipanel(handles.panelRegler,'BackgroundColor','white','BorderType','none','Units','pixels','Position',[120,17,widthImgPIDRegler,heightImgPIDRegler],'Visible','off');
% Bild wird in Axes angezeigt
handles.axesPIDRegler = axes(handles.subpanelPIDRegler,'Units','normalized','Position',[0,0,1,1]);
image(handles.axesPIDRegler,handles.grafikUebertragungsfunktionPIDRegler);
axis off

%% Figure zum Plotten der Sprungantwort

% Plot beschriften
axes(handles.axes1);
title('Systemsprungantwort');
xlabel('t in s');
ylabel('y(t)');

% Choose default command line output for gui_Projektarbeit
handles.output = hObject;

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
varargout{1} = handles.output;
end

% --- Executes on selection change in popupmenu_AuswahlStrecke.
function popupmenu_AuswahlStrecke_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_AuswahlStrecke (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_AuswahlStrecke contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_AuswahlStrecke



gui_Strecke(hObject);



guidata(hObject,handles);
end

% --- Executes during object creation, after setting all properties.
function popupmenu_AuswahlStrecke_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_AuswahlStrecke (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in pushbutton_Streckenparameter.
function pushbutton_Streckenparameter_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Streckenparameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Das handle zu diesem pushbutton wird der GUI zur Eingabe der
% Streckenparameter übergeben
gui_Strecke(hObject);
% Die eingegebenen Streckenparameter werden von der gui_Strecke im handle
% "handles" gespeichert und stehen somit in diesem m-File zur Verfügung
end



% --- Executes on selection change in popupmenu_Verfahren.
function popupmenu_Verfahren_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Verfahren (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Verfahren contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Verfahren

% contents enthält Tabelle mit Inhalten des Popup-Menüs
contents = get(hObject,'String');

% get(hObject,'Value') gibt Nummer des ausgewählten Eintrages zurück
% selectedItemVerfahren enthält ausgewähltes Berechnungsverfahren
selectedItemVerfahren = contents{get(hObject,'Value')};

switch selectedItemVerfahren
    % Wenn Ziegler-Nichols als Verfahren gewählt wurde, stehen als Regler
    % P,PI und PID zu Verfügung
    % Default-Einstellung ist P-Regler
    case 'Ziegler-Nichols'
        set(handles.popupmenu_Regler, 'String', {'P-Regler','PI-Regler','PID-Regler'}); % Reglerauswahl geben
        set(handles.popupmenu_Regler, 'Value', 1); % default geben
        
        % Grafik der Übertragungsfunktion des P-Reglers anzeigen
        handles.subpanelPIRegler.Visible = 'off';
        handles.subpanelPRegler.Visible = 'on';
        
    % Wenn CHR als Verfahren gewählt wurde, stehen als Regler
    % P,PI und PID zu Verfügung
    % Default-Einstellung ist P-Regler
    case 'CHR periodischer Regelverlauf'
        set(handles.popupmenu_Regler, 'String', {'P-Regler','PI-Regler','PID-Regler'});
        set(handles.popupmenu_Regler, 'Value', 1);
        
        % Grafik der Übertragungsfunktion des P-Reglers anzeigen
        handles.subpanelPIRegler.Visible = 'off';
        handles.subpanelPRegler.Visible = 'on';

        
    case 'CHR aperiodischer Regelverlauf'
        set(handles.popupmenu_Regler, 'String', {'P-Regler','PI-Regler','PID-Regler'});
        set(handles.popupmenu_Regler, 'Value', 1);
        
        % Grafik der Übertragungsfunktion des P-Reglers anzeigen
       handles.subpanelPIRegler.Visible = 'off';
       handles.subpanelPRegler.Visible = 'on';
        
    % Wenn Kuhn normal oder schnell als Verfahren gewählt wurde, stehen als Regler
    % PI und PID zu Verfügung
    % Default-Einstellung ist PI-Regler
    case 'Kuhn normal'
        set(handles.popupmenu_Regler, 'String', {'PI-Regler','PID-Regler'});
        set(handles.popupmenu_Regler, 'Value', 1);
        
        % Grafik der Übertragungsfunktion des PI-Reglers anzeigen
        handles.subpanelPRegler.Visible = 'off';
        handles.subpanelPIRegler.Visible = 'on';
    case 'Kuhn schnell'
        set(handles.popupmenu_Regler, 'String', {'PI-Regler','PID-Regler'});
        set(handles.popupmenu_Regler, 'Value', 1);
        
        % Grafik der Übertragungsfunktion des PI-Reglers anzeigen
        handles.subpanelPRegler.Visible = 'off';
        handles.subpanelPIRegler.Visible = 'on';
end
        
        
set(handles.popupmenu_Regler,'Enable','on'); 

guidata(hObject,handles);
end

% --- Executes during object creation, after setting all properties.
function popupmenu_Verfahren_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Verfahren (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    
end
end


% --- Executes on selection change in popupmenu_Regler.
function popupmenu_Regler_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Regler (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Regler contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Regler

contents = cellstr(get(hObject,'String'));
selectedController = contents{get(hObject,'Value')};

%% Grafik der Reglerübertragungsfunktion
switch selectedController
    case 'P-Regler' 
     % Grafik der Übertragungsfunktion des P-Reglers anzeigen
    handles.subpanelPIRegler.Visible = 'off';
    handles.subpanelPIDRegler.Visible = 'off';
    handles.subpanelPRegler.Visible = 'on';
    
    % Grafik der Übertragungsfunktion des PI-Reglers anzeigen
    case 'PI-Regler'
    handles.subpanelPIDRegler.Visible = 'off';
    handles.subpanelPRegler.Visible = 'off';
    handles.subpanelPIRegler.Visible = 'on';
   
    % Grafik der Übertragungsfunktion des PID-Reglers anzeigen
    case 'PID-Regler'       
    handles.subpanelPRegler.Visible = 'off';
    handles.subpanelPIRegler.Visible = 'off'; 
    handles.subpanelPIDRegler.Visible = 'on';
end        

end

% --- Executes during object creation, after setting all properties.
function popupmenu_Regler_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Regler (see GCBO)
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

% --- Executes on button press in startbutton.
function startbutton_Callback(hObject, eventdata, handles)
% hObject    handle to startbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

konstanteK = handles.konstanteK;
zeitkonstantenT = handles.zeitkonstantenT;
totzeitTt = handles.totzeitTt;

%% Eingaben auslesen

% Eingegebener Streckentyp auslesen
contentPopupmenuAuswahlStrecke = get(handles.popupmenu_AuswahlStrecke,'String');
selectedItemStrecke = contentPopupmenuAuswahlStrecke{get(handles.popupmenu_AuswahlStrecke,'Value')}

% Eingegebenes Verfahren auslesen
contentPopupmenuVerfahren = get(handles.popupmenu_Verfahren,'String');
selectedItemVerfahren = contentPopupmenuVerfahren{get(handles.popupmenu_Verfahren,'Value')};

% Eingegebener Regler auslesen
contentPopupmenuRegler = get(handles.popupmenu_Regler,'String');
selectedItemController = contentPopupmenuRegler{get(handles.popupmenu_Regler,'Value')};

% Eingebene Simulationszeiten auslesen
simulationStartTime = str2double(get(handles.editSimulationStartTime,'String'));
simulationStopTime = str2double(get(handles.editSimulationStopTime,'String'));

% Art des Plottes auslesen
stateRadiobuttonPlotClosedLoop = get(handles.radiobuttonPlotStepClosedLoop,'Value');

%% Abfrage, ob die Sprungantwort der Strecke oder des geschlossenen geregelten Kreises geplottet werden soll
if(stateRadiobuttonPlotClosedLoop) % Radiobutton im Panel "Plot"
    %% Bestimmung der Reglerparameter Kr,Tn,Tv
    % Bestimmung der Regelparameter KR,Tn,Tv nach dem ausgewählten Verfahren
    % ausgewählter Regler wird als Parameter 'selectedItemController' übergeben
    switch selectedItemVerfahren
        case 'Ziegler-Nichols'
            % Call der Funktion Bestimmung_Wendetangente -> Tu und Ta werden
            % zurückgegeben
            [Tu,Ta] = Bestimmung_Wendetangente_numerisch(konstanteK,zeitkonstantenT,totzeitTt,simulationStopTime);
            [Kr,Tn,Tv] = ziegler_nichols(konstanteK,Ta,Tu,selectedItemController);
        case 'CHR periodischer Regelverlauf'
            % Call der Funktion Bestimmung_Wendetangente -> Tu und Ta werden
            % zurückgegeben
            [Tu,Ta] = Bestimmung_Wendetangente_numerisch(konstanteK,zeitkonstantenT,totzeitTt,simulationStopTime);
            [Kr,Tn,Tv] = CHR_periodisch(konstanteK,Ta,Tu,selectedItemController);
       case 'CHR aperiodischer Regelverlauf'
            % Call der Funktion Bestimmung_Wendetangente -> Tu und Ta werden
            % zurückgegeben
            [Tu,Ta] = Bestimmung_Wendetangente_numerisch(konstanteK,zeitkonstantenT,totzeitTt,simulationStopTime);
            [Kr,Tn,Tv] = CHR_aperiodisch(konstanteK,Ta,Tu,selectedItemController);     

        case 'Kuhn normal'
            [Kr,Tn,Tv] = Kuhn_normal(konstanteK,zeitkonstantenT,selectedItemController);
        case 'Kuhn schnell'
            [Kr,Tn,Tv] = Kuhn_schnell(konstanteK,zeitkonstantenT,selectedItemController);
    end


    % Ausgabe der berechneten Reglerparameter P,I,D
    set(handles.TextCalculatedP, 'String',['K = ' num2str(Kr)]);
    set(handles.TextCalculatedI, 'String',['Tn = ' num2str(Tn)]);
    set(handles.TextCalculatedD, 'String',['Tv = ' num2str(Tv)]);

    %% Bestimmung der Übertragungsfunktion Gr des Reglers
    Gr = transferFcnController(Kr,Tn,Tv);



    %% Bestimmung der Übertragungsfunktion Gs der Strecke
    Gs = transferFcnControlledSystem(konstanteK,zeitkonstantenT,totzeitTt,selectedItemStrecke);

    %% Bestimmung der Übertragungsfunktion des geschlossenen Regelkreises
    Gtot = Gr*Gs/(1+Gr*Gs);

else
    %% Sprungantwort der Strecke soll geplottet werden
    % Bestimmung der Übertragungsfunktion Gs der Strecke
    Gs = transferFcnControlledSystem(konstanteK,zeitkonstantenT,totzeitTt,selectedItemStrecke);
    % Gesamtübertragungsfunktion Gtot wird geplottet, Gs wird Gtot
    % zugewiesenen
    Gtot = Gs;


end


    
    
%% Erstellung des Plots 

% Abrage, wie oft der Start-Button gedrückt wurde, um Anzahl an Plots in
% der figure bestimmen zu können-> nötig für 'legend'
if(isfield(handles,'AnzahlStartButtonPushed')) 
    handles.AnzahlStartButtonPushed = handles.AnzahlStartButtonPushed + 1;
else 
    handles.AnzahlStartButtonPushed = 1;
end 


% Plot der Sprungantwort in Axes1
axes(handles.axes1);
%systemLegend = ['System' num2str(handles.AnzahlStartButtonPushed)];


%systemlegend = ['System1'; 'System2'];
hold all;
simulationTime = simulationStartTime : 0.01 : simulationStopTime;
% [y,t] = step(transferFunctionSystemTotal(konstanteK,zeitkonstanteT1,zeitkonstanteT2,Kr,Tn,Tv,totzeitTt),simulationTime);
[y,t] = step(Gtot,simulationTime);
plot(t,y, 'DisplayName', ['System ' num2str(handles.AnzahlStartButtonPushed)]);

legend('-DynamicLegend'); % undokumentierte Matlab-Funktion-> erstellt Legende dynamisch in Abhängigkeit von Anzahl Plots


% systemlegend = [];
% for i= 1:handles.AnzahlStartButtonPushed
%     legendNumber(i,1) = i;
% end


% legend(num2str(systemlegend));


guidata(hObject,handles)
end





