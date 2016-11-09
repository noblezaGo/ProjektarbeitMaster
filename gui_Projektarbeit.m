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

% Last Modified by GUIDE v2.5 08-Nov-2016 15:08:13

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

axes(handles.axes2);
G1=imread('C:\Users\David\Studium\Master\Projektarbeit\UebertragungsfunktionStreckeTForm','png');   % Einlesen der Grafik 
image (G1);        % Grafik ausgeben
axis off 

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

handles.selectedItemVerfahren = selectedItemVerfahren;
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

% contents enthält Tabelle mit Inhalten des Popup-Menüs
contents = get(hObject,'String');

% get(hObject,'Value') gibt Nummer des ausgewählten Eintrages zurück
% selectedItemController enthält ausgewähltes Berechnungsverfahren
selectedItemController = contents{get(hObject,'Value')};

handles.selectedItemController = selectedItemController;


% TO DO
% Blockschaltbild des ausgewählten Reglers einfügen
guidata(hObject,handles);

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


function edit_konstanteK_Callback(hObject, eventdata, handles)
% hObject    handle to edit_konstanteK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_konstanteK as text
%        str2double(get(hObject,'String')) returns contents of edit_konstanteK as a double
% K wird eingelesen
konstanteK = str2double(get(hObject,'String'));
handles.konstanteK = konstanteK;

% TO DO
% Error Handling 
% nur Nummern dürfen eingegeben werden

% guidata updaten
guidata(hObject,handles);
end

% --- Executes during object creation, after setting all properties.
function edit_konstanteK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_konstanteK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_zeitkonstanteT1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_zeitkonstanteT1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_zeitkonstanteT1 as text
%        str2double(get(hObject,'String')) returns contents of edit_zeitkonstanteT1 as a double

% T1 einlesen
zeitkonstanteT1 = str2double(get(hObject,'String'));
handles.zeitkonstanteT1 = zeitkonstanteT1;

% TO DO 
% ERROR HANDLING nur Nummern fürfen eingegeben werden

% guidata updaten
guidata(hObject,handles);
end

% --- Executes during object creation, after setting all properties.
function edit_zeitkonstanteT1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_zeitkonstanteT1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_ZeitkonstanteT2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ZeitkonstanteT2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ZeitkonstanteT2 as text
%        str2double(get(hObject,'String')) returns contents of edit_ZeitkonstanteT2 as a double

% T2 einlesen
zeitkonstanteT2 = str2double(get(hObject,'String'));
handles.zeitkonstanteT2 = zeitkonstanteT2;

% TO DO 
% ERROR HANDLING nur Nummern fürfen eingegeben werden

% guidata updaten
guidata(hObject,handles);
end

% --- Executes during object creation, after setting all properties.
function edit_ZeitkonstanteT2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ZeitkonstanteT2 (see GCBO)
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

cla(handles.axes1);
end


function EditSimulationStartTime_Callback(hObject, eventdata, handles)
% hObject    handle to EditSimulationStartTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditSimulationStartTime as text
%        str2double(get(hObject,'String')) returns contents of EditSimulationStartTime as a double
startTime = str2double(get(hObject,'String'));
handles.startTime = startTime;

guidata(hObject,handles);
end

% --- Executes during object creation, after setting all properties.
function EditSimulationStartTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditSimulationStartTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function EditSimulationStopTime_Callback(hObject, eventdata, handles)
% hObject    handle to EditSimulationStopTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditSimulationStopTime as text
%        str2double(get(hObject,'String')) returns contents of EditSimulationStopTime as a double

stopTime = str2double(get(hObject,'String'));
handles.stopTime = stopTime;

guidata(hObject,handles);
end

% --- Executes during object creation, after setting all properties.
function EditSimulationStopTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditSimulationStopTime (see GCBO)
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

% Zuweisung der Parameter aus der struct handles
konstanteK = handles.konstanteK;
zeitkonstanteT1 = handles.zeitkonstanteT1;
zeitkonstanteT2 = handles.zeitkonstanteT2;

% Call der Funktion Bestimmung_Wendetangente
[Tu,Ta] = Bestimmung_Wendetangente(konstanteK,zeitkonstanteT1,zeitkonstanteT2);


% isfield frägt ob die gegebene Variable in der struct handle existiert:
% Wenn nicht in Popup-Menü des Verfahrens und des Reglers geklickt wurde,
% bevor der Startknopf gedrückt wird, ist selectedItemVerfahren und
% selectedItemController nicht existent. Sie wurden im Callback nicht erstellt
% -> Variablen müssen hier erstellt werden 

if(isfield(handles,'selectedItemVerfahren'))    
    selectedItemVerfahren = handles.selectedItemVerfahren;
else
    selectedItemVerfahren = 'Ziegler-Nichols';
end

if(isfield(handles,'selectedItemController'))
    selectedItemController = handles.selectedItemController;
else 
    selectedItemController = 'P-Regler';
end


% Bestimmung der Regelparameter KR,Tn,Tv nach dem ausgewählten Verfahren
% ausgewählter Regler wird als Parameter 'selectedItemController' übergeben
switch selectedItemVerfahren
    case 'Ziegler-Nichols'
        [KR,Tn,Tv] = ziegler_nichols(konstanteK,Ta,Tu,selectedItemController);
    case 'CHR'
        [KR,Tn,Tv] = CHR(konstanteK,Ta,Tu,selectedItemController);
end

% Regler
% P,I,D stehen als Parameter im Simulink Block 'PID-Regler'
Pparam= KR;

% Fallunterscheidung ob Tn==0, denn Tn steht im Nenner bei Berechnung von I
if(Tn==0)   
    Iparam = 0;
else
    Iparam = 1/Tn;
end
Dparam = Tv;

% Zähler ÜF der Regelstrecke
GsNumerator = [konstanteK];
% Nenner ÜF der Regelstrecke
GsDenominator = [zeitkonstanteT1*zeitkonstanteT2 zeitkonstanteT1+zeitkonstanteT2 1];

% Variablen, die Simulink benötigt, in base workspace schreiben
assignin('base','P',Pparam); % P-Parameter des Reglers
assignin('base','I',Iparam); % I-Parameter des Reglers
assignin('base','D',Dparam); % D-Parameter des Reglers
assignin('base','GsNum',GsNumerator); % Zähler ÜF Regelstrecke
assignin('base','GsDenom',GsDenominator); % Nenner ÜF Regelstrecke

% Simulink Projekt 'pidProj' öffnen
pidProj

% Start- und Stoppzeit Parameter der Simulation setzen
% Default-Werte setzen: startTime = 0; stopTime = 30; -> diese Werte
% gelten, wenn nichts selbst eingetragen wird
if(isfield(handles,'startTime'))
    startTime = handles.startTime;
else startTime = 0;
end

if(isfield(handles,'stopTime'))
    stopTime = handles.stopTime;
else stopTime = 30;
end
    
set_param('pidProj', 'StartTime', num2str(startTime));
set_param('pidProj', 'StopTime', num2str(stopTime));

% Simulink Simulation starten
sim('pidProj');





% Ausgabe der berechneten Reglerparameter P,I,D
set(handles.TextCalculatedP, 'String',['P = ' num2str(Pparam)]);
set(handles.TextCalculatedI, 'String',['I = ' num2str(Iparam)]);
set(handles.TextCalculatedD, 'String',['D = ' num2str(Dparam)]);

% Abrage, wie oft der Start-Button gedrückt wurde, um Anzahl an Plots in
% der figure bestimmen zu können-> nötig für 'legend'
if(isfield(handles,'Anzahl')) 
    handles.Anzahl = handles.Anzahl + 1;
else 
    handles.Anzahl = 1;
end 
guidata(hObject,handles)

% Plot der Sprungantwort in Axes1
axes(handles.axes1);
%systemLegend = ['System' num2str(handles.Anzahl)];


%systemlegend = ['System1'; 'System2'];
plot(step_response.Time,step_response.Data);
hold on;
%plot(step_response.Time,step_response.Time.^2);

systemlegend = zeros(handles.Anzahl,1);
for i= 1:handles.Anzahl
    anzLegend = num2str(handles.Anzahl);
    systemlegend(i) = char(anzLegend);
end
legend(systemlegend);

%asdasd

end