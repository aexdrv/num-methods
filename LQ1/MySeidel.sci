function [x, f, convi, iter] = MySeidel(x0, tol, maxiter)
    x = x0;
    n = length(x);
    
    for iter = 1:maxiter
        x_old = x;
        for i = 1:n
            Fx = F(x);  
            Jx = J(x);  
            
            delta = - Fx(i) / Jx(i,i);
            x(i) = x(i) + delta;
        end
        
        if norm(x - x_old, "inf") < tol then
            break;
        end
    end
    
    convi = norm(x - x_old, "inf");
    f = Fx;
endfunction
