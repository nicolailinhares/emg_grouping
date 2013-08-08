function index = get_least_distance(matrix, vetor)
	[L C] = size(matrix);
    distances = sum((matrix - vetor(:,ones(1,C))).^2);
    [ord inds] = sort(distances);
    index = inds(1);
    