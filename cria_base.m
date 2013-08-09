function base = cria_base(celula,funcao,pos)
    base = struct('dados',[],'parametros',{celula});
    if nargin >= 2 && ~isempty(funcao)
        base.funcao = funcao;
    end
    if nargin == 3
        base.pos = pos;
    end