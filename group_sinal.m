function ativacao_grupos = group_sinal(sinal_janelado,grupos,n,Fs,tar_axes)

for i = 1:length(grupos)
    eixox = [];
    eixoy = [];
    degrau = [];
    indice = 1;
    anterior = -2*n;
    for j = 1:length(grupos{i})
        inicio = (grupos{i}(j)-1)*n;
        eixox(indice:indice+n-1) = inicio:(inicio+n-1);
        sinal = zeros(1,n);
        temp = sinal_janelado{grupos{i}(j)};
        sinal(1:length(temp)) = temp;
        eixoy(indice:indice+n-1) = sinal;
        active = ones(1,n);
        active(1) = 0;
        active(end) = 0;
        degrau(indice:indice+n-1) = active;
        indice = indice+n;
        if inicio/n - anterior/n == 1
            degrau(indice - n - 1:indice - n) = [1 1];
        end
        anterior = inicio;
    end
    parametros{3*i - 2} = eixox*1/Fs;
    parametros{3*i - 1} = eixoy;
    parametros{3*i} = '*';
    ativacao_grupos{2*i-1} = eixox*1/Fs;
    ativacao_grupos{2*i} = degrau;
end
if nargin > 3
    plot(tar_axes,parametros{:});
else
    plot(parametros{:});
end