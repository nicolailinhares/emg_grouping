function y = bsp_resample(signal, Fs, new_Fs)
ratio = round(Fs/new_Fs);
L = round(length(signal)/ratio);
y = signal(1:L*ratio);
y = reshape(y,ratio,L);
y = median(y);
