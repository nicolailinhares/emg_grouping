function struc = create_tab_struct(elements)
struc = struct;
for i = 2:2:length(elements)
    struc.(['opcao' num2str(i-1)]) = struct('button', elements{i-1}, 'panel', elements{i});    
end