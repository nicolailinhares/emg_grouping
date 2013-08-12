function set_features_menu(handles,features_struct)
names = fieldnames(features_struct);
for i = 1:length(names)
    set(handles.(names{i}), 'Value', features_struct.(names{i}).active);
end