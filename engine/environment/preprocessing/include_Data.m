function include_Data(hObject,handles)
% This function includes the Data from environment i into the Data_Input of the main figure "NSVA"

% === Check if all required data is available =============================
if ~isfield(handles,'Data')
    warndlg('No data available that can be included','Warning');
    return;
end
if ~isfield(handles.Data,'Am')
    warndlg('Activity data is missing! Data cannot be included yet','Warning');
    return;
end
if ~isfield(handles.Data,'Am_SD')
    warndlg('Standard deviation of Activities are missing! Data cannot be included yet','Warning');
    return;
end
if ~isfield(handles.Data,'Am_Cor')
    warndlg('Activity correlation matrix is missing! Data cannot be included yet','Warning');
    return;
end
if ~isfield(handles.Data,'Phi')
    warndlg('Fluence data is missing! Data cannot be included yet','Warning');
    return;
end
if ~isfield(handles.Data,'Phi_SD')
    warndlg('Standard deviation of Fluences are missing! Data cannot be included yet','Warning');
    return;
end
if ~isfield(handles.Data,'Phi_Cor')
    warndlg('Fluence correlation matrix is missing! Data cannot be included yet','Warning');
    return;
end
if ~isfield(handles.Data,'reaction')
    warndlg('Reaction vector is missing! Data cannot be included yet','Warning');
    return;
end
if ~isfield(handles.Data,'selection')
    warndlg('Selection vector is missing! Data cannot be included yet','Warning');
    return;
end
% === End =================================================================
% === Include data in Data_Input ==========================================
% obtain Data from NSVA main window
handles_NSVA = guidata(handles.figure_NSVA);
[row_Env,col_Env] = size(handles_NSVA.Data_Input);

% Decide if current environment has to be added to the list of
% environments, or if an old environment has to be replaced.
num_Env = row_Env + 1; % Environment will be added
for i = 1:row_Env
    if handles.n == handles_NSVA.Data_Input{i,12}
        num_Env = i; %Environment i will be replaced with current Environment
        break;
    end %if
end % for

% The order of data in Data_Input:
%Data_Input{i} = {Am(1) | sd_Am(2) | Phi(3) | sd_Phi(4) | (5) | reduction(6) |
%S_phi(7) | S_Sigma(8) | decision(9) | reaction(10) | liststring(11) | Env#(12)} for ENV i
handles_NSVA.Data_Input{num_Env,1} = handles.Data.Am;
handles_NSVA.Data_Input{num_Env,2} = handles.Data.Am_SD;
handles_NSVA.Data_Input{num_Env,3} = handles.Data.Phi;
handles_NSVA.Data_Input{num_Env,4} = handles.Data.Phi_SD;
handles_NSVA.Data_Input{num_Env,6} = create_reduction(handles.Data.reaction,handles.Data.selection);
handles_NSVA.Data_Input{num_Env,9} = create_decision(handles.Data.reaction,handles.Data.selection);
handles_NSVA.Data_Input{num_Env,10} = handles.Data.reaction;
handles_NSVA.Data_Input{num_Env,11} = handles.liststring;
handles_NSVA.Data_Input{num_Env,12} = handles.n;
handles_NSVA.Data_Cor_A{num_Env,num_Env} = handles.Data.Am_Cor;
handles_NSVA.Data_Cor_Phi{num_Env,num_Env} = handles.Data.Phi_Cor;

[row_Env,col_Env] = size(handles_NSVA.Data_Input); %Get new size of Data_Input
NSVA_liststring = {}; % Initiate NSVA_listring
for i = 1:row_Env % Create NSVA_listring out of all the listrings from the envrionments (See Data_Input{i,11})
    k = length(NSVA_liststring); % temp length of NSVA_liststring
    for j=1:length(handles_NSVA.Data_Input{i,11})
        NSVA_liststring{k+j} = handles_NSVA.Data_Input{i,11}{j}; % add listring from Env i to NSVA_listring
    end
end
handles_NSVA.liststring = NSVA_liststring;

% Update Listbox in main Window
set(handles_NSVA.Listbox,'String',NSVA_liststring);

% Update handles structure
guidata(handles.figure_NSVA, handles_NSVA);
end %function