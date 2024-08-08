function load_Cor_Phi(hObject,handles)
% This function loads the Fluence correlation matrix for environment i

i = handles.n;

[filename, pathname, filterindex] = uigetfile(...
    {'*.mat','MatLab Data File (*.mat)';...
    '*.xls','Exel Data File (*.xls)';...
    '*.txt','Text Data File (*.txt)'},...
    sprintf('Pick the Fluence Correlation for Env.%i',i));
if isequal(filename,0) | isequal(pathname,0)
    sprintf('User pressed cancel\n Data was NOT saved')
    return;
else
    switch filterindex
        case 1
            load(fullfile(pathname,filename));
            if ~exist('Cor_F','var')
                warndlg('No fluence correlation data could be found in the loaded data. Data is rejected','Warning');
                return;
            end

        case 2
            Cor_F = xlsread(fullfile(pathname,filename));
        case 3
            Cor_F = load(fullfile(pathname,filename));
        otherwise
            warndlg('Fluence Data cannot be loaded!','!! Warning !!');
            return;
    end
end

sprintf('Fluence Correlation Matrix for environment %i accepted',i)

% Update BackgroundColor of current Button to green 
set(hObject,'BackgroundColor',[0,1,0]);

% Update liststring
n = length(handles.liststring);
handles.liststring{n+1} = sprintf('Phi Cor %i',i);

% Include updated Data in handles
handles.Data.Phi_Cor = Cor_F;

guidata(hObject, handles);