function change_tab(bt,struc)

names = fieldnames(struc);
for i = 1:length(names)
    curr = struc.(names{i});
    if(curr.button == bt)
        set(curr.panel, 'Visible', 'on');
        set(curr.button, 'Value', 1);
    else
        set(curr.panel, 'Visible', 'off');
        set(curr.button, 'Value', 0);
    end
end