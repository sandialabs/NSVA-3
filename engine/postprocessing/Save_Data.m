function Save_Data(handles)
% This fuction saves the output as .mat files

% Prepare the Data for the output
% Reduce the measured activities by the deselected reactions
for i=1:handles.Data_Misc.n_Env
    handles.Data_Input{i,1}((handles.Data_Input{i,6} == 0),:) = [];
    handles.Data_Input{i,2}((handles.Data_Input{i,6} == 0),:) = [];
end

% Reduce the measured activities correlation matrix by the deselected reactions
for i=1:handles.Data_Misc.n_Env
    for j=1:handles.Data_Misc.n_Env
        handles.Data_Cor_A{i,j}((handles.Data_Input{i,6} == 0),:) = []; % reduce correlation by row of Env i
        handles.Data_Cor_A{i,j}(:,(handles.Data_Input{j,6} == 0)) = []; % reduce correlation by column of Env j
    end
end

% For simplicity dublicate Data_Output
Data_Output = handles.Data_Output;

% Seperate Data ===================================================
for i=1:handles.Data_Misc.n_Env
    % Get size of Am, Phi
    [row_Am(i),col_Am(i)] = size(handles.Data_Cov_A{i,i});
    [row_Phi(i),col_Phi(i)] = size(handles.Data_Cov_Phi{i,i});
    % reassign input data
    Fluence_Prior{i,1} = handles.Data_Input{i,3};
    Fluence_Standard_Deviation_Prior{i,1} = handles.Data_Input{i,4}*100; % in percent
    Activities_Prior{i,1} = handles.Data_Input{i,1};
    Activities_Standard_Deviation_Prior{i,1} = handles.Data_Input{i,2}*100; % in percent
end %for
% Data to be saved --------------------------------------------
% Fluences
Fluence_Adjusted = mat2cell(Data_Output.Phi_1_k_adjusted,row_Phi,[1]);
% Fluences Standard Deviation
Fluence_Standard_Deviation_Adjusted = mat2cell(Data_Output.Phi_1_k_sd_adjusted,row_Phi,[1]);
% Fluences adjustment in %
Fluence_Adjustment_in_Percent = mat2cell(Data_Output.Phi_1_k_adjustment_pc,row_Phi,[1]);
% Correlation of the fluences
Fluence_Correlation_Adjusted = mat2cell(full(Data_Output.Cor_Phi_1_k_adjusted),row_Phi,col_Phi);
Fluence_Correlation_Prior = handles.Data_Cor_Phi;
% Covariance of the fluences
Fluence_Covariance_Adjusted = mat2cell(full(Data_Output.Cov_Phi_1_k_adjusted),row_Phi,col_Phi);
Fluence_Covariance_Prior = handles.Data_Cov_Phi;
% Activities
Activities_Adjusted = mat2cell(Data_Output.A_1_k_adjusted,row_Am,[1]);
% Activities Standard Deviation
Activities_Standard_Deviation_Adjusted = mat2cell(Data_Output.A_1_k_sd_adjusted,row_Am,[1]);
% Activities adjustment in %
Activities_Adjustment_in_Percent = mat2cell(Data_Output.A_1_k_adjustment_pc,row_Am,[1]);
% Correlation of the activities
Activities_Correlation_Adjusted = mat2cell(full(Data_Output.Cor_A_1_k_adjusted),row_Am,col_Am);
Activities_Correlation_Prior = handles.Data_Cor_A;
% Covariance of the activities
Activities_Covariance_Adjusted = mat2cell(full(Data_Output.Cov_A_1_k_adjusted),row_Am,col_Am);
Activities_Covariance_Prior = handles.Data_Cov_A;
% Chi Square
Chi_Square = Data_Output.chi_square;
% Chi Square Reactions
Chi_Square_Reaction = mat2cell(Data_Output.chi_square_reaction,row_Am,[1]);
Chi_Square_Reaction_List = {handles.lib_cell,Chi_Square_Reaction};
% Library
Included_Reactions = handles.lib_cell;
% -------------------------------------------------------------

clear Data_Output

% Assigning data to base workspace
% Adjusted Data ---------------------------------------------
assignin('base', 'Fluence_Adjusted', Fluence_Adjusted);
assignin('base', 'Fluence_Standard_Deviation_Adjusted', Fluence_Standard_Deviation_Adjusted);
assignin('base', 'Fluence_Adjustment_in_Percent', Fluence_Adjustment_in_Percent);
assignin('base', 'Fluence_Correlation_Adjusted', Fluence_Correlation_Adjusted);
assignin('base', 'Fluence_Covariance_Adjusted', Fluence_Covariance_Adjusted);
assignin('base', 'Activities_Adjusted', Activities_Adjusted);
assignin('base', 'Activities_Standard_Deviation_Adjusted', Activities_Standard_Deviation_Adjusted);
assignin('base', 'Activities_Adjustment_in_Percent', Activities_Adjustment_in_Percent);
assignin('base', 'Activities_Correlation_Adjusted', Activities_Correlation_Adjusted);
assignin('base', 'Activities_Covariance_Adjusted', Activities_Covariance_Adjusted);
% Prior Data -------------------------------------------------
assignin('base', 'Fluence_Prior', Fluence_Prior);
assignin('base', 'Fluence_Standard_Deviation_Prior', Fluence_Standard_Deviation_Prior);
assignin('base', 'Fluence_Correlation_Prior', Fluence_Correlation_Prior);
assignin('base', 'Fluence_Covariance_Prior', Fluence_Covariance_Prior);
assignin('base', 'Activities_Prior', Activities_Prior);
assignin('base', 'Activities_Standard_Deviation_Prior', Activities_Standard_Deviation_Prior);
assignin('base', 'Activities_Correlation_Prior', Activities_Correlation_Prior);
assignin('base', 'Activities_Covariance_Prior', Activities_Covariance_Prior);
% Chi Square ---------------------------------------------------
assignin('base', 'Chi_Square', Chi_Square);
assignin('base', 'Chi_Square_Reaction_List', Chi_Square_Reaction_List);
% Library
assignin('base', 'Included_Reactions', Included_Reactions);
% =================================================================

% ========== SAVING THE RESULTS ===========================================
button = questdlg('Do you want to save your data?','Saving');
switch button
    case 'Yes'    
        [filename, pathname, filterindex] = uiputfile( ...
            {'*.mat','MAT-files (*.mat)'; ...
            '*.xls','Excel (*.xls)'}, ...
            'Save as', 'Untitled.mat');
        if isequal(filename,0) | isequal(pathname,0)
            sprintf('All results are accessible if you choose to save them.\nResults were NOT saved though.')
        else
            switch filterindex
                case 1
                    path_data = fullfile(pathname, filename);
                    save(path_data,'Fluence_Adjusted','Fluence_Standard_Deviation_Adjusted','Fluence_Adjustment_in_Percent','Fluence_Correlation_Adjusted','Fluence_Covariance_Adjusted',...
                                   'Activities_Adjusted','Activities_Standard_Deviation_Adjusted','Activities_Adjustment_in_Percent','Activities_Correlation_Adjusted','Activities_Covariance_Adjusted',...
                                   'Fluence_Prior','Fluence_Standard_Deviation_Prior','Fluence_Correlation_Prior','Fluence_Covariance_Prior','Activities_Prior','Activities_Standard_Deviation_Prior','Activities_Correlation_Prior','Activities_Covariance_Prior',...
                                   'Chi_Square','Chi_Square_Reaction_List','Included_Reactions');
                    sprintf('The results are saved under:\n%s.mat',path_data)
                case 2
                    save_results_xls;
                    sprintf('The results are saved under:\n%s.xls',path_data)
            end
            sprintf('All Results are accessible in this file.')
        end
    otherwise
        sprintf('Results were NOT saved')
end
% =========================================================================
end %function