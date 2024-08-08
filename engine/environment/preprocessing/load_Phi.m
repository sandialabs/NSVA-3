function load_Phi(hObject,handles)
% This function loads the Fluence vector for environment i
i = handles.n;

[filename, pathname, filterindex] = uigetfile(...
    {'*.mat','MatLab Data File (*.mat)';...
    '*.xls','Exel Data File (*.xls)';...
    '*.txt','Text Data File (*.txt)'},...
    sprintf('Pick the Fluence for Env.%i',i));
if isequal(filename,0) | isequal(pathname,0)
    sprintf('User pressed cancel\n Data was NOT saved')
    return;
else
    switch filterindex
        case 1
            load(fullfile(pathname,filename));
            if ~exist('F','var')
                warndlg('No fluence data could be found in the loaded data. Data is rejected','Warning');
                return;
            end
        case 2
            F = xlsread(fullfile(pathname,filename));
        case 3
            F = load(fullfile(pathname,filename));
        otherwise
            warndlg('Fluence Data cannot be loaded!','!! Warning !!');
            return;
    end
end

sprintf('Fluence data for environment %i accepted',i)

% Update BackgroundColor of current Button to green 
set(hObject,'BackgroundColor',[0,1,0]);

% Update liststring
n = length(handles.liststring);
handles.liststring{n+1} = sprintf('Phi %i',i);

% Include updated Data in handles
handles.Data.Phi = F;

% Update the Normalization button and checkboxes
if isfield(handles.Data,'norm2isotope')
    handles.Data = rmfield(handles.Data,'norm2isotope');
    checkbox_Color(handles);
end

guidata(hObject, handles);



