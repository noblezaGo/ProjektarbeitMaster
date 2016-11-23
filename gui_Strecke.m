% Rückgabewert soll Gs sein
% Inputargument soll Streckentyp sein
function gui_Strecke


fig = figure('position',[0 500 400 200],'MenuBar','none','Name','Streckenparameter','NumberTitle','off','OuterPosition',[230 150 570 400]);


% Popupmenü Anzahl Zeitkonstanten
handles.textPopupmenuAnzahlT = uicontrol('style','text','position',[20 300 150 20],'FontSize',10,'String','Anzahl Zeitkonstanten T:');
handles.popupmenuAnzahlT = uicontrol('style','popupmenu','position',[200 300 100 20],'String',{'1' '2' '3'},'Callback',@popupmenu_AnzT_Callback);

% Eingabe K
handles.textK = uicontrol('style','text','position',[50 250 50 20],'FontSize',10,'String','K =');
handles.editK = uicontrol('style','edit','position',[200 250 100 20]);


% Eingabe Tt
handles.textTt = uicontrol('style','text','position',[50 200 50 20],'FontSize',10,'String','Tt =');
handles.editTt = uicontrol('style','edit','position',[200 200 100 20]);

% Eingabe Zeitkonstante T1
handles.textT1 = uicontrol('style','text','position',[50 150 50 20],'Visible','on','FontSize',10,'String','T1 =');
handles.editT1 = uicontrol('style','edit','position',[200 150 100 20],'Visible','on');

% Eingabe Zeitkonstante T2, wird unsichtbar erstellt
handles.textT2 = uicontrol('style','text','position',[50 100 50 20],'Visible','off','FontSize',10,'String','T2 =');
%hg = get(textT2);
handles.editT2 = uicontrol('style','edit','position',[200 100 100 20],'Visible','off');

% Eingabe Zeitonstante T3, wird unsichtbar erstellt
handles.textT3 = uicontrol('style','text','position',[50 50 50 20],'Visible','off','FontSize',10,'String','T3 =');
handles.editT3 = uicontrol('style','edit','position',[200 50 100 20],'Visible','off');

% Button "Übernehmen"
handles.buttonApply = uicontrol('style','pushbutton','position',[350 150 100 30],'String','Übernehmen','Callback',@pushbutton_Apply_Callback);


guidata(fig,handles);

end

% set(h.buttonOne,'callback',{@addButton,h})



% Callback Popupmenü
function popupmenu_AnzT_Callback(hObject,eventdata)

% guidata erwartet als Input eine figure (in diesem Fall 'fig'), oder wenn
% das übergebene Objekt keine figure ist nimmt es die parent figure des
% übergebenen Objekts
% hier: hObject ist das uicontrol popumpmenu -> keine figure
% die parent figure des uicontrol popupmenu ist 'fig'
% andere Möglichkeit: handles.fig = figure(...) in Funktion gui_Strecke
% definieren und dann hier handles = guidata(handles.fig);
handles = guidata(hObject);
anzahlT = num2str(get(hObject,'Value'));
  


switch anzahlT
    case '1'
        % T2 und T3 ausblenden
        % sind default ausgeblendet, aber wenn erst '2' ausgewählt wurde im
        % Popupmenü und dann '1' muss wieder ausgeblendet werden
        handles.textT2.Visible = 'off';
        handles.editT2.Visible = 'off';
        
        handles.textT3.Visible = 'off';
        handles.editT3.Visible = 'off';
        
    case '2'        
        % T3 ausblenden, T2 einblenden
        handles.textT3.Visible = 'off';
        handles.editT3.Visible = 'off';
        
        handles.textT2.Visible = 'on';
        handles.editT2.Visible = 'on';
       
        
    case '3'
        % T2 und T3 einblenden
        handles.textT2.Visible = 'on';
        handles.editT2.Visible = 'on';
        
        handles.textT3.Visible = 'on';
        handles.editT3.Visible = 'on';
         
end

guidata(hObject,handles);
end

% Callback Pushbutton
function pushbutton_Apply_Callback(hObject,eventdata)

handles = guidata(hObject);

% Einlesen der Werte für K,Tt und Tn
konstanteK = str2double(get(handles.editK,'String'));
totzeitTt = str2double(get(handles.editTt,'String'));

anzahlZeitkonstanten = get(handles.popupmenuAnzahlT,'Value');

T1 = str2double(get(handles.editT1,'String'));
T2 = str2double(get(handles.editT2,'String'));
T3 = str2double(get(handles.editT3,'String'));

% Array aus den Zeitkonstanten 
zeitkonstantenT = [T1 T2 T3];

% Berechnen der Streckenübertragungsfunktionen für PTn, ITn, DTn Strecken

end
