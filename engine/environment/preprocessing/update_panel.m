% % type: sriptfile 
% describtion: updates GUI input panel of environment i according to the
%              provided vector of involved reactions
% =========================================================================
for i = 1:length(handles.Data.reaction)
    if handles.Data.reaction(i) == 1
        set(checkboxList(i), 'Value', 1)
    else
        set(checkboxList(i), 'Value', 0)
    end
end
% =========================================================================
