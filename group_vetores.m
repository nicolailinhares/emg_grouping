function [grupos grupos_vetores] = group_vetores(mapa,vetores)
[LM CM] = size(mapa);
grupos_vetores = cell(1,CM);
grupos = cell(1,CM);
cont = ones(1,CM);
[L C] = size(vetores);
for i = 1:C
        vetor = vetores(:,i);
        index = get_least_distance(mapa,vetor);
        grupos_vetores{index}(:,cont(index)) = dimension_reduction(mapa,vetor);
        grupos{index}(cont(index)) = i;
        cont(index) = cont(index) + 1;
end