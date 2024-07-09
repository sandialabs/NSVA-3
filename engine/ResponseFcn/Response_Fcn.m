function Response_Fcn(handles,Res_Fcn_type)

%Data_Input{i} = {Am(1) | sd_Am(2) | Phi(3) | sd_Phi(4) | (5) | reduction(6) |
%S_phi(7) | S_Sigma(8) | decision(9) | reaction(10) | liststring(11) |
%Env#(12)} for ENV i

% Coming soon extend checks for availability of Data
if ~isfield(handles,'Data_Output')
    warndlg('No result data available yet. Run adjustment first','Warning')
    return;
end
if ~isfield(handles,'Data_Cov_Phi')
    warndlg('Data_Cov_Phi not available','Warning')
    return;
end
if ~isfield(handles.Data_Output,'Phi_1_k_adjusted')
    warndlg('Phi_1_k_adjusted not available','Warning')
    return;
end
if ~isfield(handles.Data_Output,'Cov_Phi_1_k_adjusted')
    warndlg('Cov_Phi_1_k_adjusted not available','Warning')
    return;
end

Data_Output = handles.Data_Output;

% load resonse function
[Res_Fcn Ni_Sigma Res_Fcn_name] = loadResponseFcn(Res_Fcn_type);
if isempty(Res_Fcn) || isempty(Ni_Sigma)
    disp('no Data was loaded');
%    warndlg('Error in loading response function or cross-section of Nickel','Warning');
    return;
end
% check the size of the response function
[row_res,col_res] = size(Res_Fcn);
if or((row_res ~= handles.Data_Misc.n_groups),(col_res ~= 1))
    warndlg('Size of response function does not match the required size of the energy bins','Warning')
    return;
end
% check the size of the cross-section of Nickel
[row_Ni,col_Ni] = size(Ni_Sigma);
if or((row_Ni ~= handles.Data_Misc.n_groups),(col_Ni ~= 1))
    warndlg('Size of Nickel cross-section does not match the required size of the energy bins','Warning')
    return;
end

disp(sprintf('The following results are for the response function: %s',Res_Fcn_name))

split = [];
for i = 1:handles.Data_Misc.n_Env
    split = [split 2];
end

prior_fluence = [];
for i=1:handles.Data_Misc.n_Env
    prior_fluence = [prior_fluence;handles.Data_Input{i,3}];
end

S = [];
for i=1:handles.Data_Misc.n_Env
    S = blkdiag(S,[Res_Fcn Ni_Sigma]);
end

prior_Res = S'*prior_fluence;
for i = 1:handles.Data_Misc.n_Env
    prior_Ratio(2*i-1) = prior_Res(2*i-1)/prior_Res(2*i);
    prior_Ratio(2*i) = prior_Res(2*i)/prior_Res(2*i);
end
prior_Ratio = prior_Ratio';
prior_Double_Ratio = prior_Ratio*diag(inv(diag(prior_Ratio)))';

F_prior_Res_Cov = inv(diag(prior_Res))*S'*cell2mat(handles.Data_Cov_Phi)*S*inv(diag(prior_Res));
[row col] = size(F_prior_Res_Cov);
for i = 1:row
    for j = 1:col
        F_prior_Ratio_Var(i,j) = F_prior_Res_Cov(i,i) + F_prior_Res_Cov(j,j) - 2*F_prior_Res_Cov(i,j);
    end
end
F_prior_Ratio_SD = sqrt(F_prior_Ratio_Var);

F_prior_Res_Cov_cell = mat2cell(F_prior_Res_Cov,split,split);
for i = 1:handles.Data_Misc.n_Env
    for j = 1:handles.Data_Misc.n_Env
        F_prior_Double_Ratio_Var(i,j) = [1 -1 -1 1]*[F_prior_Res_Cov_cell{i,i} F_prior_Res_Cov_cell{i,j};...
                                                     F_prior_Res_Cov_cell{j,i} F_prior_Res_Cov_cell{j,j}]*[1 -1 -1 1]';
    end
end
F_prior_Double_Ratio_SD = sqrt(F_prior_Double_Ratio_Var);

adjusted_Res = S'*Data_Output.Phi_1_k_adjusted;
for i = 1:handles.Data_Misc.n_Env
    adjusted_Ratio(2*i-1) = adjusted_Res(2*i-1)/adjusted_Res(2*i);
    adjusted_Ratio(2*i) = adjusted_Res(2*i)/adjusted_Res(2*i);
end
adjusted_Ratio = adjusted_Ratio';
adjusted_Double_Ratio = adjusted_Ratio*diag(inv(diag(adjusted_Ratio)))';

F_adjusted_Res_Cov = inv(diag(adjusted_Res))*S'*Data_Output.Cov_Phi_1_k_adjusted*S*inv(diag(adjusted_Res));
[row col] = size(F_adjusted_Res_Cov);
for i = 1:row
    for j = 1:col
        F_adjusted_Ratio_Var(i,j) = F_adjusted_Res_Cov(i,i) + F_adjusted_Res_Cov(j,j) - 2*F_adjusted_Res_Cov(i,j);
    end
end
F_adjusted_Ratio_SD = sqrt(F_adjusted_Ratio_Var);

F_adjusted_Res_Cov_cell = mat2cell(F_adjusted_Res_Cov,split,split);
for i = 1:handles.Data_Misc.n_Env
    for j = 1:handles.Data_Misc.n_Env
        F_adjusted_Double_Ratio_Var(i,j) = [1 -1 -1 1]*[F_adjusted_Res_Cov_cell{i,i} F_adjusted_Res_Cov_cell{i,j};...
                                                        F_adjusted_Res_Cov_cell{j,i} F_adjusted_Res_Cov_cell{j,j}]*[1 -1 -1 1]';
    end
end
F_adjusted_Double_Ratio_SD = sqrt(F_adjusted_Double_Ratio_Var);

disp('Ratio of the prior fluence(s) relative to Ni:')
disp(prior_Ratio)
disp('Fractional standard deviation of the ratio of prior fluence(s):')
disp(F_prior_Ratio_SD)
disp('Double ratio of the prior fluence(s):')
disp(prior_Double_Ratio)
disp('Fractional standard deviation of the double ratio of the prior fluence(s) [Env_i,Env_j]:')
disp(F_prior_Double_Ratio_SD)
disp('Ratio of the adjusted fluence(s) relative to Ni:')
disp(adjusted_Ratio)
disp('Fractional standard deviation of the ratio of adjusted fluence(s):')
disp(F_adjusted_Ratio_SD)
disp('Double ratio of the adjusted fluence(s):')
disp(adjusted_Double_Ratio)
disp('Fractional standard deviation of the double ratio of the adjusted fluence(s) [Env_i,Env_j]:')
disp(F_adjusted_Double_Ratio_SD)
disp('--------------------------------------------------------------------------')
assignin('base',sprintf('Prior_Ratio_%s',Res_Fcn_name),prior_Ratio);
assignin('base',sprintf('Fract_prior_Res_Cov_%s',Res_Fcn_name),F_prior_Res_Cov);
assignin('base',sprintf('Fract_prior_Ratio_SD_%s',Res_Fcn_name),F_prior_Ratio_SD);
assignin('base',sprintf('Prior_Double_Ratio_%s',Res_Fcn_name),prior_Double_Ratio);
assignin('base',sprintf('Fract_prior_Double_Ratio_SD_%s',Res_Fcn_name),F_prior_Double_Ratio_SD);
assignin('base',sprintf('Adjusted_Ratio_%s',Res_Fcn_name),adjusted_Ratio);
assignin('base',sprintf('Fract_adjusted_Res_Cov_%s',Res_Fcn_name),F_adjusted_Res_Cov);
assignin('base',sprintf('Fract_adjusted_Ratio_SD_%s',Res_Fcn_name),F_adjusted_Ratio_SD);
assignin('base',sprintf('Adjusted_Double_Ratio_%s',Res_Fcn_name),adjusted_Double_Ratio);
assignin('base',sprintf('Fract_adjusted_Double_Ratio_SD_%s',Res_Fcn_name),F_adjusted_Double_Ratio_SD);