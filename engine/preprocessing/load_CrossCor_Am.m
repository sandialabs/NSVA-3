function load_CrossCor_Am(i,j,hObject,handles)
% This function loads the Activity cross correlation matrix between
% environment i & j

[filename, pathname, filterindex] = uigetfile(...
    {'*.mat','MatLab Data File (*.mat)';...
    '*.xls','Exel Data File (*.xls)';...
    '*.txt','Text Data File (*.txt)'},...
    sprintf('Pick the Activity Cross Correlation between Env.%i & Env.%i',i,j));
if isequal(filename,0) | isequal(pathname,0)
    sprintf('User pressed cancel\n Data was NOT saved')
    return;
else
    switch filterindex
        case 1
            load(fullfile(pathname,filename));
            if ~exist('CCA','var')
                warndlg('Cross correlation data could not be found in the loaded data. Data is rejected','Warning');
                return;
            end
        case 2
            CCA = xlsread(fullfile(pathname,filename));
        case 3
            CCA = load(fullfile(pathname,filename));
        otherwise
            warndlg('Activity Cross Correlation cannot be loaded!','!! Warning !!');
            return;
    end
end
% Coming soon: Check for proper size of loaded data -----------------------
row_i = length(handles.Data_Input{i,1});
col_j = length(handles.Data_Input{j,1});
[row_CCA,col_CCA] = size(CCA);
if ~((row_i == row_CCA) && (col_j == col_CCA))
    warndlg('The size of the cross correlation matrix does not fit with the loaded Environments. Loading aborted!','Warning');
    return;
end
% -------------------------------------------------------------------------

sprintf('Activity Cross Correlation Matrix between Env.%i & Env.%i accepted',i,j)

% Update liststring
liststring = get(handles.Listbox,'String');
flag_liststring = false;
for counter = 1:length(liststring); % check if CrossCor_Am %i %i exist already in liststring
    if strcmp(liststring{counter},sprintf('CrossCor_Am %i %i',i,j))
        flag_liststring = true;
    end % if
    if strcmp(liststring{counter},sprintf('CrossCor_Am %i %i',j,i))% check if opposite CCA exist
        flag_liststring = true;
        liststring{counter} = sprintf('CrossCor_Am %i %i',i,j);% rename in liststring
    end % if
end % for
if ~flag_liststring % if the string CrossCor_Am %i %i does not exist, then add it to liststring
    liststring{length(liststring)+1} = sprintf('CrossCor_Am %i %i',i,j);
end % if
% Update Listbox
set(handles.Listbox,'String',liststring);

% Save data to handles
handles.Data_Cor_A{i,j} = CCA;
handles.Data_Cor_A{j,i} = CCA';

% Update handles structure
guidata(hObject, handles);