function dP = poly_derivative(P)
    n = length(P);
    dP = P(1:n-1) .* (n-1:-1:1);
endfunction
