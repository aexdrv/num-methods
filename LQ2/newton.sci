// Newton's Method
function [root, iter] = newton(f, df, x0, tol, max_iter)
    iter = 0;
    while iter < max_iter
        fx = f(x0);
        dfx = df(x0);
        if dfx == 0 then
            error("Derivative zero");
        end
        x1 = x0 - fx / dfx;
        if abs(x1 - x0) < tol then
            root = x1;
            return;
        end
        x0 = x1;
        iter = iter + 1;
    end
    root = x0;
    warning("Maximum iterations reached");
endfunction
