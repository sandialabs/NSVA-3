function close_NSVA

handles = guidata(gcf);

close(handles.Environment);

closereq;

end