function [data Fs] = open_emg1(filename)
    fid = fopen(filename);
    str = '';
    while isempty(strfind(str,'[Taxa de amostragem'))
        str = fgetl(fid);
    end
    ind = strfind(str, '=');
    Fs = str2double(str(ind(1)+1:end-3));
    while isempty(strfind(str,'[Dados]'))
        str = fgetl(fid);
    end
    emg = fscanf(fid, '%f');
    fclose(fid);
    time = 0:1/Fs:(length(emg)-1)/Fs;
    data(1,:) = time;
    data(2,:) = emg;
    
    