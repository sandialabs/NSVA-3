function load_Cor_Am(hObject,handles)
% This function loads the Activity correlation matrix for environment i
i = handles.n;

[filename, pathname, filterindex] = uigetfile(...
    {'*.mat','MatLab Data File (*.mat)';...
    '*.xls','Exel Data File (*.xls)';...
    '*.txt','Text Data File (*.txt)'},...
    sprintf('Pick the Activity Correlation for Env.%i',i));
if isequal(filename,0) | isequal(pathname,0)
    sprintf('User pressed cancel\n Data was NOT saved')
    return;
else
    switch filterindex
        case 1
            load(fullfile(pathname,filename));
            if ~exist('Cor_A','var')
                warndlg('No activity correlation data could be found in the loaded data. Data is rejected','Warning');
                return;
            end
        case 2
            Cor_A = xlsread(fullfile(pathname,filename));
        case 3
            Cor_A = load(fullfile(pathname,filename));
        otherwise
            warndlg('Activity Data cannot be loaded!','!! Warning !!');
    end
end

sprintf('Activity Correlation Matrix for environment %i accepted',i)

% Update BackgroundColor of current Button to green 
set(hObject,'BackgroundColor',[0,1,0]);

% Update liststring
n = length(handles.liststring);
handles.liststring{n+1} = sprintf('Am Cor %i',i);

% Include updated Data in handles
handles.Data.Am_Cor = Cor_A;

guidata(hObject, handles);