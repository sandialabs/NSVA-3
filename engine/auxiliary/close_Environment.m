function close_Environment

handles = guidata(gcf);
handles_NSVA = guidata(handles.figure_NSVA);

for i = 1:length(handles_NSVA.Environment)
    if handles.figure1 == handles_NSVA.Environment(i)
        handles_NSVA.Environment(i) = [];
        break;
    end
end
guidata(handles.figure_NSVA, handles_NSVA);

closereq;

end