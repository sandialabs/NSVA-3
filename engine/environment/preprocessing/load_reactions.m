function load_reactions(hObject, handles)

i = handles.n;

[filename, pathname, filterindex] = uigetfile(...
    {'*.mat','MatLab Data File (*.mat)';...
     '*.xls','Exel Data File (*.xls)'},...
     sprintf('Pick Reactions for Env.%i',i));
if isequal(filename,0) || isequal(pathname,0)
    sprintf('User pressed cancel\n Data was NOT loaded')
    return;
else
    switch filterindex
        case 1
            load(fullfile(pathname,filename));
            if ~exist('m','var')
                warndlg('No reaction data could be found in the loaded data. Data is rejected','Warning');
                return;
            end
            decision = m; % Variable name of input is 'm'
        case 2
            decision = xlsread(fullfile(pathname,filename));
    end
end

% Update liststring
% liststrings contain the data of the listbox
if ~isfield(handles,'liststring')
    handles.liststring = {};
end
n = length(handles.liststring);
handles.liststring{n+1} = sprintf('Reactions of Env %i',i);

% Check if reactions have the correct size
decision_length = length(decision);
if decision_length ~= handles.n_reactions;
    warndlg(sprintf('The loaded reactions data does not have the proper size. A column vector of dimension %i is required, but the loaded Data is of dimension %i. Data is rejected!',handles.n_reactions,decision_length),'Warning');
    return;
end

% Command output
sprintf('Previous set of reactions for environment %i was accepted',i)

% Include updated Data in handles
handles.Data.reaction = decision;

% Update Figure 
checkboxList = grouping(handles,'checkbox');
update_panel;

guidata(hObject, handles);