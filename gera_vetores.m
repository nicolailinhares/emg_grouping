function [vetores nomes] = gera_vetores(dados)
campos = fieldnames(dados);
cont = 1;
for i = 1:length(campos)
    campos_filhos = dados.(campos{i});
    nomes_campos_filhos = fieldnames(campos_filhos);
    for j = 1:length(nomes_campos_filhos)
        campos_netos = campos_filhos.(nomes_campos_filhos{j});
        data = campos_netos.dados;
        vetores(cont,1:length(data)) = (data - mean(data))/(max(data) - min(data));
        nomes{cont} = nomes_campos_filhos{j};
        cont = cont + 1;
    end
end