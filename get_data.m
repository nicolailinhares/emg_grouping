function data = get_data(filename)
    fid = fopen(filename);
    data = fscanf(fid, '%f %f');
    fclose(fid);