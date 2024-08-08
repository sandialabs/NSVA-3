function varargout = Environment(varargin)
% ENVIRONMENT M-file for Environment.fig
%      ENVIRONMENT, by itself, creates a new ENVIRONMENT or raises the existing
%      singleton*.
%
%      H = ENVIRONMENT returns the handle to a new ENVIRONMENT or the handle to
%      the existing singleton*.
%
%      ENVIRONMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENVIRONMENT.M with the given input arguments.
%
%      ENVIRONMENT('Property','Value',...) creates a new ENVIRONMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Environment_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Environment_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Environment

% Last Modified by GUIDE v2.5 15-Oct-2007 13:48:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Environment_OpeningFcn, ...
                   'gui_OutputFcn',  @Environment_OutputFcn, ...
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


% --- Executes just before Environment is made visible.
function Environment_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Environment (see VARARGIN)

% Choose default command line output for Environment
handles.output = hObject;

% Initial visibility of the panel 1
set(handles.uipanel1, 'Visible', 'on');
set(handles.uipanel2, 'Visible', 'off');
set(handles.uipanel3, 'Visible', 'off');
set(handles.uipanel4, 'Visible', 'off');
set(handles.uipanel5, 'Visible', 'off');

% --- Data transfered to Environment --------------------------------------
handles.n = varargin{1}; % # of Environment
handles.figure_NSVA = varargin{2}; % handle of NSVA
% -------------------------------------------------------------------------
% --- Save initial Background Color ---------------------------------------
if ~isfield(handles,'Initial_BackgroundColor')
    handles.Initial_BackgroundColor = get(handles.checkbox1,'BackgroundColor');
end
% -------------------------------------------------------------------------

% set values for # of reactions and energy groups
handles.n_groups = 89;    % Number of energy groups
handles.n_reactions = 50; % Number of reactions in the library
% create list of all reactions in the library
library

% Update Text in Gui
set(handles.Reaction_Text,'String',sprintf('Reactions of Environment %i',handles.n));
set(handles.Load_Reactions,'String',sprintf('Load Reactions for Env.%i',handles.n));

% --- Initial Values and Reserve Space ------------------------------------
%Data = struct(Am Am_SD Am_Cor| Phi Phi_SD Phi_Cor| selection reaction | norm2isotpe) for ENV i
if ~isfield(handles,'Data')
    % set initial values for the reference vectors
    handles.Data.reaction = zeros(handles.n_reactions,1);
    handles.Data.selection = ones(handles.n_reactions,1);
end
% liststrings contain the data of the listbox
if ~isfield(handles,'liststring')
    handles.liststring = {};
end
% -------------------------------------------------------------------------

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Environment wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Environment_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%% Gui Boxes for Environment
% --- Executes on button press in checkbox31.
function checkbox31_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox31
i = 31;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox32.
function checkbox32_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox32
i = 32;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
i = 1;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox33.
function checkbox33_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox33
i = 33;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
i = 2;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox34.
function checkbox34_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox34
i = 34;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton34.
function radiobutton34_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton34
i = 34;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton31.
function radiobutton31_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton31
i = 31;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox21.
function checkbox21_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox21
i = 21;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton21.
function radiobutton21_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton21
i = 21;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox22.
function checkbox22_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox22
i = 22;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6
i = 6;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox23.
function checkbox23_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox23
i = 23;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton23.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton23
i = 7;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton24.
function radiobutton24_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton24
i = 24;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox25.
function checkbox25_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox25
i = 25;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9
i = 9;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox26.
function checkbox26_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox26
i = 26;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton26.
function radiobutton26_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton26
i = 26;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox27.
function checkbox27_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox27
i = 27;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton11.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton11
i = 11;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox28.
function checkbox28_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox28
i = 28;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton12
i = 12;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox30.
function checkbox30_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox30
i = 30;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton13.
function radiobutton13_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton13
i = 13;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox29.
function checkbox29_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox29
i = 29;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton14.
function radiobutton14_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton14
i = 14;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox24.
function checkbox24_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox24
i = 24;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11
i = 11;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12
i = 12;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox13.
function checkbox13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox13
i = 13;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox14.
function checkbox14_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox14
i = 14;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox15.
function checkbox15_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox15
i = 15;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton15.
function radiobutton15_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton15
i = 15;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox16.
function checkbox16_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox16
i = 16;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton16.
function radiobutton16_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton16
i = 16;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox17.
function checkbox17_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox17
i = 17;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton17.
function radiobutton17_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton17
i = 17;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox18.
function checkbox18_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox18
i = 18;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox20.
function checkbox20_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox20
i = 20;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton23.
function radiobutton23_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton23
i = 23;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox19.
function checkbox19_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox19
i = 19;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton18.
function radiobutton18_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton18
i = 18;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
i = 1;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
i = 2;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
i = 3;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
i = 4;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5
i = 5;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6
i = 6;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7
i = 7;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8
i = 8;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10
i = 10;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9
i = 9;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
i = 3;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
i = 4;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8
i = 8;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10
i = 10;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton20.
function radiobutton20_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton20
i = 20;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton22.
function radiobutton22_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton22
i = 22;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton25.
function radiobutton25_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton25
i = 25;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton27.
function radiobutton27_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton27
i = 27;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton28.
function radiobutton28_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton28
i = 28;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton29.
function radiobutton29_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton29
i = 29;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton30.
function radiobutton30_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton30
i = 30;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton32.
function radiobutton32_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton32
i = 32;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton33.
function radiobutton33_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton33
i = 33;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton19.
function radiobutton19_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton19
i = 19;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
i = 5;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);

% --- Executes on button press in checkbox35.
function checkbox35_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox35
i = 35;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);

% --- Executes on button press in checkbox36.
function checkbox36_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox36
i = 36;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton36.
function radiobutton36_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton36
i = 36;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox37.
function checkbox37_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox37
i = 37;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton37.
function radiobutton37_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton37
i = 37;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox38.
function checkbox38_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox38
i = 38;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton38.
function radiobutton38_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton38
i = 38;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton35.
function radiobutton35_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton35
i = 35;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox39.
function checkbox39_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox39
i = 39;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton39.
function radiobutton39_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton39
i = 39;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox40.
function checkbox40_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox40
i = 40;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton40.
function radiobutton40_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton40
i = 40;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox41.
function checkbox41_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox41
i = 41;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox42.
function checkbox42_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox42
i = 42;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton42.
function radiobutton42_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton42
i = 42;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox43.
function checkbox43_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox43
i = 43;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton43.
function radiobutton43_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton43
i = 43;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox44.
function checkbox44_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox44
i = 44;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton44.
function radiobutton44_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton44
i = 44;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton41.
function radiobutton41_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton41
i = 41;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox45.
function checkbox45_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox45
i = 45;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox46.
function checkbox46_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox46
i = 46;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton46.
function radiobutton46_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton46
i = 46;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox47.
function checkbox47_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox47
i = 47;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton47.
function radiobutton47_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton47
i = 47;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox48.
function checkbox48_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox48
i = 48;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton48.
function radiobutton48_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton48
i = 48;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton45.
function radiobutton45_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton45
i = 45;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox49.
function checkbox49_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox49
i = 49;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton49.
function radiobutton49_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton49
i = 49;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in checkbox50.
function checkbox50_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox50
i = 50;
handles = checkbox_click(i,hObject,handles);
guidata(hObject, handles);


% --- Executes on button press in radiobutton50.
function radiobutton50_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton50
i = 50;
handles = radiobutton_click(i,hObject,handles);
guidata(hObject, handles);
%%
% --- Executes on button press in Load_Fluence.
function Load_Fluence_Callback(hObject, eventdata, handles)
% hObject    handle to Load_Fluence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load_Phi(hObject,handles);

% --- Executes on button press in Load_Fluence_SD.
function Load_Fluence_SD_Callback(hObject, eventdata, handles)
% hObject    handle to Load_Fluence_SD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load_sd_Phi(hObject,handles);

% --- Executes on button press in Load_Fluence_Cor.
function Load_Fluence_Cor_Callback(hObject, eventdata, handles)
% hObject    handle to Load_Fluence_Cor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load_Cor_Phi(hObject,handles);

% --- Executes on button press in Load_Activity.
function Load_Activity_Callback(hObject, eventdata, handles)
% hObject    handle to Load_Activity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load_Am(hObject,handles);

% --- Executes on button press in Load_Load_Activity_SD.
function Load_Activity_SD_Callback(hObject, eventdata, handles)
% hObject    handle to Load_Load_Activity_SD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load_sd_Am(hObject,handles);

% --- Executes on button press in Load_Load_Activity_Cor.
function Load_Activity_Cor_Callback(hObject, eventdata, handles)
% hObject    handle to Load_Load_Activity_Cor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load_Cor_Am(hObject,handles);

% --- Executes on button press in Norm.
function Norm_Callback(hObject, eventdata, handles)
% hObject    handle to Norm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles.Data,'norm2isotope')
    handles.Data = rmfield(handles.Data,'norm2isotope');
end
Normalize_Phi(handles);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Change visibility of the panels
set(handles.uipanel1, 'Visible', 'on');
set(handles.uipanel2, 'Visible', 'off');
set(handles.uipanel3, 'Visible', 'off');
set(handles.uipanel4, 'Visible', 'off');
set(handles.uipanel5, 'Visible', 'off');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Change visibility of the panels
set(handles.uipanel1, 'Visible', 'off');
set(handles.uipanel2, 'Visible', 'on');
set(handles.uipanel3, 'Visible', 'off');
set(handles.uipanel4, 'Visible', 'off');
set(handles.uipanel5, 'Visible', 'off');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Change visibility of the panels
set(handles.uipanel1, 'Visible', 'off');
set(handles.uipanel2, 'Visible', 'off');
set(handles.uipanel3, 'Visible', 'on');
set(handles.uipanel4, 'Visible', 'off');
set(handles.uipanel5, 'Visible', 'off');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Change visibility of the panels
set(handles.uipanel1, 'Visible', 'off');
set(handles.uipanel2, 'Visible', 'off');
set(handles.uipanel3, 'Visible', 'off');
set(handles.uipanel4, 'Visible', 'on');
set(handles.uipanel5, 'Visible', 'off');


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Change visibility of the panels
set(handles.uipanel1, 'Visible', 'off');
set(handles.uipanel2, 'Visible', 'off');
set(handles.uipanel3, 'Visible', 'off');
set(handles.uipanel4, 'Visible', 'off');
set(handles.uipanel5, 'Visible', 'on');


% --- Executes on button press in Load_Reactions.
function Load_Reactions_Callback(hObject, eventdata, handles)
% hObject    handle to Load_Reactions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load_reactions(hObject, handles);

% --- Executes on button press in Include.
function Include_Callback(hObject, eventdata, handles)
% hObject    handle to Include (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
include_Data(hObject,handles);

% --------------------------------------------------------------------
function Load_Callback(hObject, eventdata, handles)
% hObject    handle to Load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load pathes to the selected data
[filename, pathname] = uigetfile({'*.mat', 'MATLAB-file'},'Load Input Data');
if isequal(filename,0) | isequal(pathname,0)
    sprintf('User selected Cancel. No data were loaded')
else
    % Set figure to initial settings 
    handles = Renew_Environment(handles);
    handlesRescue = handles;            % Save handles for being overwritten
    load(fullfile(pathname,filename));
    handles = handlesRescue; clear handlesRescue
    % Check version number (They have to match in order to load Data)
    if ~exist('NSVA_version','var')
        handles_NSVA = guidata(handles.figure_NSVA);
        warndlg(sprintf('Data cannot be loaded because it is either not an environment data or the NSVA-version does not match. Please load environment data for version %s. Data is rejected',handles_NSVA.NSVA_version),'Warning'); 
        return;
    end
    if exist('Data','var')
        handles.Data = Data;
        % update figures appearance
        update_figure(handles);
        % update liststring
        handles = update_liststring(handles);
    end
    % Text print in command window
    sprintf('Data from %s were loaded into Environment %i',fullfile(pathname,filename),handles.n)
end
% Store handles structure
guidata(hObject, handles);


% --------------------------------------------------------------------
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Save pathes to the selected data
[filename, pathname] = uiputfile({'*.mat', 'MATLAB-file (*.mat)'},'Save Input Data as');
if isequal(filename,0) | isequal(pathname,0)
    sprintf('User selected Cancel. No data were saved!')
    return;
else
    if isfield(handles,'Data')
        Data = handles.Data;
        handles_NSVA = guidata(handles.figure_NSVA);
        NSVA_version = handles_NSVA.NSVA_version;
        save(fullfile(pathname,filename),'Data','NSVA_version');
    else
        sprintf('No data exist to be saved');
    end
end



% --------------------------------------------------------------------
function New_Callback(hObject, eventdata, handles)
% hObject    handle to New (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles = Renew_Environment(handles);

% Store handles structure
guidata(hObject, handles);

% Text print in command window
sprintf('Reset Environment %i',handles.n)







