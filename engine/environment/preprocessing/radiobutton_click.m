function handles = radiobutton_click(i,hObject,handles)
% This fuction manipulates the radio buttons

if (get(hObject,'Value') == get(hObject,'Max'))
    if handles.Data.reaction(i) == 0
        handles.Data.selection(i) = 1;
        set(hObject,'Value', 0);    % zero is Min Value per definition
        sprintf('You can only deselect reactions which are involved\nin the reaction')
    else
        handles.Data.selection(i) = 0;
        sprintf('%s\nwas REMOVED from the calculation',handles.lib(i,:))
    end
else
    if handles.Data.reaction(i) == 0
        handles.Data.selection(i) = 1;    % restore initial value
        sprintf('You have to selsect the reaction before adding it\nback to the calculation')
    else
        handles.Data.selection(i) = 1;
        sprintf('%s\nwas ADDED back to the calculation',handles.lib(i,:))
    end
end