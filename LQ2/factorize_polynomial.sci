function factorize_polynomial(OriginalP, method, x0, x1, tol, max_iter)
    currentP = OriginalP;
    
    disp("Method:" + string(method));
    disp("Polynomial: P(x) = x^3 - 6x^2 + 11x - 6");
    fa = polyval(OriginalP, a);
   
    disp("Polynomial: P(a)=" + string(fa));
    
    roots = [];
    
    while length(currentP) > 1
        if length(currentP) == 2 // Linear
            root = -currentP(2)/currentP(1);
            roots = [roots, root];
            currentP = [];
            
        elseif length(currentP) == 3 // Quadratic
            a = currentP(1);
            b = currentP(2);
            c = currentP(3);
            discriminant = b^2 - 4*a*c;
            if discriminant < 0 then
                error("Complex roots detected.");
        else
            root1 = (-b + sqrt(discriminant)) / (2*a);
            root2 = (-b - sqrt(discriminant)) / (2*a);
            roots = [roots, root1, root2];
            currentP = [];
        end
            
            
        else // Nonlinear and Non Quadratic
            select method
                
            case "bisection" then
                [root, iter] = bisection(current_f, x0, x1, tol, max_iter);
                
            case "newton" then
                [root, iter] = newton(current_f, current_df, x0, tol, max_iter);
                
            case "regula_falsi" then
                [root, iter] = regula_falsi(current_f, x0, x1, tol, max_iter);
                
            case "secant" then
                [root, iter] = secant(current_f, x0, x1, tol, max_iter);
                
            case "fixed_point" then
                if length(currentP) ~= 4 then
                    error("Fixed-point only for cubic.");
                end
                [root, iter] = fixed_point(current_g, x0, tol, max_iter);
                
            else
                error("Invalid method.");
            end
            
            
            roots = [roots, root];
            currentP = synthetic_division(currentP, root);
            
            
            // Adjust initial guesses for next root
            x0 = root - 1;
            x1 = root + 1;
        end
    end
    
    // Display results
    disp("Roots found: " + strcat(string(roots), ", "));
    
    // Error calculation using original polynomial
    fi = 1;
    for z = 1:length(roots)
        fi = fi * (a - roots(z));
    end
    errorz = abs(fa - fi);
    disp("Iter: " + string(iter));
    disp("Error at random point a: " + string(errorz));
endfunction
