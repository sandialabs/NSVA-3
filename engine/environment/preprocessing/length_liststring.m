function n = length_liststring(handles)

if isfield(handles,'liststring')
    n = length(handles.liststring);
else
    n = 0;
end