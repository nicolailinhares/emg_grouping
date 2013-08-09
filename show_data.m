function show_data(time, sinal, Fs, feature_set, n, descricao, ax)
L = length(sinal);
x = n/2:n:L;
cont = 1;
legenda{1} = 'Signal';
for i = 1:length(descricao)/2
    pai = descricao{2*i -1};
    filhos = descricao{2*i};
    for j = 1:length(filhos)
        carac_cell{cont} = feature_set.(pai).(filhos{j}).dados;
        legenda{cont + 1} = filhos{j};
        cont = cont + 1;
    end
end
args = cell(1,2*length(carac_cell));
for i = 1:length(carac_cell)
    args{3*i-2} = x*(1/Fs);
    args{3*i-1} = carac_cell{i}/max(carac_cell{i});
    args{3*i} = 'o';
end
axes(ax);
hold off;
plot(time,sinal/max(sinal));
hold on;
plot(args{:});
if nargin > 4
    legend(legenda{:});
end
line([(x*(1/Fs) + (n*(1/Fs))/2);(x*(1/Fs) + (n*(1/Fs))/2)],[linspace(-1,-1,length(x)); linspace(1,1,length(x))],'Color','magenta');