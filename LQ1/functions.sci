function Fx = F(x)
    Fx = [ x(1)^2 + x(2)^2 - 4;
           exp(x(1)) + x(2) - 1 ];
endfunction

function Jx = J(x)
    Jx = [ 2*x(1), 2*x(2);
           exp(x(1)), 1 ];
endfunction

function Fx= F(x)
    Fx= [ x(1)^2 + x(2) - 11;
              x(1) + x(2)^2 - 7 ];
endfunction

function Jx = J(x)
    Jx= [ 2*x(1), 1;
              1,      2*x(2) ];
endfunction
