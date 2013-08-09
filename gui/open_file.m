function [data Fs location] = open_file(title, location, func)
[filename, pathname] = uigetfile( ...
            {'*.txt','ASCII File (*.txt)'}, ...
            title, location);
filename = [pathname filename];
location = pathname;
[data Fs] = func(filename);