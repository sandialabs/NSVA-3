% % type: sriptfile 
% describtion: updates GUI input panel of environment i according to the
%              provided vector of deselected reactions
% =========================================================================
for i = 1:length(handles.Data.selection)
    if handles.Data.selection(i) == 1
        set(radiobuttonList(i), 'Value', 0)
    else
        set(radiobuttonList(i), 'Value', 1)
    end
end
% =========================================================================