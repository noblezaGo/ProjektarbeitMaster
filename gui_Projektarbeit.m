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

% Last Modified by GUIDE v2.5 17-Nov-2016 17:08:54

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

set(handles.popupmenu_Regler,'Enable','off'); 
% Streckenübertragungsfunktion anzeigen
axes(handles.axes2);
grafikUebertragungsfunktionStrecke=imread('C:\Users\David\Studium\Master\Projektarbeit\UebertragungsfunktionStreckeTForm','png');   % Einlesen der Grafik 
image (grafikUebertragungsfunktionStrecke);        % Grafik ausgeben
axis off 

axes(handles.axes3);
grafikUebertragungsfunktionRegler=imread('C:\Users\David\Studium\Master\Projektarbeit\UebertragungsfunktionPRegler','png');   % Einlesen der Grafik 
image(grafikUebertragungsfunktionRegler);
axis off

% Plot beschriften
axes(handles.axes1);
title('Systemsprungantwort');
xlabel('t in s');
ylabel('y(t)');

% Einträge Popupmenü-Verfahren setzen
% set(handles.popupmenu_Verfahren, 'String', 'ziegler')



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
        axes(handles.axes3);
        grafikUebertragungsfunktionRegler=imread('C:\Users\David\Studium\Master\Projektarbeit\UebertragungsfunktionPRegler','png');   % Einlesen der Grafik
        image(grafikUebertragungsfunktionRegler);
        axis off
    % Wenn CHR als Verfahren gewählt wurde, stehen als Regler
    % P,PI und PID zu Verfügung
    % Default-Einstellung ist P-Regler
    case 'CHR'
        set(handles.popupmenu_Regler, 'String', {'P-Regler','PI-Regler','PID-Regler'});
        set(handles.popupmenu_Regler, 'Value', 1);
        
        % Grafik der Übertragungsfunktion des P-Reglers anzeigen
        axes(handles.axes3);
        grafikUebertragungsfunktionRegler=imread('C:\Users\David\Studium\Master\Projektarbeit\UebertragungsfunktionPRegler','png');   % Einlesen der Grafik
        image(grafikUebertragungsfunktionRegler);
        axis off
        
    % Wenn Kuhn normal oder schnell als Verfahren gewählt wurde, stehen als Regler
    % PI und PID zu Verfügung
    % Default-Einstellung ist PI-Regler
    case 'Kuhn normal'
        set(handles.popupmenu_Regler, 'String', {'PI-Regler','PID-Regler'});
        set(handles.popupmenu_Regler, 'Value', 1);
        
        % Grafik der Übertragungsfunktion des PI-Reglers anzeigen
        axes(handles.axes3);
        grafikUebertragungsfunktionRegler=imread('C:\Users\David\Studium\Master\Projektarbeit\UebertragungsfunktionPIRegler','png');   % Einlesen der Grafik
        image(grafikUebertragungsfunktionRegler);
        axis off
    case 'Kuhn schnell'
        set(handles.popupmenu_Regler, 'String', {'PI-Regler','PID-Regler'});
        set(handles.popupmenu_Regler, 'Value', 1);
        
        % Grafik der Übertragungsfunktion des PI-Reglers anzeigen
        axes(handles.axes3);
        grafikUebertragungsfunktionRegler=imread('C:\Users\David\Studium\Master\Projektarbeit\UebertragungsfunktionPIRegler','png');   % Einlesen der Grafik
        image(grafikUebertragungsfunktionRegler);
        axis off
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

axes(handles.axes3);

switch selectedController
    case 'P-Regler'        
    grafikUebertragungsfunktionRegler=imread('C:\Users\David\Studium\Master\Projektarbeit\UebertragungsfunktionPRegler','png');   % Einlesen der Grafik 

    case 'PI-Regler'
    grafikUebertragungsfunktionRegler=imread('C:\Users\David\Studium\Master\Projektarbeit\UebertragungsfunktionPIRegler','png');   % Einlesen der Grafik 
    
    case 'PID-Regler'
    grafikUebertragungsfunktionRegler=imread('C:\Users\David\Studium\Master\Projektarbeit\UebertragungsfunktionPIDRegler','png');   % Einlesen der Grafik 
end
    image (grafikUebertragungsfunktionRegler);      
axis off 

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


function editKonstanteK_Callback(hObject, eventdata, handles)
% hObject    handle to editKonstanteK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editKonstanteK as text
%        str2double(get(hObject,'String')) returns contents of editKonstanteK as a double

% TO DO
% Error Handling 
% nur Nummern dürfen eingegeben werden

% guidata updaten
guidata(hObject,handles);
end

% --- Executes during object creation, after setting all properties.
function editKonstanteK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editKonstanteK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function editZeitkonstanteT1_Callback(hObject, eventdata, handles)
% hObject    handle to editZeitkonstanteT1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editZeitkonstanteT1 as text
%        str2double(get(hObject,'String')) returns contents of editZeitkonstanteT1 as a double


% TO DO 
% ERROR HANDLING nur Nummern fürfen eingegeben werden

% guidata updaten
guidata(hObject,handles);
end

% --- Executes during object creation, after setting all properties.
function editZeitkonstanteT1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editZeitkonstanteT1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function editZeitkonstanteT2_Callback(hObject, eventdata, handles)
% hObject    handle to editZeitkonstanteT2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editZeitkonstanteT2 as text
%        str2double(get(hObject,'String')) returns contents of editZeitkonstanteT2 as a double
end

% --- Executes during object creation, after setting all properties.
function editZeitkonstanteT2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editZeitkonstanteT2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function editTransportDelay_Callback(hObject, eventdata, handles)
% hObject    handle to editTransportDelay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTransportDelay as text
%        str2double(get(hObject,'String')) returns contents of editTransportDelay as a double

% guidata updaten
guidata(hObject,handles);
end

% --- Executes during object creation, after setting all properties.
function editTransportDelay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTransportDelay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
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

%% Eingaben auslesen

% Eingegebene Streckenparameter auslesen
konstanteK = str2double(get(handles.editKonstanteK,'String'));
zeitkonstanteT1 = str2double(get(handles.editZeitkonstanteT1,'String'));
zeitkonstanteT2 = str2double(get(handles.editZeitkonstanteT2,'String'));
totzeitTt = str2double(get(handles.editTransportDelay,'String'));

% Eingegebenes Verfahren auslesen
contentPopupmenuVerfahren = get(handles.popupmenu_Verfahren,'String');
selectedItemVerfahren = contentPopupmenuVerfahren{get(handles.popupmenu_Verfahren,'Value')};

% Eingegebener Regler auslesen
contentPopupmenuRegler = get(handles.popupmenu_Regler,'String');
selectedItemController = contentPopupmenuRegler{get(handles.popupmenu_Regler,'Value')};

% Eingebene Simulationszeiten auslesen
simulationStartTime = str2double(get(handles.editSimulationStartTime,'String'));
simulationStopTime = str2double(get(handles.editSimulationStopTime,'String'));

%% Bestimmung der Reglerparameter Kr,Tn,Tv


% Bestimmung der Regelparameter KR,Tn,Tv nach dem ausgewählten Verfahren
% ausgewählter Regler wird als Parameter 'selectedItemController' übergeben
switch selectedItemVerfahren
    case 'Ziegler-Nichols'
        % Call der Funktion Bestimmung_Wendetangente -> Tu und Ta werden
        % zurückgegeben
        [Tu,Ta] = Bestimmung_Wendetangente_numerisch(konstanteK,zeitkonstanteT1,zeitkonstanteT2,simulationStopTime);
        [Kr,Tn,Tv] = ziegler_nichols(konstanteK,Ta,Tu,selectedItemController);
    case 'CHR'
        % Call der Funktion Bestimmung_Wendetangente -> Tu und Ta werden
        % zurückgegeben
        [Tu,Ta] = Bestimmung_Wendetangente_numerisch(konstanteK,zeitkonstanteT1,zeitkonstanteT2,simulationStopTime);
        [Kr,Tn,Tv] = CHR(konstanteK,Ta,Tu,selectedItemController);
    case 'Kuhn normal'
        [Kr,Tn,Tv] = Kuhn_normal(konstanteK,zeitkonstanteT1,zeitkonstanteT2,selectedItemController);
    case 'Kuhn schnell'
        [Kr,Tn,Tv] = Kuhn_schnell(konstanteK,zeitkonstanteT1,zeitkonstanteT2,selectedItemController);
end


% Ausgabe der berechneten Reglerparameter P,I,D
set(handles.TextCalculatedP, 'String',['K = ' num2str(Kr)]);
set(handles.TextCalculatedI, 'String',['Tn = ' num2str(Tn)]);
set(handles.TextCalculatedD, 'String',['Tv = ' num2str(Tv)]);

% Abrage, wie oft der Start-Button gedrückt wurde, um Anzahl an Plots in
% der figure bestimmen zu können-> nötig für 'legend'
if(isfield(handles,'AnzahlStartButtonPushed')) 
    handles.AnzahlStartButtonPushed = handles.AnzahlStartButtonPushed + 1;
else 
    handles.AnzahlStartButtonPushed = 1;
end 
guidata(hObject,handles)

% Plot der Sprungantwort in Axes1
axes(handles.axes1);
%systemLegend = ['System' num2str(handles.AnzahlStartButtonPushed)];


%systemlegend = ['System1'; 'System2'];
hold all;
simulationTime = simulationStartTime : 0.01 : simulationStopTime;
[y,t] = step(transferFunctionSystemTotal(konstanteK,zeitkonstanteT1,zeitkonstanteT2,Kr,Tn,Tv,totzeitTt),simulationTime);
plot(t,y, 'DisplayName', ['System ' num2str(handles.AnzahlStartButtonPushed)]);

legend('-DynamicLegend'); % undokumentierte Matlab-Funktion-> erstellt Legende dynamisch in Abhängigkeit von Anzahl Plots


% systemlegend = [];
% for i= 1:handles.AnzahlStartButtonPushed
%     legendNumber(i,1) = i;
% end


% legend(num2str(systemlegend));



end












