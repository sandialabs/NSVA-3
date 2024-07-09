function handles = Check_Correlation_Am(handles)
% This script checks if all Correlation and Cross-Correlation of activity matrices are
% available. If not, empty cells will be filled with zeros!

flag_empty_Cor_Am = false;
for i=1:handles.Data_Misc.n_Env
    for j=1:handles.Data_Misc.n_Env
        if isempty(handles.Data_Cor_A{i,j})
            row_i = length(handles.Data_Input{i,1});
            col_j = length(handles.Data_Input{j,1});
            handles.Data_Cor_A{i,j} = zeros(row_i,col_j);
            flag_empty_Cor_Am = true;
        end
    end
end

if flag_empty_Cor_Am
    warndlg('Cross correlation for activities are missing. Include zero correlation instead','Warning');
end

guidata(handles.figure1, handles);