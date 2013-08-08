function group_sinal(sinal_janelado,grupos,n)

for i = 1:length(grupos)
    eixox = [];
    eixoy = [];
    indice = 1;
    for j = 1:length(grupos{i})
        inicio = (grupos{i}(j)-1)*n;
        eixox(indice:indice+n-1) = inicio:(inicio+n-1);
        eixoy(indice:indice+n-1) = sinal_janelado{grupos{i}(j)};
        indice = indice+n;
    end
    parametros{3*i - 2} = eixox;
    parametros{3*i - 1} = eixoy;
    parametros{3*i} = '*';
end

plot(parametros{:});