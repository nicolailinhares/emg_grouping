function estrutura = executa_struct(est,janela,janela2)
    campos = fieldnames(est);
    for i = 1:length(campos)
        subcampos = est.(campos{i});
        dados = subcampos.dados;
        if isfield(subcampos,'funcao')
            fh = str2func(subcampos.funcao);
        else
            fh = str2func(campos{i});
        end
        subcampos.parametros{1} = janela;
        if nargin == 3
            subcampos.parametros{2} = janela2;
        end
        if isfield(subcampos,'pos')
            temp = fh(subcampos.parametros{:});
            dados(end+1) = subcampos.pos(temp);
        else
            dados(end+1) = fh(subcampos.parametros{:});
        end
        subcampos.dados = dados;
        maximo = max(dados);
        if maximo == 0
            maximo = 1;
        end
        subcampos.vari = var(dados/maximo);
        est.(campos{i}) = subcampos;
        
    end
    estrutura = est;