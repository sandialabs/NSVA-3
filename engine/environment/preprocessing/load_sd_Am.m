function load_sd_Am(hObject,handles)
% This function loads the measured Activity  standard deviation vector
% for environment i
i = handles.n;

[filename, pathname, filterindex] = uigetfile(...
    {'*.mat','MatLab Data File (*.mat)';...
    '*.xls','Exel Data File (*.xls)';...
    '*.txt','Text Data File (*.txt)'},...
    sprintf('Pick the Activity Standard Deviation for Env.%i',i));
if isequal(filename,0) | isequal(pathname,0)
    sprintf('User pressed cancel\n Data was NOT saved')
    return;
else
    switch filterindex
        case 1
            % convert deviations from PERCENT to FRACTIONAL values
            load(fullfile(pathname,filename));
            if ~exist('sd_A','var')
                warndlg('No standard deviation data for the activities could be found in the loaded data. Data is rejected','Warning');
                return;
            end
            sd_A = sd_A/100;
        case 2
            sd_A = xlsread(fullfile(pathname,filename))/100;
        case 3
            sd_A = load(fullfile(pathname,filename))/100;
        otherwise
            warndlg('Activity Data cannot be loaded!','!! Warning !!');
    end
end

sprintf('Activity Standart Deviation Vector for environment %i accepted',i)
% Update BackgroundColor of current Button to green 
set(hObject,'BackgroundColor',[0,1,0]);

% Update liststring
n = length(handles.liststring);
handles.liststring{n+1} = sprintf('Am SD %i',i);

% Include updated Data in handles
handles.Data.Am_SD = sd_A;

guidata(hObject, handles);