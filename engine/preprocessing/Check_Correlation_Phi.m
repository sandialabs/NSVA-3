function handles = Check_Correlation_Phi(handles)
% This script checks if all Correlation and Cross-Correlation of fluence matrices are
% available. If not, empty cells will be filled with zeros!

flag_empty_Cor_Phi = false;
for i=1:handles.Data_Misc.n_Env
    for j=1:handles.Data_Misc.n_Env
        if isempty(handles.Data_Cor_Phi{i,j})
            row_i = length(handles.Data_Input{i,3});
            col_j = length(handles.Data_Input{j,3});
            handles.Data_Cor_Phi{i,j} = zeros(row_i,col_j);
            flag_empty_Cor_Phi = true;
        end
    end
end

if flag_empty_Cor_Phi
    warndlg('Cross correlation for fluences are missing. Include zero correlation instead','Warning');
end

guidata(handles.figure1, handles);