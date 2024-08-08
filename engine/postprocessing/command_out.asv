% Output on command window

% Print out contribution of each reaction towards Chi Square
fprintf(1,'\nContribution of each reaction:\n')
library;    % Read library data: handles.lib
% Create a list of all included reactions
for i = 1:handles.Data_Misc.n_Env
    lib = handles.lib;
    lib((handles.Data_Input{i,9} == 0),:) = [];
    lib_cell{i,1} = lib;
end
lib_mat = cell2mat(lib_cell);
% Add included reactions and their chi square contribution together
screen_output = {lib_mat , num2str(Data_Output.chi_square_reaction)};
cell2mat(screen_output)

% Print out chi square
fprintf(1,'\nChi Square: %g\n', Data_Output.chi_square)
