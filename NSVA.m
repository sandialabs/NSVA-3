function varargout = NSVA(varargin)
% NSVA M-file for NSVA.fig
%      NSVA, by itself, creates a new NSVA or raises the existing
%      singleton*.
%
%      H = NSVA returns the handle to a new NSVA or the handle to
%      the existing singleton*.
%
%      NSVA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NSVA.M with the given input arguments.
%
%      NSVA('Property','Value',...) creates a new NSVA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NSVA_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NSVA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NSVA

% Last Modified by GUIDE v2.5 01-May-2008 13:36:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NSVA_OpeningFcn, ...
                   'gui_OutputFcn',  @NSVA_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before NSVA is made visible.
function NSVA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user file (see GUIDATA)
% varargin   command line arguments to NSVA (see VARARGIN)

% Choose default command line output for NSVA
handles.output = hObject;

% ============== DO NOT CHANGE ============================================
% Includes additional MATLAB search pathes
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
% ============== VERSION NUMBER ===========================================
handles.NSVA_version = '3.0';
% =========================================================================

% Initial Values and Reserve Space
% The order of Data in Data_Input:
%Data_Input{i} = {Am(1) | sd_Am(2) | Phi(3) | sd_Phi(4) | (5) | reduction(6) |
%S_phi(7) | S_Sigma(8) | decision(9) | reaction(10) | liststring(11) |
%Env#(12)} for ENV i
if ~isfield(handles,'Data_Input')
    handles.Data_Input = {};
end
%Data_Cor_Phi  = { CCPhi_11  CCPhi_12  CCPhi_13  CCPhi_14
%                  CCPhi_12' CCPhi_22  CCPhi_23  CCPhi_24
%                  CCPhi_13' CCPhi_23' CCPhi_33  CCPhi_34  (Comment: CCA_ii = Cor_i)   
%                  CCPhi_14' CCPhi_24' CCPhi_34' CCPhi_44 ...}
if ~isfield(handles,'Data_Cor_Phi')
    handles.Data_Cor_Phi = {};
end
%Data_Cor_A  = { CCA_11  CCA_12  CCA_13  CCA_14
%                CCA_12' CCA_22  CCA_23  CCA_24
%                CCA_13' CCA_23' CCA_33  CCA_34  (Comment: CCA_ii = Cor_i)   
%                CCA_14' CCA_24' CCA_34' CCA_44}
if ~isfield(handles,'Data_Cor_A')
    handles.Data_Cor_A = {};
end
%Data_Cov_Phi  = { CCPhi_11  CCPhi_12  CCPhi_13  CCPhi_14
%                  CCPhi_12' CCPhi_22  CCPhi_23  CCPhi_24
%                  CCPhi_13' CCPhi_23' CCPhi_33  CCPhi_34  (Comment: CCA_ii = Cov_i)   
%                  CCPhi_14' CCPhi_24' CCPhi_34' CCPhi_44 ...}
if ~isfield(handles,'Data_Cov_Phi')
    handles.Data_Cov_Phi = {};
end
%Data_Cov_A  = { CCA_11  CCA_12  CCA_13  CCA_14
%                CCA_12' CCA_22  CCA_23  CCA_24
%                CCA_13' CCA_23' CCA_33  CCA_34  (Comment: CCA_ii = Cov_i)   
%                CCA_14' CCA_24' CCA_34' CCA_44}
if ~isfield(handles,'Data_Cov_A')
    handles.Data_Cov_A = {};
end
%Data_Misc.n_Env = number of Enviroments
if ~isfield(handles,'Data_Misc')
    handles.Data_Misc.n_Env = 0;
    handles.Data_Misc.n_window = 0;
    handles.Data_Misc.n_reactions = 50; % Number of reactions
    handles.Data_Misc.n_groups = 89;    % Number of energy bins
    %In read_library_data
        %Data_Misc.Sigma = Cross-sections in matrix form
        %Data_Misc.Cov_Sigma = Covariance of the Cross-sections
        %Data_Misc.Sigma_stacked = Cross-sections in a column vector
    read_library_data
    handles.Data_Misc.Sigma = CrS;
    handles.Data_Misc.Cov_Sigma = Cova;
    handles.Data_Misc.Sigma_stacked = CrS_stacked;
end

% liststrings contain the data of the listbox
if ~isfield(handles,'liststring')
    handles.liststring = {};
end

% Update handles structure
guidata(hObject, handles);

% Call the first Environment window
if ~isfield(handles,'first_window')
    handles.first_window = true;
    New_Window_Callback(handles.New_Window, eventdata, handles);
end

% UIWAIT makes NSVA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NSVA_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user file (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function New_Window_Callback(hObject, eventdata, handles)
% hObject    handle to New_Window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user file (see GUIDATA)
% This function adds a new environment to the system

% Increase the number of Environments by 1 
handles.Data_Misc.n_window = handles.Data_Misc.n_window + 1;
% Current Environment
i = handles.Data_Misc.n_window;

handles.Environment(i) = Environment(i,handles.figure1);

% Update handles structure
guidata(hObject, handles);


% --------------------------------------------------------------------
function Run_Adjustment_Callback(hObject, eventdata, handles)
% hObject    handle to Run_Adjustment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user file (see GUIDATA)

% -------------------------------------------------------------------------
% Get number of loaded environments (Do not delete, handles.Data_Misc.n_Env
% will be used later on)
[handles.Data_Misc.n_Env,dummy] = size(handles.Data_Input);
guidata(hObject, handles);
% -------------------------------------------------------------------------
% Check if required Data is available
if isempty(handles.Data_Input)
    warndlg('No Environment is loaded yet. Please load an Environment first. Adjustment process aborted!','Warning');
    return;
end
% -------------------------------------------------------------------------
% Check_Correlation_Am/Phi checks if all Correlation and Cross-Correlation matrices are
% available. If not, empty cells will be filled with zeros!
Check_Correlation_Am(handles);
handles = guidata(hObject);
Check_Correlation_Phi(handles);
handles = guidata(hObject);
% -------------------------------------------------------------------------
% check if eigenvalues of total activity/fluence matrix is (semi-)definite
v = eig(cell2mat(handles.Data_Cor_A));
if min(v) <= -1e-6
    warndlg('The total activity correlation matrix is not positive (semi-)definite! Solution might be wrong.','Warning');
end % if
v = eig(cell2mat(handles.Data_Cor_Phi));
if min(v) <= -1e-6
    warndlg('The total fluence correlation matrix is not positive (semi-)definite! Solution might be wrong.','Warning');
end % if
% -------------------------------------------------------------------------

% Measuring computational performance
tic
% Create the sensitivity matrices
% S_phi
for i=1:handles.Data_Misc.n_Env
    handles.Data_Input{i,7} = sparse(Create_S_Phi(handles.Data_Misc.Sigma,handles.Data_Input{i,9}));
end
% S_Sigma
for i=1:handles.Data_Misc.n_Env
    handles.Data_Input{i,8} = sparse(Create_S_Sigma(handles.Data_Input{i,3},handles.Data_Input{i,9}));
end

% Create from the correlation matrices the covarience matrices
for i=1:handles.Data_Misc.n_Env
    for j=1:handles.Data_Misc.n_Env
        handles.Data_Cov_A{i,j} = sparse(diag(handles.Data_Input{i,1})*diag(handles.Data_Input{i,2})*handles.Data_Cor_A{i,j}*diag(handles.Data_Input{j,2})*diag(handles.Data_Input{j,1}));
        handles.Data_Cov_A{i,j}((handles.Data_Input{i,6} == 0),:) = []; % reduce covariance by row of Env i
        handles.Data_Cov_A{i,j}(:,(handles.Data_Input{j,6} == 0)) = []; % reduce covariance by column of Env j
        handles.Data_Cov_Phi{i,j} = sparse(diag(handles.Data_Input{i,3})*diag(handles.Data_Input{i,4})*handles.Data_Cor_Phi{i,j}*diag(handles.Data_Input{j,4})*diag(handles.Data_Input{j,3}));
    end
end

% Save Data_Cov to handles
guidata(hObject,handles);

% Reduce the measured activities by the deselected reactions
for i=1:handles.Data_Misc.n_Env
    handles.Data_Input{i,1}((handles.Data_Input{i,6} == 0),:) = [];
end

Data_Output = Equation(handles.Data_Input,handles.Data_Cov_Phi,handles.Data_Cov_A,handles.Data_Misc);

sprintf('CPU time for computation:')
toc

% Output on command window
command_out;

% Update Liststring
flag_liststring = false;
liststring = get(handles.Listbox,'String');
for counter = 1: length(liststring)
    if strcmp(liststring{counter},'Adjustment results');
        flag_liststring = true;
        break;
    end
end
if ~flag_liststring
    liststring{length(liststring)+1} = 'Adjustment results';
    set(handles.Listbox,'String',liststring);
end

% Save Data_Output to handles
handles = guidata(hObject); % Since handles was modified, it has to be renewed
handles.Data_Output = Data_Output;
handles.lib_cell = lib_cell;
guidata(hObject,handles);

% Save Data
Save_Data(handles);



% --------------------------------------------------------------------
function Run_Order_Data_Callback(hObject, eventdata, handles)
% hObject    handle to Run_Order_Data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user file (see GUIDATA)


% --- Executes on selection change in Listbox.
function Listbox_Callback(hObject, eventdata, handles)
% hObject    handle to Listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user file (see GUIDATA)

% Hints: contents = get(hObject,'String') returns Listbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Listbox


% --- Executes during object creation, after setting all properties.
function Listbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function CCF_Callback(hObject, eventdata, handles)
% hObject    handle to CCF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user file (see GUIDATA)

% Load the Fluence Cross Correlation between Env i & j
prompt = {'Enter # of Environment i:','Enter # of Environment j:'};
dlg_title = 'Input Fluence Cross Correlation';
num_lines = 1;
def = {'0','0'};
options.Resize='on'; % Doesn't work yet
answer = inputdlg(prompt,dlg_title,num_lines,def,options);
if isempty(answer)
    return;
end
sel_i = str2num(answer{1});
sel_j = str2num(answer{2});
if sel_i == sel_j
    warndlg('Cross-correlation of the same Environment not possible','Warning');
    return;
end

flagi = false;
flagj = false;
[row_Data_Input,column_Data_Input] = size(handles.Data_Input);
for counter = 1:row_Data_Input
    if sel_i == handles.Data_Input{counter,12}
        flagi = true;
        real_i = counter;
    end
    if sel_j == handles.Data_Input{counter,12}
        flagj = true;
        real_j = counter;
    end
end
if flagi && flagj
    load_CrossCor_Phi(real_i,real_j,hObject,handles);
else
    warndlg('One selected enviroment does not exist!','!! Warning !!');
end


% --------------------------------------------------------------------
function CCA_Callback(hObject, eventdata, handles)
% hObject    handle to CCA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user file (see GUIDATA)

% Load the Activity Cross Correlation between Env i & j
prompt = {'Enter # of Environment i:','Enter # of Environment j:'};
dlg_title = 'Input Activity Cross Correlation';
num_lines = 1;
def = {'0','0'};
options.Resize='on'; % Doesn't work yet
answer = inputdlg(prompt,dlg_title,num_lines,def,options);
if isempty(answer)
    return;
end
sel_i = str2num(answer{1});
sel_j = str2num(answer{2});
if sel_i == sel_j
    warndlg('Cross-correlation of the same Environment not possible','Warning');
    return;
end

flagi = false;
flagj = false;
[row_Data_Input,column_Data_Input] = size(handles.Data_Input);
for counter = 1:row_Data_Input
    if sel_i == handles.Data_Input{counter,12}
        flagi = true;
        real_i = counter;
    end
    if sel_j == handles.Data_Input{counter,12}
        flagj = true;
        real_j = counter;
    end
end
if flagi && flagj
    load_CrossCor_Am(real_i,real_j,hObject,handles);
else
    warndlg('One selected enviroment does not exist!','!! Warning !!');
end


% --------------------------------------------------------------------
function New_Data_Callback(hObject, eventdata, handles)
% hObject    handle to New_Data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user file (see GUIDATA)
if isfield(handles,'Data_Input')
    handles.Data_Input = {};
end
if isfield(handles,'Data_Cor_Phi')
    handles.Data_Cor_Phi = {};
end
if isfield(handles,'Data_Cor_A')
    handles.Data_Cor_A = {};
end
if isfield(handles,'Data_Cov_Phi')
    handles.Data_Cov_Phi = {};
end
if isfield(handles,'Data_Cov_A')
    handles.Data_Cov_A = {};
end
if isfield(handles,'Data_Misc')
    handles.Data_Misc.n_Env = 0;
end
if isfield(handles,'Data_Output')
    handles = rmfield(handles,'Data_Output');
end
% Update liststring in the Listbox
handles.liststring = {};
handles.liststring{1,3} = 'There are no environments loaded';
set(handles.Listbox,'String',handles.liststring);
handles.liststring = {};

guidata(hObject, handles);


% --------------------------------------------------------------------
function Eig_CCF_Callback(hObject, eventdata, handles)
% hObject    handle to Eig_CCF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get number of loaded environments
[handles.Data_Misc.n_Env,dummy] = size(handles.Data_Input);
guidata(hObject, handles);

% Check if required Data is available
if isempty(handles.Data_Input)
    warndlg('No Environment is loaded yet. Please load an Environment first. Adjustment process aborted!','Warning');
    return;
end % if
% Check_Correlation checks if all Correlation and Cross-Correlation matrices are
% available. If not, empty cells will be filled with zeros!
Check_Correlation_Phi(handles);
handles = guidata(hObject);
sprintf('Eigenvalues of the total fluence correlation matrix:')
v = eig(cell2mat(handles.Data_Cor_Phi))
if min(v) <= -1e-6
    warndlg('The total fluence correlation matrix is not positive (semi-)definite!','Warning');
else
    sprintf('Matrix is positive (semi-)definite')
end % if


% --------------------------------------------------------------------
function Eig_CCA_Callback(hObject, eventdata, handles)
% hObject    handle to Eig_CCA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get number of loaded environments
[handles.Data_Misc.n_Env,dummy] = size(handles.Data_Input);
guidata(hObject, handles);

% Check if required Data is available
if isempty(handles.Data_Input)
    warndlg('No Environment is loaded yet. Please load an Environment first. Adjustment process aborted!','Warning');
    return;
end % if
% Check_Correlation checks if all Correlation and Cross-Correlation matrices are
% available. If not, empty cells will be filled with zeros!
Check_Correlation_Am(handles);
handles = guidata(hObject);
sprintf('Eigenvalues of the total activity correlation matrix:')
v = eig(cell2mat(handles.Data_Cor_A))
if min(v) <= -1e-6
    warndlg('The total activity correlation matrix is not positive (semi-)definite!','Warning');
else
    sprintf('Matrix is positive (semi-)definite')
end % if

% --------------------------------------------------------------------
function Check_Eig_Cross_Callback(hObject, eventdata, handles)
% hObject    handle to Check_Eig_Cross (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Environment_Callback(hObject, eventdata, handles)
% hObject    handle to Environment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Run_Callback(hObject, eventdata, handles)
% hObject    handle to Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Add_CrossCor_Callback(hObject, eventdata, handles)
% hObject    handle to Add_CrossCor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Order_Am_Callback(hObject, eventdata, handles)
% hObject    handle to Order_Am (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
interface_OrderData;


% --------------------------------------------------------------------
function Order_CCA_Callback(hObject, eventdata, handles)
% hObject    handle to Order_CCA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
interface_Order_CC_Data;


% --------------------------------------------------------------------
function Data_Manu_Callback(hObject, eventdata, handles)
% hObject    handle to Data_Manu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Cor_figures_Callback(hObject, eventdata, handles)
% hObject    handle to Cor_figures (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Create_figures(handles);

% --------------------------------------------------------------------
function Phi_figures_Callback(hObject, eventdata, handles)
% hObject    handle to Phi_figures (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Create_figures_2(handles);



% --------------------------------------------------------------------
function Response_Fcn_Callback(hObject, eventdata, handles)
% hObject    handle to Response_Fcn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Fcn_total_Callback(hObject, eventdata, handles)
% hObject    handle to Fcn_total (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Response_Fcn(handles,'Total');




% --------------------------------------------------------------------
function smallMeV_Callback(hObject, eventdata, handles)
% hObject    handle to smallMeV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Response_Fcn(handles,'001MeV');

% --------------------------------------------------------------------
function OneMeV_Callback(hObject, eventdata, handles)
% hObject    handle to OneMeV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Response_Fcn(handles,'1MeV');



% --------------------------------------------------------------------
function ThreeMeV_Callback(hObject, eventdata, handles)
% hObject    handle to ThreeMeV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Response_Fcn(handles,'3MeV');



% --------------------------------------------------------------------
function SiDispKerma_Callback(hObject, eventdata, handles)
% hObject    handle to SiDispKerma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Response_Fcn(handles,'Si_Disp_Kerma');


% --------------------------------------------------------------------
function UserDefined_Callback(hObject, eventdata, handles)
% hObject    handle to UserDefined (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Response_Fcn(handles,'UserDefined');

