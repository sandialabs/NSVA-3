function handles = Normalize_Phi(handles)
% This function normalize the fluence to a selected isotope.

% For readability: Extract Data from handles
i = handles.n; %Number of current environment
Data = handles.Data;

if (isfield(Data,'reaction') && isfield(Data,'Phi') && isfield(Data,'Am'))
    if sum(Data.reaction) == 0
        warndlg(sprintf('No Reactions for Env.%i are selected yet',i),'!! Warning !!');
        return;
    end
    if isempty(Data.Phi)
        warndlg(sprintf('Fluence Data for Env.%i not loaded yet',i),'!! Warning !!');
        return;
    end
    if isempty(Data.Am)
        warndlg(sprintf('Activity Data for Env.%i not loaded yet',i),'!! Warning !!');
        return;
    end
    if ~isfield(handles,'lib')
        warndlg('Libary Data is missing','!! Warning !!');
        return;
    end
    lib = handles.lib;
    lib((Data.reaction == 0),:) = [];
    if ~isfield(Data,'norm2isotope')
        [selection,ok] = listdlg('PromptString','Select a normalization reaction:',...
            'SelectionMode','single',...
            'ListString',lib,...
            'Name',sprintf('Modify Env.%i',i),...
            'ListSize',[180 300]);
        if ok == 0 % User pressed cancel
            return;
        end
    else
        selection = Data.norm2isotope;
    end
    % Read data
    read_library_data;
    CrS(:,(Data.reaction == 0)) = [];
    % Normalize fluence: Phi_norm = (Am_i / (Phi'*Sigma_i)) * Phi
    % selection = selected isotope to which the fluence will be normalized to
    Data.Phi = (Data.Am(selection)/(Data.Phi'*CrS(:,selection)))*Data.Phi;
    Data.norm2isotope = selection; % Save the # of isotope to which the fluence is normalized to
    % reassign Data to handles
    handles.Data = Data;
    % Update Checkboxes
    checkbox_Color(handles);
    % Update liststring
    for j = 1:length(handles.liststring);
        if strncmp(handles.liststring{j},sprintf('Phi %i ',i),6);
            handles.liststring{j} = sprintf('Phi %i normalized to  %s',i,lib(selection,:));
        end
    end
    % Save struct of handles
    guidata(handles.figure1, handles);
    sprintf('Fluence of Environment %i is normalized to:   %s',handles.n,lib(selection,:))
else
    warndlg(sprintf('Load Reactions, Fluence, and Activity for Env.%i first',i),'!! Warning !!');
end
