% type: sriptfile
% describtion: saves the data in assigned filename as Exel file

% ----- Data, that will be written out ------------------------------------

% prior_fluence_std_pc
% fluence_adjustment_pc
% adjusted_flux_std
% prior_activity_std_pc
% activity_adjustment_pc
% adjusted_activity_std
% -------------------------------------------------------------------------

%Data_Input{i} = {Am(1) | sd_Am(2) | Phi(3) | sd_Phi(4) | (5) | reduction(6) |
%S_phi(7) | S_Sigma(8) | decision(9) | reaction(10) | liststring(11) |
%Env#(12)} for ENV i

% =========================================================================
path_data = fullfile(pathname, filename);
warning off MATLAB:xlswrite:AddSheet

for counter = 1:handles.Data_Misc.n_Env
    % Prepare data for output
        % Initiate data ---------
        XLS_data_1 = [];
        XLS_data_2 = {};
        library;
        counter3 = 1;
        % -----------------------
    XLS_data_1 = [Fluence_Standard_Deviation_Prior{counter} Fluence_Adjustment_in_Percent{counter} Fluence_Standard_Deviation_Adjusted{counter}];
    for counter2 = 1:handles.Data_Misc.n_reactions
        if handles.Data_Input{counter,9}(counter2)
            XLS_data_2{counter2,1} = handles.lib(counter2,:);
            XLS_data_2{counter2,2} = Activities_Standard_Deviation_Prior{counter}(counter3);
            XLS_data_2{counter2,3} = Activities_Adjustment_in_Percent{counter}(counter3);
            XLS_data_2{counter2,4} = Activities_Standard_Deviation_Adjusted{counter}(counter3);
            counter3 = counter3 + 1;
        end
    end
    
    % Output into exel file
    definition  = {'Chi square','Prior standard deviations in %','Adjustment in %','New standard eviations in %','','Included reactions'...
                    ,'Prior standard deviations in %','Adjustment in %','New standard eviations in %'};
    xlswrite(path_data, {sprintf('Fluence Data of Environment %i',counter),'','','',sprintf('Activity Data of Environment %i',counter)},sprintf('ENV %i',handles.Data_Input{counter,12}),'B1');
    xlswrite(path_data, definition, sprintf('ENV %i',handles.Data_Input{counter,12}),'A3');
    xlswrite(path_data, handles.Data_Output.chi_square ,sprintf('ENV %i',handles.Data_Input{counter,12}),'A4');
    xlswrite(path_data, XLS_data_1 ,sprintf('ENV %i',handles.Data_Input{counter,12}),'B4');
    xlswrite(path_data, XLS_data_2 ,sprintf('ENV %i',handles.Data_Input{counter,12}),'F4');    
end % for (outer loop)

