function show_data(sinal, carac_cell, n, descricao)
L = length(sinal);
x = n/2:n:L;
args = cell(1,2*length(carac_cell));
for i = 1:length(carac_cell)
    args{3*i-2} = x;
    args{3*i-1} = carac_cell{i}/max(carac_cell{i});
    args{3*i} = 'o';
end

plot(sinal/max(sinal));
hold on;
plot(args{:});
if nargin == 4
    legend(descricao{:});
end
line([(x + n/2);(x + n/2)],[linspace(-1,-1,length(x)); linspace(1,1,length(x))],'Color','magenta');