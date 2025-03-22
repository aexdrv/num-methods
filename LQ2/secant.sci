// Secant Method
function [root, iter] = secant(f, x0, x1, tol, max_iter)
    iter = 0;
    while iter < max_iter
        fx0 = f(x0);
        fx1 = f(x1);
        if abs(fx1 - fx0) < %eps then
            error("Zero denominator in secant method.");
        end
        x2 = x1 - fx1 * (x1 - x0) / (fx1 - fx0);
        if abs(x2 - x1) < tol then
            root = x2;
            return;
        end
        x0 = x1;
        x1 = x2;
        iter = iter + 1;
    end
    root = x1;
    warning("Maximum iterations reached in secant method.");
endfunction
