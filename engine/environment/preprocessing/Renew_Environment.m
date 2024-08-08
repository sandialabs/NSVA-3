function handles = Renew_Environment(handles)
% This function reset the environment window to the initial state

% Remove Data and liststring from handles 
if isfield(handles,'Data')
    handles = rmfield(handles,'Data');
end
if isfield(handles,'liststring')
    handles.liststring = {};
end

% Set buttons to initial color
buttonList = grouping(handles,'button');
set(buttonList,'BackgroundColor',[1 0 0]);
% Uncheck all checkboxes
checkboxList = grouping(handles,'checkbox');
set(checkboxList,'Value', 0);
% Set checkboxes to initial color
checkbox_Color(handles);
% Uncheck all radiobuttons
radiobuttonList = grouping(handles,'radiobutton');
set(radiobuttonList,'Value', 0);

% Initial visibility of the panel 1
set(handles.uipanel1, 'Visible', 'on');
set(handles.uipanel2, 'Visible', 'off');
set(handles.uipanel3, 'Visible', 'off');
set(handles.uipanel4, 'Visible', 'off');
