function [Res_Fcn Ni_Sigma Res_Fcn_name] = loadResponseFcn(Res_Fcn_type)
% This subfunction loads the response function

%initialize data
Res_Fcn = [];
Ni_Sigma = [];
Res_Fcn_name = '';

switch Res_Fcn_type
    case 'Total'
        filename = '\engine\ResponseFcn\Total.txt';
        path = pwd;
        path_Res_Fcn = [path filename];
        clear filename path;
        if exist(path_Res_Fcn,'file') == 2
            Res_Fcn = load(path_Res_Fcn);
        else
            warndlg('text file with response function is not available in the folder ResponseFcn','Warning')
            Res_Fcn = [];
            return;
        end
        Res_Fcn_name = 'Total';
    case '001MeV'
        filename = '\engine\ResponseFcn\001MeV.txt';
        path = pwd;
        path_Res_Fcn = [path filename];
        clear filename path;
        if exist(path_Res_Fcn,'file') == 2
            Res_Fcn = load(path_Res_Fcn);
        else
            warndlg('text file with response function is not available in the folder ResponseFcn','Warning')
            Res_Fcn = [];
            return;
        end
        Res_Fcn_name = '001MeV';
    case '1MeV'
        filename = '\engine\ResponseFcn\1Mev.txt';
        path = pwd;
        path_Res_Fcn = [path filename];
        clear filename path;
        if exist(path_Res_Fcn,'file') == 2
            Res_Fcn = load(path_Res_Fcn);
        else
            warndlg('text file with response function is not available in the folder ResponseFcn','Warning')
            Res_Fcn = [];
            return;
        end
        Res_Fcn_name = '1MeV';
    case '3MeV'
        filename = '\engine\ResponseFcn\3Mev.txt';
        path = pwd;
        path_Res_Fcn = [path filename];
        clear filename path;
        if exist(path_Res_Fcn,'file') == 2
            Res_Fcn = load(path_Res_Fcn);
        else
            warndlg('text file with response function is not available in the folder ResponseFcn','Warning')
            Res_Fcn = [];
            return;
        end
        Res_Fcn_name = '3MeV';
    case 'Si_Disp_Kerma'
        filename = '\engine\ResponseFcn\SiDispKerma.txt';
        path = pwd;
        path_Res_Fcn = [path filename];
        clear filename path;
        if exist(path_Res_Fcn,'file') == 2
            Res_Fcn = load(path_Res_Fcn);
        else
            warndlg('text file with response function is not available in the folder ResponseFcn','Warning')
            Res_Fcn = [];
            return;
        end
        Res_Fcn_name = 'Si_Disp_Kerma';
    case 'UserDefined'
        [filename, pathname, filterindex] = uigetfile(...
            {'*.xls','Exel Data File (*.xls)';...
            '*.txt','Text Data File (*.txt)'},...
            'Pick a Response Function');
        if isequal(filename,0) | isequal(pathname,0)
            sprintf('User pressed cancel\n')
            return;
        else
            switch filterindex
                case 1
                    Res_Fcn = xlsread(fullfile(pathname,filename));
                case 2
                    Res_Fcn = load(fullfile(pathname,filename));
                otherwise
                    warndlg('Response function cannot be loaded!','!! Warning !!');
                    return;
            end
        end
        Res_Fcn_name = filename(1:length(filename)-4);
        clear_space = findstr(Res_Fcn_name,' ');
        clear_space = sort(clear_space,'descend');
        for i=1:length(clear_space)
            Res_Fcn_name(clear_space(i)) = '';
        end
end
% Load cross-section of Nickel
filename = '\engine\ResponseFcn\ni58p-void-bare.txt';
path = pwd;
path_Ni_Sigma = [path filename];
clear filename path;
if exist(path_Ni_Sigma,'file') == 2
    Ni_Sigma = load(path_Ni_Sigma);
else
    warndlg('text file with cross-section of Nickel is not available in the folder ResponseFcn','Warning')
    Ni_Sigma = [];
    return;
end
end