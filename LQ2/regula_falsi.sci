function [root, iter] = regula_falsi(f, x0, x1, tol, max_iter)
    iter = 0;
    f0 = f(x0);
    f1 = f(x1);

    // Check if the initial points have opposite signs
    if f0 * f1 > 0 then
        error("Regula Falsi requires f(x0) and f(x1) to have opposite signs.");
    end

    while iter < max_iter
        // Compute next approximation using the Regula Falsi formula
        x_new = x1 - (f1 * (x1 - x0)) / (f1 - f0);
        f_new = f(x_new);
        
        // Check for convergence
        if abs(f_new) < tol then
            root = x_new;
            return;
        end
        
        // Update values while maintaining sign change condition
        if f0 * f_new < 0 then
            x1 = x_new;
            f1 = f_new;
        else
            x0 = x_new;
            f0 = f_new;
        end
        
        iter = iter + 1;
    end
    
    root = x_new;
    warning("Maximum iterations reached.");
endfunction
