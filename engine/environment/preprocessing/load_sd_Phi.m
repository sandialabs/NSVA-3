function load_sd_Phi(hObject,handles)
% This function loads the Fluence standard deviation vector of environment
% i
i = handles.n;

[filename, pathname, filterindex] = uigetfile(...
    {'*.mat','MatLab Data File (*.mat)';...
    '*.xls','Exel Data File (*.xls)';...
    '*.txt','Text Data File (*.txt)'},...
    sprintf('Pick the Fluence Standard Deviation for Env.%i',i));
if isequal(filename,0) | isequal(pathname,0)
    sprintf('User pressed cancel\n Data was NOT saved')
    return;
else
    switch filterindex
        case 1
            % convert deviations from PERCENT to FRACTIONAL values
            load(fullfile(pathname,filename));
            if ~exist('sd_F','var')
                warndlg('No standard deviation data for the fluences could be found in the loaded data. Data is rejected','Warning');
                return;
            end            
            sd_F = sd_F/100;
        case 2
            sd_F = xlsread(fullfile(pathname,filename))/100;
        case 3
            sd_F = load(fullfile(pathname,filename))/100;
        otherwise
            warndlg('Fluence standard deviation cannot be loaded!','!! Warning !!');
            return;
    end
end

sprintf('Fluence Standart Deviation Vector for environment %i accepted',i)

% Update BackgroundColor of current Button to green 
set(hObject,'BackgroundColor',[0,1,0]);

% Update liststring
n = length(handles.liststring);
handles.liststring{n+1} = sprintf('Phi SD %i',i);

% Include updated Data in handles
handles.Data.Phi_SD = sd_F;

guidata(hObject, handles);