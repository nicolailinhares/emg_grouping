function [x y] = show_mapa(matrix)
[L C] = size(matrix);
vetores = zeros(2,C);
for i = 1:C
    vetores(:,i) = dimension_reduction(matrix,matrix(:,i));
end
x = vetores(1,:);
y = vetores(2,:);