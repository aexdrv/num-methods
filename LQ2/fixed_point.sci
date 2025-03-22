// Fixed-Point Iteration
function [root, iter] = fixed_point(g, x0, tol, max_iter)
    iter = 0;
    
    // header han table
    disp(" Iter |      x_(i-1)          |        g(x_i-1)    |       x_(i)");
    disp("----------------------------------");

    while iter < max_iter
        x1 = g(x0);
        if abs(x1 - x0) < tol then
            root = x1;
            return;
        end
        z=polyval(OriginalP, x0)
        mprintf("   %d . %f  %f . %f \n", iter, x0, z, x1 );
        x0 = x1;
        iter = iter + 1;
    end
    root = x0;
    warning("Maximum iterations reached.");
endfunction
