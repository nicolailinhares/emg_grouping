%data2 = open_emg('Reginalda Laser.txt',2);
%canal12 = bsp_vector_split(data2(2,1:end-1),1000);
dados = processamento(emg_jan);
[vetores nomes] = gera_vetores(dados);
mapa = som(vetores,4,100);
[grupos grupos_vetores] = group_vetores(mapa{end},vetores);
for i = 1:length(grupos)
    parametros{3*i - 2} = grupos_vetores{i}(1,:);
    parametros{3*i - 1} = grupos_vetores{i}(2,:);
    parametros{3*i} = '*';
end
plot(parametros{:});
hold on;
[x y] = show_mapa(mapa{end});
plot(x,y,'k-*')
hold off;
figure;
group_sinal(canal12,grupos,1000);