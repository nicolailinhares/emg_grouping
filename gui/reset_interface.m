function reset_interface(handles)
cla;
disable = {'button_tab2','off','button_tab3','off'};
group = {disable};
properties = {'Enable'};

for i = 1:length(group)
    subgroup = group{i};
    for j = 1:length(subgroup)/2
        elem = subgroup{2*j - 1};
        value = subgroup{2*j};
        set(handles.(elem),properties{i},value);
    end
end