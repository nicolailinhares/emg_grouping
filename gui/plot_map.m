function grupos = plot_map(mapa,vetores,tar_axes)
[grupos grupos_vetores] = group_vetores(mapa{end},vetores);
for i = 1:length(grupos)
    parametros{3*i - 2} = grupos_vetores{i}(1,:);
    parametros{3*i - 1} = grupos_vetores{i}(2,:);
    parametros{3*i} = '*';
end
axes(tar_axes);
plot(parametros{:});
hold on;
[x y] = show_mapa(mapa{end});
plot(x,y,'k-*')
hold off;