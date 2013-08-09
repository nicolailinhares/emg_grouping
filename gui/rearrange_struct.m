function arrange = rearrange_struct(parent, children)
parent_names = fieldnames(parent);
children_names = fieldnames(children);
for i = 1:length(parent_names)
    inds = parent.(parent_names{i});
    features = cell(1,1);
    cont = 1;
    for j = inds(1):inds(2)
        st = children.(children_names{j});
        name = st.parent;
        if st.active == 1
            features{cont} = st.feat;
            cont = cont +1;
        end
    end
    if cont > 1
        arrange{2*i - 1} = name;
        arrange{2*i} = features;
    end
end