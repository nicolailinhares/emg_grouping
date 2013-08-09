function show_data(time, sinal, Fs, carac_cell, n, descricao, ax)
L = length(sinal);
x = n/2:n:L;
args = cell(1,2*length(carac_cell));
for i = 1:length(carac_cell)
    args{3*i-2} = x*(1/Fs);
    args{3*i-1} = carac_cell{i}/max(carac_cell{i});
    args{3*i} = 'o';
end
axes(ax);
plot(time,sinal/max(sinal));
hold on;
plot(args{:});
if nargin > 4
    legend(descricao{:});
end
line([(x*(1/Fs) + (n*(1/Fs))/2);(x*(1/Fs) + (n*(1/Fs))/2)],[linspace(-1,-1,length(x)); linspace(1,1,length(x))],'Color','magenta');