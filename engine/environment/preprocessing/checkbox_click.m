function handles = checkbox_click(i,hObject,handles)
% This fuction manipulates the checkboxes

if (get(hObject,'Value') == get(hObject,'Max'))
    handles.Data.reaction(i) = 1;
    sprintf('%s\nwas ADDED to the list of involved reactions\nof environment %i',handles.lib(i,:),handles.n)
else
    handles.Data.reaction(i) = 0;
    handles.Data.selection(i) = 1;
    radiobuttonList = grouping(handles,'radiobutton');
    set(radiobuttonList(i), 'Value', 0);
    sprintf('%s\nwas REMOVED of the list of involved reactions\nof environment %i',handles.lib(i,:),handles.n)
end