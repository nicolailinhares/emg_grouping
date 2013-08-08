function vetor_red = dimension_reduction(matrix,vetor)
    t = cov(matrix');
    [u,s,v] = svd(t);
    ured = u(:,1:2);
    vetor_red = ured'*vetor;