function varargout = interface_Order_CC_Data(varargin)
% INTERFACE_ORDER_CC_DATA M-file for interface_Order_CC_Data.fig
%      INTERFACE_ORDER_CC_DATA, by itself, creates a new INTERFACE_ORDER_CC_DATA or raises the existing
%      singleton*.%
%      H = INTERFACE_ORDER_CC_DATA returns the handle to a new INTERFACE_ORDER_CC_DATA or the handle to
%      the existing singleton*.
%
%      INTERFACE_ORDER_CC_DATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE_ORDER_CC_DATA.M with the given input arguments.
%
%      INTERFACE_ORDER_CC_DATA('Property','Value',...) creates a new INTERFACE_ORDER_CC_DATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface_Order_CC_Data_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface_Order_CC_Data_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface_Order_CC_Data

% Last Modified by GUIDE v2.5 27-Jun-2007 16:55:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_Order_CC_Data_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_Order_CC_Data_OutputFcn, ...
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


% --- Executes just before interface_Order_CC_Data is made visible.
function interface_Order_CC_Data_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface_Order_CC_Data (see VARARGIN)

% Choose default command line output for interface_Order_CC_Data
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% =========================================================================    
% ========================== SET INITIAL CONDITIONS =======================

% constants for the computation
handles.n_groups    = 89; % Number of energy groups
handles.n_reactions = 34; % Numver of reactions in the library
% set input format to "browse for .mat file
handles.input_format = 1;

guidata(hObject, handles);

% UIWAIT makes interface_Order_CC_Data wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface_Order_CC_Data_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in input_format.
function input_format_Callback(hObject, eventdata, handles)
% hObject    handle to input_format (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns input_format contents as cell array
%        contents{get(hObject,'Value')} returns selected item from input_format
val = get(hObject,'Value');
switch val
    case 1
        handles.input_format = 1;
    case 2
        handles.input_format = 2;
    case 3
        handles.input_format = 3;        
end
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function input_format_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_format (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% =========================================================================
% =========================================================================


% --- Executes on button press in m1.
function m1_Callback(hObject, eventdata, handles)
% hObject    handle to m1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.input_format == 1
    [name, path] = uigetfile({'*.mat'},'Select MatLab Data File');
    if path == 0
        return
    end    
    path_m = [path name];
    load(path_m);
    handles.m1 = m;
    set(hObject,'BackgroundColor','green');
elseif handles.input_format == 2
    [name, path] = uigetfile({'*.txt'},'Select text Data File');
    if path == 0
        return
    end    
    path_m = [path name];
    fid=fopen(path_m);
    m = fscanf(fid,'%e');
    handles.m1 = m;
    fclose(fid);
    set(hObject,'BackgroundColor','green');    
elseif handles.input_format == 3
    [name, path] = uigetfile({'*.xls'},'Select Exel Data File');
    if path == 0
        return
    end    
    path_m = [path name];
    m = xlsread(path_m);
    handles.m1 = m;
    set(hObject,'BackgroundColor','green');    
else
    sprintf('not defined jet')
end
guidata(hObject,handles)
if isempty(handles.m1)
    sprintf('Error!\nVector of prior order of the Activity Data was NOT saved')
else
    sprintf('Vector of prior order of the Activity Data accepted')
end

% =========================================================================
% =========================================================================


% --- Executes on button press in m2.
function m2_Callback(hObject, eventdata, handles)
% hObject    handle to m2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.input_format == 1
    [name, path] = uigetfile({'*.mat'},'Select MatLab Data File');
    if path == 0
        return
    end    
    path_m = [path name];
    load(path_m);
    handles.m2 = m;
    set(hObject,'BackgroundColor','green');    
elseif handles.input_format == 2
    [name, path] = uigetfile({'*.txt'},'Select text Data File');
    if path == 0
        return
    end    
    path_m = [path name];
    fid=fopen(path_m);
    m = fscanf(fid,'%e');
    handles.m2 = m;
    fclose(fid);
    set(hObject,'BackgroundColor','green');    
elseif handles.input_format == 3
    [name, path] = uigetfile({'*.xls'},'Select Exel Data File');
    if path == 0
        return
    end    
    path_m = [path name];
    m = xlsread(path_m);
    handles.m2 = m;
    set(hObject,'BackgroundColor','green');    
else
    sprintf('not defined jet')
end
guidata(hObject,handles)
if isempty(handles.m2)
    sprintf('Error!\nVector of prior order of the Activity Data was NOT saved')
else
    sprintf('Vector of prior order of the Activity Data accepted')
end

% =========================================================================
% =========================================================================


% --- Executes on button press in cca.
function cca_Callback(hObject, eventdata, handles)
% hObject    handle to cca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.input_format == 1
    [name, path] = uigetfile({'*.mat'},'Select MatLab Data File');
    if path == 0
        return
    end    
    path_CCA = [path name];
    load(path_CCA);
    handles.CCA = CCA;
    set(hObject,'BackgroundColor','green');    
elseif handles.input_format == 2
    [name, path] = uigetfile({'*.txt'},'Select text Data File');
    if path == 0
        return
    end    
    path_CCA = [path name];
    fid=fopen(path_CCA);
    CCA = fscanf(fid,'%e');
    handles.CCA = CCA;
    fclose(fid);
    set(hObject,'BackgroundColor','green');    
elseif handles.input_format == 3
    [name, path] = uigetfile({'*.xls'},'Select Exel Data File');
    if path == 0
        return
    end    
    path_CCA = [path name];
    CCA = xlsread(path_CCA);
    handles.CCA = CCA;
    set(hObject,'BackgroundColor','green');    
else
    sprintf('not defined jet')
end
guidata(hObject,handles)
if isempty(handles.CCA)
    sprintf('Error!\nActivity Correlation Matrix was NOT saved')
else
    sprintf('Activity Correlation Matrix accepted')
end

% =========================================================================
% =========================================================================


% --- Executes on button press in create_data.
function create_data_Callback(hObject, eventdata, handles)
% hObject    handle to create_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

nr = handles.n_reactions;
% Transfer the input Data
m1    = handles.m1;
m2    = handles.m2;
CCA   = handles.CCA;

% check dimensions of input data
dim = size(CCA);
if (dim(1)~=length(m1)) || (dim(2)~=length(m2))
    sprintf('Conflict in the Dimension of the provided Data\nPlease check the input.')
    return
end

% =========================================================================
% interface_order_cc_data sorting the data
    
    dim = size(CCA); 
    tmp = [CCA, m1];
    st_row = sortrows(tmp,[dim(2)+1]);
    tmp = [st_row(:, 1:dim(2))', m2];
    st_row = sortrows(tmp,[dim(1)+1]);
    CCA = st_row(:, 1:dim(1))';
    
% =========================================================================
% save data in MatLab data files 
path_cc = [pwd '\Re-Ordered Data\'];

% save in MatLab data files
save([path_cc '\cca.mat'], 'CCA');

% save in Exel files
xlswrite([path_cc '\cca'], CCA);

sprintf(['The activity cross correlation matrix was re-ordered successfully '... 
         'and has been saved in folder:\n\t%scca'],path_cc)

% =========================================================================
set(handles.m1,'BackgroundColor','red');
set(handles.m2,'BackgroundColor','red');
set(handles.cca,'BackgroundColor','red');
% =========================================================================

