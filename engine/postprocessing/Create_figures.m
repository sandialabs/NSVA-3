function Create_figures(handles)

% Coming soon extend checks for availability of Data
if ~isfield(handles,'Data_Output')
    warndlg('No result data available yet. Run adjustment first','Warning')
    return;
end
if ~isfield(handles.Data_Output,'Cor_Phi_1_k_adjusted')
    warndlg('Cor_Phi_1_k_adjusted not available','Warning')
    return;
end
if ~isfield(handles.Data_Output,'Cor_A_1_k_adjusted')
    warndlg('Cor_A_1_k_adjusted not available','Warning')
    return;
end

% -------------------------------------------------------------------------
% Get number of loaded environments
[handles.Data_Misc.n_Env,dummy] = size(handles.Data_Input);

% Reduce Crosscorrelation matrices
for i=1:handles.Data_Misc.n_Env
    for j=1:handles.Data_Misc.n_Env 
        handles.Data_Cor_A{i,j}((handles.Data_Input{i,6} == 0),:) = []; % reduce correlation by row of Env i
        handles.Data_Cor_A{i,j}(:,(handles.Data_Input{j,6} == 0)) = []; % reduce correlation by column of Env j
    end
end
% Create correlation figures ==============================================
% Set the colormap to grayscale
colormap(gray);

figure;
set(gcf,'Name','Fluence correlation matrix');
pos = get(gcf, 'OuterPosition'); pos(3) = 1020;
set(gcf, 'OuterPosition', pos);
subplot(1,2,1)
    imagesc (cell2mat(handles.Data_Cor_Phi));
    title('PRIOR');
    ylabel('rows of the matrix');
    xlabel('columns of the matrix');
    caxis([-1 1]);
    pf1 = get(gca, 'Position'); pf1(1) = 0.07;
    set(gca, 'Position', pf1);    
subplot(1,2,2)
    imagesc (handles.Data_Output.Cor_Phi_1_k_adjusted);
    title('ADJUSTED');
    xlabel('columns of the matrix');
    caxis([-1 1]);
    colorbar;
    pf2 = get(gca, 'Position'); pf2(1) = 0.5; pf2(3:4) = pf1(3:4);
    set(gca, 'Position', pf2);    
    

figure;
set(gcf,'Name','Activity correlation matrix');
pos = get(gcf, 'OuterPosition'); pos(3) = 1020;
set(gcf, 'OuterPosition', pos);
subplot(1,2,1)
    imagesc (cell2mat(handles.Data_Cor_A));
    title('PRIOR');
    ylabel('rows of the matrix');
    xlabel('columns of the matrix');
    caxis([-1 1]);
    pf1 = get(gca, 'Position'); pf1(1) = 0.07;
    set(gca, 'Position', pf1);     
subplot(1,2,2)
    imagesc (handles.Data_Output.Cor_A_1_k_adjusted);
    title('ADJUSTED');
    xlabel('columns of the matrix');
    caxis([-1 1]);
    colorbar;
    pf2 = get(gca, 'Position'); pf2(1) = 0.5; pf2(3:4) = pf1(3:4);
    set(gca, 'Position', pf2);      
% =========================================================================
