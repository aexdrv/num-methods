function Q = synthetic_division(P, root)
    n = length(P);
    Q = zeros(1, n-1);
    Q(1) = P(1);
    for i = 2:n-1
        Q(i) = P(i) + Q(i-1) * root;
    end
endfunction
