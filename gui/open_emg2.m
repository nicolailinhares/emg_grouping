function [data Fs] = open_emg2(filename)
    fid = fopen(filename);
    data = fscanf(fid, '%g %g %g %g', [4 inf]);
    fclose(fid);
    Fs = 1/(data(1,2) - data(1,1));