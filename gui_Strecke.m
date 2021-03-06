% Diese GUI figure wird benutzt zur Einlesung der Streckenparameter

% hObjectMain ist handle von popupmenuStrecke oder pushbutton_Streckenparameter, von dort
% wird gui_Strecke gecallt
% parent von hObjectMain ist figure von gui_Projektarbeit

function gui_Strecke(hObjectMain)



% GUI-figure zur Eingabe der Streckenparameter
handles.figStreckenparameter = figure('WindowStyle','modal','position',[0 700 500 600],'MenuBar','none','Name','Streckenparameter','NumberTitle','off','OuterPosition',[230 150 650 400],'color','white','CloseRequestFcn',@gui_Strecke_closeRequestFcn);


handles.hObjectMain = hObjectMain;
handlesMain = guidata(handles.hObjectMain);

% Ausgew�hlten Streckentyp auslesen
contentPopupmenuStrecke = get(handlesMain.popupmenuStrecke,'String');
handles.selectedControlledSystem = contentPopupmenuStrecke{get(handlesMain.popupmenuStrecke,'Value')};

% Grafiken anzeigen zu dem gew�hlten Streckentyp
switch handles.selectedControlledSystem
    case 'PTn-Strecke'
        grafikUebertragungsfunktionStrecke=imread('UebertragungsfunktionPTnStrecke','png'); 
        %grafikUebertragungsfunktionStrecke=imread('C:\Users\David\Studium\Master\Projektarbeit\UebertragungsfunktionPTnStrecke','png');   % Einlesen der Grafik
         % Gr��e der Grafik bestimmen
         % hightImgStrecke: H�he der Grafik
         % widthImgStrecke: Breite der Grafik
        [hightImgStrecke, widthImgStrecke, dimImgStrecke] = size(grafikUebertragungsfunktionStrecke) ;
        % figure zur Anzeige der Formel der �bertragungsfunktion der Strecke
        handles.ax1 = axes('Units','pixels','Position',[250,200,widthImgStrecke,hightImgStrecke]);
        image(grafikUebertragungsfunktionStrecke);        % Grafik ausgeben
        axis off
        
    case 'ITn-Strecke'
        
        grafikUebertragungsfunktionStrecke=imread('UebertragungsfunktionITnStrecke','png');   % Einlesen der Grafik
         % Gr��e der Grafik bestimmen
         % hightImgStrecke: H�he der Grafik
         % widthImgStrecke: Breite der Grafik
        [hightImgStrecke, widthImgStrecke, dimImgStrecke] = size(grafikUebertragungsfunktionStrecke) ;
        % figure zur Anzeige der Formel der �bertragungsfunktion der Strecke
        handles.ax1 = axes('Units','pixels','Position',[250,200,widthImgStrecke,hightImgStrecke]);
        image(grafikUebertragungsfunktionStrecke);        % Grafik ausgeben
        axis off
        
    case 'DTn-Strecke'
        grafikUebertragungsfunktionStrecke=imread('UebertragungsfunktionDTnStrecke','png');   % Einlesen der Grafik
         % Gr��e der Grafik bestimmen
         % hightImgStrecke: H�he der Grafik
         % widthImgStrecke: Breite der Grafik
        [hightImgStrecke, widthImgStrecke, dimImgStrecke] = size(grafikUebertragungsfunktionStrecke) ;
        % figure zur Anzeige der Formel der �bertragungsfunktion der Strecke
        handles.ax1 = axes('Units','pixels','Position',[250,200,widthImgStrecke,hightImgStrecke]);
        image(grafikUebertragungsfunktionStrecke);        % Grafik ausgeben
        axis off
        
end




%% Erstellung der Eingabe- und Textfelder
% Popupmen� Anzahl Zeitkonstanten
handles.textPopupmenuAnzahlT = uicontrol('style','text','position',[50 300 50 20],'FontSize',10,'BackgroundColor','white','String','n =');

% Unterscheidung ob PTn,ITn oder DTn-Strecke
% PTn oder ITn Strecke kann 0,1,2,3 Zeitkonstanten besitzen
% DTn kann 1,2,3 Zeitkonstanten besitzen
if(strcmp(handles.selectedControlledSystem,'PTn-Strecke') || strcmp(handles.selectedControlledSystem,'ITn-Strecke'))
    handles.popupmenuAnzahlT = uicontrol('style','popupmenu','position',[100 300 100 20],'String',{'0' '1' '2' '3'},'Callback',@popupmenu_AnzT_Callback);
    
    % Eingabe Zeitkonstante T1, wird unsichtbar erstellt
    handles.textT1 = uicontrol('style','text','position',[50 180 50 20],'Visible','off','FontSize',10,'BackgroundColor','white','String','T1 =');
    handles.editT1 = uicontrol('style','edit','position',[100 180 100 20],'Visible','off');

 % DTn Strecke muss mind. 1 Zeitkonstante besitzen
elseif(strcmp(handles.selectedControlledSystem,'DTn-Strecke'))
    handles.popupmenuAnzahlT = uicontrol('style','popupmenu','position',[100 300 100 20],'String',{'1' '2' '3'},'Callback',@popupmenu_AnzT_Callback);
    
     % Eingabe Zeitkonstante T1, wird sichtbar erstellt
    handles.textT1 = uicontrol('style','text','position',[50 180 50 20],'Visible','on','FontSize',10,'BackgroundColor','white','String','T1 =');
    handles.editT1 = uicontrol('style','edit','position',[100 180 100 20],'Visible','on');
end

% Eingabe K
handles.textK = uicontrol('style','text','position',[50 260 50 20],'FontSize',10,'BackgroundColor','white','String','Ks =');
handles.editK = uicontrol('style','edit','position',[100 260 100 20]);

% Eingabe Tt
handles.textTt = uicontrol('style','text','position',[50 220 50 20],'FontSize',10,'BackgroundColor','white','String','Tt =');
handles.editTt = uicontrol('style','edit','position',[100 220 100 20]);


% Eingabe Zeitkonstante T2, wird unsichtbar erstellt
handles.textT2 = uicontrol('style','text','position',[50 140 50 20],'Visible','off','FontSize',10,'BackgroundColor','white','String','T2 =');
%hg = get(textT2);
handles.editT2 = uicontrol('style','edit','position',[100 140 100 20],'Visible','off');

% Eingabe Zeitonstante T3, wird unsichtbar erstellt
handles.textT3 = uicontrol('style','text','position',[50 100 50 20],'Visible','off','BackgroundColor','white','FontSize',10,'String','T3 =');
handles.editT3 = uicontrol('style','edit','position',[100 100 100 20],'Visible','off');

% Button "�bernehmen"
handles.buttonApply = uicontrol('style','pushbutton','position',[275 50 100 30],'String','�bernehmen','Callback',@pushbutton_Apply_Callback);


% handles Struktur dieser Funktion wird zu handles.figStreckenparameter hinzugef�gt. Die 
% figure "figStreckenparameter" (GUI-Fenster f�r Streckenparameter) enth�lt nun die handles Struktur
guidata(handles.figStreckenparameter,handles);


end




% Callback Popupmen�
function popupmenu_AnzT_Callback(hObject,eventdata)

% guidata erwartet als Input eine figure (in diesem Fall 'fig'), oder wenn
% das �bergebene Objekt keine figure ist nimmt es die parent figure des
% �bergebenen Objekts
% hier: hObject ist das uicontrol popumpmenu -> keine figure
% die parent figure des uicontrol popupmenu ist 'fig'
% andere M�glichkeit: handles.fig = figure(...) in Funktion gui_Strecke
% definieren und dann hier handles = guidata(handles.fig);
handles = guidata(hObject);
content = get(hObject,'String');
anzahlT = content{get(hObject,'Value')};
  

%% Abh�ngig von eingestellter Anzahl an Zeitkonstanten im Popupmen� werden die Eingabefelder der Zeitkonstanten ein- oder ausgeblendet
switch anzahlT
    case '0'
        % T1,T2 und T3 ausblenden
        handles.textT1.Visible = 'off';
        handles.editT1.Visible = 'off';
        handles.editT1.String = {''};   % Text in Eingabefeld wird gel�scht
        
        handles.textT2.Visible = 'off';
        handles.editT2.Visible = 'off';
        handles.editT2.String = {''};
        
        handles.textT3.Visible = 'off';
        handles.editT3.Visible = 'off';
        handles.editT3.String = {''};
        
    case '1'
        % T2 und T3 ausblenden
        % -> sind default ausgeblendet, aber wenn erst '2' ausgew�hlt wurde im
        % Popupmen� und dann '1' muss wieder ausgeblendet werden
        handles.textT2.Visible = 'off';
        handles.editT2.Visible = 'off';
        handles.editT2.String = {''};
        
        handles.textT3.Visible = 'off';
        handles.editT3.Visible = 'off';
        handles.editT3.String = {''};
        
        handles.textT1.Visible = 'on';
        handles.editT1.Visible = 'on';
        
    case '2'        
        % T3 ausblenden, T2 einblenden
        handles.textT3.Visible = 'off';
        handles.editT3.Visible = 'off';
        handles.editT3.String = {''};
        
        handles.textT1.Visible = 'on';
        handles.editT1.Visible = 'on';
        
        handles.textT2.Visible = 'on';
        handles.editT2.Visible = 'on';
       
        
    case '3'
        % T1, T2 und T3 einblenden
        handles.textT1.Visible = 'on';
        handles.editT1.Visible = 'on';
        
        handles.textT2.Visible = 'on';
        handles.editT2.Visible = 'on';
        
        handles.textT3.Visible = 'on';
        handles.editT3.Visible = 'on';
         
end

guidata(hObject,handles);
end

% Callback Pushbutton "�bernehmen"
function pushbutton_Apply_Callback(hObject,eventdata)

% Handles der figure gui_Strecke
handles = guidata(hObject);

% Handles der figure gui_Projektarbeit
handlesMain = guidata(handles.hObjectMain);

%% Einlesen der Werte f�r Konstante K,Totzeit Tt und der Zeitkonstanten

% Konstante K einlesen
konstK = str2double(get(handles.editK,'String'));
if(isnan(konstK)==0 && konstK>0)
    handlesMain.konstanteK = konstK;
else 
    errordlg('Ung�ltiger Eingabewert f�r K. G�ltige Eingabewerte sind positive Zahlen. Null ist unzul�ssig.');
    return
end

% Totzeit Tt einlesen
Tt = str2double(get(handles.editTt,'String'));
if(isnan(Tt)==0 && Tt>=0)
    handlesMain.totzeitTt = Tt;
else
    errordlg('Ung�ltiger Eingabewert f�r Tt. G�ltige Eingabewerte sind positive Zahlen einschlie�lich Null');
    return
end
    

% Zeitkonstanten einlesen
handlesMain.zeitkonstantenT = []; 
content = get(handles.popupmenuAnzahlT,'String');
anzahlT = content{get(handles.popupmenuAnzahlT,'Value')};
    
    switch anzahlT
        case '0'
            handlesMain.zeitkonstantenT = [];        
        case '1'
            T1 = str2double(get(handles.editT1,'String'));
            % T1 ist eine Zahl und gr��er als Null
            if(isnan(T1)==0 && T1>0)
                handlesMain.zeitkonstantenT(1) = T1;
            else 
                % Fehlerdialogbox wird bei unzul�ssigem Eingabewert angezeigt.
                % Return unterbricht die Callback Funktion. Der Benutzer hat
                % die M�glichkeit neu einzugeben.
                errordlg('Ung�ltiger Eingabewert f�r T1. G�ltige Eingabewerte sind positive Flie�kommazahlen. Null ist unzul�ssig.');
                return
            end

        case '2'
            T1 = str2double(get(handles.editT1,'String'));
            T2 = str2double(get(handles.editT2,'String'));
            if(isnan(T1)==0 && T1>0 && isnan(T2)==0 && T2>0)
                handlesMain.zeitkonstantenT(1) = T1;
                handlesMain.zeitkonstantenT(2) = T2;
            else
                errordlg('Ung�ltiger Eingabewert f�r T1 oder T2. G�ltige Eingabewerte sind positive Zahlen. Null ist unzul�ssig.');
                return
            end

        case '3'
            T1 = str2double(get(handles.editT1,'String'));
            T2 = str2double(get(handles.editT2,'String'));
            T3 = str2double(get(handles.editT3,'String'));
            if(isnan(T1)==0 && T1>0 && isnan(T2)==0 && T2>0 && isnan(T3)==0 && T3>0)
                handlesMain.zeitkonstantenT(1) = T1;
                handlesMain.zeitkonstantenT(2) = T2;
                handlesMain.zeitkonstantenT(3) = T3;
            else
                errordlg('Ung�ltiger Eingabewert f�r T1, T2 oder T3. G�ltige Eingabewerte sind positive Zahlen. Null ist unzul�ssig.');
                return
            end       

    end




%% Entscheidung, welches Entwurfsverfahren f�r die gew�hlte Strecke in Frage kommt

% Anzahl Zeitkonstanten der Strecke
anzT = numel(handlesMain.zeitkonstantenT);

switch handles.selectedControlledSystem
    case handlesMain.textPopupmenuStrecke(1)    % PTn-Strecke
         if(anzT==2 && Tt>0)    % Strecke hat 2 Zeitkonstanten und eine Totzeit
            handlesMain.popupmenuVerfahren.Value = 1; % bevor string property neu gesetzt wird immer value property auf 1 zur�cksetzen, sonst kommt warning und popupmen� wird ausgeblendet
            handlesMain.popupmenuVerfahren.String = {'','Ziegler-Nichols 1. Variante','Ziegler-Nichols 2. Variante','Chien Hrones Reswick (CHR)','Kuhn normal','Kuhn schnell','Skogestad','Reinisch'};
            handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'on';
         elseif(anzT==2 && Tt==0) % 2 Zeitkonstanten, keine Totozeit -> keine Skogestad
            handlesMain.popupmenuVerfahren.Value = 1; % bevor string property neu gesetzt wird immer value property auf 1 zur�cksetzen, sonst kommt warning und popupmen� wird ausgeblendet
            handlesMain.popupmenuVerfahren.String = {'','Ziegler-Nichols 1. Variante','Ziegler-Nichols 2. Variante','Chien Hrones Reswick (CHR)','Kuhn normal','Kuhn schnell','Reinisch'};
            handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'on';
         end
         
         if(anzT==3)    % Strecke hat 3 Zeitkonstanten 
            handlesMain.popupmenuVerfahren.Value = 1; % bevor string property neu gesetzt wird immer value property auf 1 zur�cksetzen, sonst kommt warning und popupmen� wird ausgeblendet
            handlesMain.popupmenuVerfahren.String = {'','Ziegler-Nichols 1. Variante','Ziegler-Nichols 2. Variante','Chien Hrones Reswick (CHR)','Kuhn normal','Kuhn schnell','Reinisch'};
            handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'on';                     
         end
         
         if(anzT==1 && Tt>0)    % Strecke hat 1 Zeitkonstante und eine Totzeit
             handlesMain.popupmenuVerfahren.Value = 1;
            handlesMain.popupmenuVerfahren.String = {'','Skogestad','Reinisch'};
            handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'on';
            
         elseif(anzT==1 && Tt==0)   % Strecke hat 1 Zeitkonstante und keine Totzeit -> kein Skogestad. Kein Reinisch, da C1Strich = 0, wenn keine Totzeit vorhanden ist. Deshalb kann kein Ergebnis berechnet werden.
             handlesMain.popupmenuVerfahren.Value = 1;
            handlesMain.popupmenuVerfahren.String = {''};
            handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'off';
             
         end
         if(anzT==0) % Strecke ohne Zeitkonstante
             handlesMain.popupmenuVerfahren.Value = 1;
             handlesMain.popupmenuVerfahren.String = {''};
             handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'off';
         end
         
         
    case handlesMain.textPopupmenuStrecke(2)    % ITn-Strecke
        if(anzT==0 && Tt>0) % Strecke hat keine Zeitkonstante, hat Totzeit
            handlesMain.popupmenuVerfahren.Value = 1;
            handlesMain.popupmenuVerfahren.String = {'','Skogestad'};
            handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'on';
            
        elseif(anzT==0 && Tt==0) % Strecke hat keine Zeitkonstante, hat keine Totzeit -> kein Skogestad
            handlesMain.popupmenuVerfahren.Value = 1;
            handlesMain.popupmenuVerfahren.String = {''};
            handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'off';
        end
            
        if(anzT==1 && Tt>0) % Strecke hat 1 Zeitkonstante und eine Totzeit
             handlesMain.popupmenuVerfahren.Value = 1;
            handlesMain.popupmenuVerfahren.String = {'','Skogestad','Reinisch'};
            handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'on';
         elseif(anzT==1 && Tt==0) % Strecke 1 Zeitkonstanten, keine Totzeit -> kein Skogestad. Kein Reinisch, da C1Strich = 0, wenn keine Totzeit vorhanden ist. Deshalb kann kein Ergebnis berechnet werden.
             handlesMain.popupmenuVerfahren.Value = 1;
             handlesMain.popupmenuVerfahren.String = {''};
             handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'off';
         end
             
         if(anzT==2||anzT==3)% Strecke hat 2 oder 3 Zeitkonstanten
             handlesMain.popupmenuVerfahren.Value = 1;
            handlesMain.popupmenuVerfahren.String = {'','Reinisch'};
            handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'on';
         
         end
        
    case handlesMain.textPopupmenuStrecke(3)    % DTn-Strecke
        handlesMain.popupmenuVerfahren.Value = 1;
         handlesMain.popupmenuVerfahren.String = {''};
         handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'off';
end

handlesMain.popupmenuVerfahren.Enable = 'on';

% figure ausblenden. Bei Klick auf Button "Streckenparameter" wird die
% figure wieder sichtbar gemacht. Alle zuvor eingegebenen Daten sind noch
% vorhanden. Bei Anwahl einer Strecke �ber das Popupmen� "Regelstrecke"
% wird die figure neu ge�ffnet und alle zuvor eingegebenen Daten sind
% verloren
handles.figStreckenparameter.Visible = 'off';

handlesMain.figStreckenparameter = handles.figStreckenparameter;

% Aktualisierung der main handles von der figure gui_Projektarbeit
guidata(handles.hObjectMain,handlesMain);
% Aktualisierung der handles der figure gui_Strecke
guidata(hObject,handles);
  

   
end

% Wird aufgerufen, wenn Benutzer Fenster "Streckenparameter" schlie�t
 function gui_Strecke_closeRequestFcn(hObject,eventdata)
 
 % Handles der figure gui_Strecke
handles = guidata(hObject);
 % Handles der mainfigure gui_Projektarbeit
handlesMain = guidata(handles.hObjectMain);

% Bevor das Fenster geschlossen wird, wird das handle der figure
% "figStreckenparameter" aus der handles Struktur der mainfigure gel�scht
if(isfield(handlesMain,'figStreckenparameter'))
    handlesMain = rmfield(handlesMain,'figStreckenparameter');
    
    % Aktualisierung der handles von der mainfigure gui_Projektarbeit
    guidata(handles.hObjectMain,handlesMain);
end
% Fenster Streckenparameter schlie�en
delete(handles.figStreckenparameter);
 end
