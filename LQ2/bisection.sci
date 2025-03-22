 // Bisection Method
function [root, iter] = bisection(f, x0, x1, tol, max_iter)
    if f(x0) * f(x1) > 0 then
        error("Bisection requires opposite signs at initial guesses.");
    end
    iter = 0;
    while (x1 - x0)/2 > tol & iter < max_iter
        c = (x0 + x1)/2;
        fc = f(c);
        if fc == 0 then
            root = c;
            return;
        elseif f(x0) * fc < 0 then
            x1 = c;
        else
            x0 = c;
        end
        iter = iter + 1;
    end
    root = (x0 + x1)/2;
endfunction
