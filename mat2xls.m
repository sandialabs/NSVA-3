%
% This function Start_mat2xls initiates the GUI interface and sets the path
%
% Hint:
% You can eigther press the push button 'run' on the Toolbar or simply
% press the button 'F5' on the keyboard.
%
% When you start this program from somewhere else than the MatLab default
% directory, a menu will show up with the following options:
%
% - Change MATLAB current directory
% - Add the directory to the top of the MATLAB path
% - Add the directory to the bottom of the MATLAB path
%
% per default the first option is marked in menu. This choice is also 
% suggested to execute this program. Other choices have not been tested
% completely and may cause errors in functions, that require a certain
% path to access or store data.

% ============== DO NOT CHANGE ============================================
% Includes additional MATLAB search pathes
addpath([pwd '\engine\mat2xls']);
addpath([pwd '\engine\preprocessing']);
addpath([pwd '\engine\postprocessing']);
addpath([pwd '\engine\library']);
addpath([pwd '\engine\computation']);
addpath([pwd '\engine\environment']);
addpath([pwd '\engine\environment\preprocessing']);
addpath([pwd '\engine\order_data']);
addpath([pwd '\engine\auxiliary']);
addpath([pwd '\engine\ResponseFcn']);
% =========================================================================

% Start the GUI
interface_mat2xls;