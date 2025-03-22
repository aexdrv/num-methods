function [x, f, convi, iter] = MyNewton(x0, tol, maxiter, opt)
    x = x0;
    n = length(x);
    
    for iter = 1:maxiter
        Fx = F(x);
        Jx = J(x);
        
        // mga method an 1-5
        
        if opt == 1 then 
            [Q, R] = qr(Jx);
            delta = - R \ (Q' * Fx);
            
        elseif opt == 2 then 
            [L, U, P] = lu(Jx);
            delta = - U \ (L \ (P * Fx));
            
        elseif opt == 3 then  
            [L, U, P] = lu(Jx);
            delta = - inv(U) * inv(L) * (P * Fx);
            
        elseif opt == 4 then  
            delta = - diag(inv(Jx)) .* Fx; 
            
        elseif opt == 5 then 
            delta = zeros(n, 1);
            for i = 1:n
                if abs(Jx(i,i)) < 1e-12 then
                    error("May zero diagonal", i);
                end
                delta(i) = - Fx(i) / Jx(i,i);
            end
        else
            error(".");
        end
        
        x_new = x + delta;
        
        // Check convergence using the infinity norm of the update
        if norm(delta, "inf") < tol then
            x = x_new;
            break;
        end
        
        // Update current solution
        x = x_new;
    end
    
    if iter == maxiter then
        disp("Max iterations reached.");
    end
    
    f = Fx;
    convi = norm(delta, "inf");
endfunction
