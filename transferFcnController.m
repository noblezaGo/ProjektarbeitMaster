% Bestimmung der �bertragungsfunktion des Reglers
% Funktion erstellt einen Regler aus den Parametern Kr,Tn,Tv
% Kr: Reglerverst�rkung
% Tn: Nachstellsteit
% Tv: Vorhaltezeit
% typeOfController:
% 'P-Regler','PI-Regler','I-Regler','PD-Regler','PID-Regler'

% F�r P-Regler: Tn,Tv = 0 an Funktion �bergeben
% F�r PI-Regler: Tv = 0 an Funktion �bergeben
% F�r PD-Regler: Tn = 0 an Funktion �bergeben
% F�r I-Regler: Tv = 0 �bergeben

function[Gr] = transferFcnController(Kr,Tn,Tv,typeOfController)

s = tf('s');


switch typeOfController
    case 'P-Regler'
        Gr = Kr;
        
    case 'PI-Regler'
        if(Tn>0)
            Gr = Kr*(1 + 1/(Tn*s));
        else
            errordlg('Error in Function transferFcnController');
            return
        end
        
    case 'PID-Regler'
        if(Tn>0)            
            Gr = Kr*(1 + 1/(Tn*s) + Tv*s);
        else
            errordlg('Error in Function transferFcnController');
            return
        end
        
    case 'PD-Regler'       
        Gr = Kr*(1 + Tv*s);
        
    case 'I-Regler'
        if(Tn>0)
            Gr = Kr/(Tn*s);
        else
            errordlg('Error in Function transferFcnController');
            return
        end
        
    otherwise
        errordlg('Error in Function transferFcnController');
        return
end

    if(exist('Gr','var')==0)
        errordlg('Error in Function transferFcnController. Failed to calculate controller.');
        return
    end

end