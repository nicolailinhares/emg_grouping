function reset_interface(handles,features_parent_struct, features_struct)
cla;
disable = {'button_tab2','off','button_tab3','off', 'process_button', 'off', 'feature_check', 'off', 'save_analysis', 'off'};
group = {disable};
properties = {'Enable'};
eixos = {'emg_axes', 'force_axes', 'features_axes', 'map_axes', 'grouped_signal_axes'};
for i = 1:length(group)
    subgroup = group{i};
    for j = 1:length(subgroup)/2
        elem = subgroup{2*j - 1};
        value = subgroup{2*j};
        set(handles.(elem),properties{i},value);
    end
end

for i = 1:length(eixos)
    cla(handles.(eixos{i}));
end

parent_names = fieldnames(features_parent_struct);
children_names = fieldnames(features_struct);
for i = 1:length(parent_names)
    set(handles.(parent_names{i}),'Enable','off');
    set(handles.(parent_names{i}),'Value',0);
end
for i = 1:length(children_names)
    set(handles.(children_names{i}),'Enable','off');
    set(handles.(children_names{i}),'Value',0);
end