function load_Am(hObject,handles)
% This function loads the measured Activity vector for environment i
i = handles.n;

[filename, pathname, filterindex] = uigetfile(...
    {'*.mat','MatLab Data File (*.mat)';...
    '*.xls','Exel Data File (*.xls)';...
    '*.txt','Text Data File (*.txt)'},...
    sprintf('Pick the Activity for Env.%i',i));
if isequal(filename,0) | isequal(pathname,0)
    sprintf('User pressed cancel\n Data was NOT saved')
    return;
else
    switch filterindex
        case 1
            load(fullfile(pathname,filename));
            if ~exist('A','var')
                warndlg('No activity data could be found in the loaded data. Data is rejected','Warning');
                return;
            end
        case 2
            A = xlsread(fullfile(pathname,filename));
        case 3
            A = load(fullfile(pathname,filename));
        otherwise
            warndlg('Activity Data cannot be loaded!','!! Warning !!');
            return;
    end
end

% Command output
sprintf('Activity Vector for environment %i accepted',i)

% Update BackgroundColor of current Button to green 
set(hObject,'BackgroundColor',[0,1,0]);

% Update liststring
n = length(handles.liststring);
handles.liststring{n+1} = sprintf('Am %i',i);

% Include updated Data in handles
handles.Data.Am = A;

guidata(hObject, handles);