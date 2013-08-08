function emg = open_emg(filename, canal)
    fid = fopen(filename);
    t = '%g';
    for i = 1:canal
        t = [t ' %g'];
    end
    emg = fscanf(fid, t, [canal+1 inf]);