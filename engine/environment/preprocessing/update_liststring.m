function handles = update_liststring(handles)
% This function updates the liststring
i = handles.n;
if isfield(handles.Data,'Phi')
    n = length_liststring(handles);
    handles.liststring{n+1} = sprintf('Phi %i ',i);
end
if isfield(handles.Data,'Phi_SD')
    n = length_liststring(handles);
    handles.liststring{n+1} = sprintf('Phi SD %i',i);
end
if isfield(handles.Data,'Phi_Cor')
    n = length_liststring(handles);
    handles.liststring{n+1} = sprintf('Phi Cor %i',i);
end
if isfield(handles.Data,'Am')
    n = length_liststring(handles);
    handles.liststring{n+1} = sprintf('Am %i',i);
end
if isfield(handles.Data,'Am_SD')
    n = length_liststring(handles);
    handles.liststring{n+1} = sprintf('Am SD %i',i);
end
if isfield(handles.Data,'Am_Cor')
    n = length_liststring(handles);
    handles.liststring{n+1} = sprintf('Am Cor %i',i);
end
