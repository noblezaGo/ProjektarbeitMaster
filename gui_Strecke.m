% Diese GUI figure wird benutzt zur Einlesung der Streckenparameter

% hObjectMain ist handle von popupmenuStrecke oder pushbutton_Streckenparameter, von dort
% wird gui_Strecke gecallt
% parent von hObjectMain ist figure von gui_Projektarbeit

function gui_Strecke(hObjectMain)

% GUI-figure zur Eingabe der Streckenparameter
handles.fig = figure('WindowStyle','modal','position',[0 700 500 600],'MenuBar','none','Name','Streckenparameter','NumberTitle','off','OuterPosition',[230 150 650 400],'color','white');

handles.hObjectMain = hObjectMain;
handlesMain = guidata(hObjectMain);

contentPopupmenuStrecke = get(handlesMain.popupmenuStrecke,'String');
% Ausgew�hlten Streckentyp auslesen
handles.selectedControlledSystem = contentPopupmenuStrecke{get(handlesMain.popupmenuStrecke,'Value')};



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
handles.popupmenuAnzahlT = uicontrol('style','popupmenu','position',[100 300 100 20],'String',{'0' '1' '2' '3'},'Callback',@popupmenu_AnzT_Callback);

% Eingabe K
handles.textK = uicontrol('style','text','position',[50 260 50 20],'FontSize',10,'BackgroundColor','white','String','K =');
handles.editK = uicontrol('style','edit','position',[100 260 100 20]);

% Eingabe Tt
handles.textTt = uicontrol('style','text','position',[50 220 50 20],'FontSize',10,'BackgroundColor','white','String','Tt =');
handles.editTt = uicontrol('style','edit','position',[100 220 100 20]);

% Eingabe Zeitkonstante T1
handles.textT1 = uicontrol('style','text','position',[50 180 50 20],'Visible','off','FontSize',10,'BackgroundColor','white','String','T1 =');
handles.editT1 = uicontrol('style','edit','position',[100 180 100 20],'Visible','off');

% Eingabe Zeitkonstante T2, wird unsichtbar erstellt
handles.textT2 = uicontrol('style','text','position',[50 140 50 20],'Visible','off','FontSize',10,'BackgroundColor','white','String','T2 =');
%hg = get(textT2);
handles.editT2 = uicontrol('style','edit','position',[100 140 100 20],'Visible','off');

% Eingabe Zeitonstante T3, wird unsichtbar erstellt
handles.textT3 = uicontrol('style','text','position',[50 100 50 20],'Visible','off','BackgroundColor','white','FontSize',10,'String','T3 =');
handles.editT3 = uicontrol('style','edit','position',[100 100 100 20],'Visible','off');

% Button "�bernehmen"
handles.buttonApply = uicontrol('style','pushbutton','position',[200 50 100 30],'String','�bernehmen','Callback',@pushbutton_Apply_Callback);


guidata(handles.fig,handles);

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
handles.anzahlT = content{get(hObject,'Value')};
  

%% Abh�ngig von eingestellter Anzahl an Zeitkonstanten im Popupmen� werden die Eingabefelder der Zeitkonstanten ein- oder ausgeblendet
switch handles.anzahlT
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
    errordlg('Ung�ltiger Eingabewert. G�ltige Eingabewerte sind positive Zahlen. Null ist unzul�ssig.');
    return
end

% Totzeit Tt einlesen
Tt = str2double(get(handles.editTt,'String'));
if(isnan(Tt)==0 && Tt>0)
    handlesMain.totzeitTt = Tt;
else
    errordlg('Ung�ltiger Eingabewert. G�ltige Eingabewerte sind positive Zahlen. Null ist unzul�ssig.');
    return
end
    

% Zeitkonstanten einlesen
handlesMain.zeitkonstantenT = [];
% Im Popupmen� "Anzahl Zeitkonstanten" ist als default "0" eingestellt. Wenn
% Benutzer nicht in Popupmen� reinklickt wird Callback nicht ausgef�hrt und
% handles.anzahlT existiert nicht. Mit isfield pr�fen ob anzahlT im handles
% struct existiert
if(isfield(handles,'anzahlT'))    
    switch handles.anzahlT
        case '1'
            T1 = str2double(get(handles.editT1,'String'));
            % T1 ist eine Zahl und gr��er als Null
            if(isnan(T1)==0 && T1>0)
                handlesMain.zeitkonstantenT(1) = T1;
            else 
                % Fehlerdialogbox wird bei unzul�ssigem Eingabewert angezeigt.
                % Return unterbricht die Callback Funktion. Der Benutzer hat
                % die M�glichkeit neu einzugeben.
                errordlg('Ung�ltiger Eingabewert. G�ltige Eingabewerte sind positive Flie�kommazahlen. Null ist unzul�ssig.');
                return
            end

        case '2'
            T1 = str2double(get(handles.editT1,'String'));
            T2 = str2double(get(handles.editT2,'String'));
            if(isnan(T1)==0 && T1>0 && isnan(T2)==0 && T2>0)
                handlesMain.zeitkonstantenT(1) = T1;
                handlesMain.zeitkonstantenT(2) = T2;
            else
                errordlg('Ung�ltiger Eingabewert. G�ltige Eingabewerte sind positive Zahlen. Null ist unzul�ssig.');
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
                errordlg('Ung�ltiger Eingabewert. G�ltige Eingabewerte sind positive Zahlen. Null ist unzul�ssig.');
                return
            end       

    end

end



% zeitkonstantenTRaw = [T1 T2 T3];
% 
% % Array aus den Zeitkonstanten 
% 
% for i=1:numel(zeitkonstantenTRaw)
%     % Wenn Element ein numerisches Element und ungleich null ist, wird es
%     % dem Array handlesMain.zeitkonstantenT hinzugef�gt
%    if(isnan(zeitkonstantenTRaw(i))==0 && zeitkonstantenTRaw(i)~=0)
%        handlesMain.zeitkonstantenT(end+1) = zeitkonstantenTRaw(i);
%    end
% end

% handlesMain.zeitkonstantenT enth�lt die eingegebenen Zeitkonstanten



%% Entscheidung, welches Entwurfsverfahren f�r die gew�hlte Strecke in Frage kommt

% Anzahl Zeitkonstanten der Strecke
anzT = numel(handlesMain.zeitkonstantenT);

switch handles.selectedControlledSystem
    case handlesMain.textPopupmenuStrecke(1)    % PTn-Strecke
         if(anzT==2)    % Strecke hat 2 Zeitkonstanten
            handlesMain.popupmenuVerfahren.Value = 1; % bevor string property neu gesetzt wird immer value property auf 1 zur�cksetzen, sonst kommt warning und popupmen� wird ausgeblendet
            handlesMain.popupmenuVerfahren.String = {'','Ziegler-Nichols 1. Variante','Ziegler-Nichols 2. Variante','CHR periodischer Regelverlauf','CHR aperiodischer Regelverlauf','Kuhn normal','Kuhn schnell','Skogestad'};
            handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'on';
         end
         if(anzT==3)    % Strecke hat 3 Zeitkonstanten
            handlesMain.popupmenuVerfahren.Value = 1; % bevor string property neu gesetzt wird immer value property auf 1 zur�cksetzen, sonst kommt warning und popupmen� wird ausgeblendet
            handlesMain.popupmenuVerfahren.String = {'','Ziegler-Nichols 1. Variante','Ziegler-Nichols 2. Variante','CHR periodischer Regelverlauf','CHR aperiodischer Regelverlauf','Kuhn normal','Kuhn schnell'};
            handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'on';
         end
         if(anzT==1)    % Strecke hat 1 Zeitkonstante
             handlesMain.popupmenuVerfahren.Value = 1;
            handlesMain.popupmenuVerfahren.String = {'','Skogestad'};
            handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'on';
         end
         if(anzT==0) % Strecke ohne Zeitkonstante
             handlesMain.popupmenuVerfahren.Value = 1;
             handlesMain.popupmenuVerfahren.String = {''};
             handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'off';
         end
         
         
    case handlesMain.textPopupmenuStrecke(2)    % ITn-Strecke
         if(anzT<=1) % Strecke hat 0 oder 1 Zeitkonstanten
             handlesMain.popupmenuVerfahren.Value = 1;
            handlesMain.popupmenuVerfahren.String = {'','Skogestad'};
            handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'on';
         else % Strecke hat 2 oder 3 Zeitkonstanten
             handlesMain.popupmenuVerfahren.Value = 1;
            handlesMain.popupmenuVerfahren.String = {''};
            handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'off';
         
         end
        
    case handlesMain.textPopupmenuStrecke(3)    % DTn-Strecke
        handlesMain.popupmenuVerfahren.Value = 1;
         handlesMain.popupmenuVerfahren.String = {''};
         handlesMain.radiobuttonPlotStepClosedLoop.Enable = 'off';
end

handlesMain.popupmenuVerfahren.Enable = 'on';

% figure ausblenden
handles.fig.Visible = 'off';
        

% Aktualisierung der main handles von der figure gui_Projektarbeit
guidata(handles.hObjectMain,handlesMain);
% Aktualisierung der handles der figure gui_Strecke
guidata(hObject,handles);
  
end
