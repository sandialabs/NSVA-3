function checkbox_Color(handles)
% update the colors of the checkboxes in respect to the normalization

checkboxList = grouping(handles,'checkbox');
set(checkboxList,'BackgroundColor',handles.Initial_BackgroundColor);

set(handles.Norm,'BackgroundColor',[1 0 0]);

if ~isfield(handles,'Data')
    return;
end
if ~isfield(handles.Data,'norm2isotope')
    return;
end
if ~isfield(handles.Data,'reaction')
    return;
end

set(handles.Norm,'BackgroundColor',[0,1,0]);

l = 0;
k = 0;
for i=1:34
    if handles.Data.reaction(i) == 0
        k = k+1;
    else
        l = l+1;
        k = k+1;
        if l == handles.Data.norm2isotope
            Change_Color = k;
        end
    end
end

set(checkboxList(Change_Color),'BackgroundColor',[0,1,0]);