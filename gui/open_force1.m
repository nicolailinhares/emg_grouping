function [data Fs] = open_force1(filename)

fid = fopen(filename);
data = fscanf(fid,'%g %g',[2 inf]);
Fs = 1/(data(1,2) - data(1,1));

