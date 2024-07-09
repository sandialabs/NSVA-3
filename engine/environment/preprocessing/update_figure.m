function update_figure(handles)
% This function updates the figure according to the loaded Data

if isfield(handles,'Data')
    if isfield(handles.Data,'Phi')
        set(handles.Load_Fluence,'BackgroundColor',[0,1,0]);
    end
    if isfield(handles.Data,'Phi_SD')
        set(handles.Load_Fluence_SD,'BackgroundColor',[0,1,0]);
    end
    if isfield(handles.Data,'Phi_Cor')
        set(handles.Load_Fluence_Cor,'BackgroundColor',[0,1,0]);
    end
    if isfield(handles.Data,'Am')
        set(handles.Load_Activity,'BackgroundColor',[0,1,0]);
    end
    if isfield(handles.Data,'Am_SD')
        set(handles.Load_Activity_SD,'BackgroundColor',[0,1,0]);
    end
    if isfield(handles.Data,'Am_Cor')
        set(handles.Load_Activity_Cor,'BackgroundColor',[0,1,0]);
    end
    if isfield(handles.Data,'reaction')
        checkboxList = grouping(handles,'checkbox');
        update_panel;
    end
    if isfield(handles.Data,'selection')
        radiobuttonList = grouping(handles,'radiobutton');
        update_radiobutton;
    end
    if isfield(handles.Data,'norm2isotope')
        Normalize_Phi(handles);
    end
    guidata(handles.figure1, handles);
else
    warndlg('Figure cannot be updated. Struct "Data" is missing! See function update_figure.m');
end