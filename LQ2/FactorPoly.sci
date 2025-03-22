// Example usage
OriginalP = [1 -6 11 -6]; // x^3 -6x^2 +11x -6
x0 = 2.5;
x1 = 4;
tol = %eps;
max_iter = 1000;
a = rand() * (x1 - x0) + x0;

function y = current_f(x)
        y = polyval(currentP, x);
endfunction
    
function dy = current_df(x)
        dP = poly_derivative(currentP);
        dy = polyval(dP, x);
endfunction
    

function y = current_g(x)
        if length(currentP) == 4 then
            
            //x=1
            //y = (currentP(1)*x^3 + currentP(2)*x^2 + currentP(3)*x) / (-currentP(4));
            
            //x=3
            y = (currentP(1)*x^3 + currentP(2)*x^2 + currentP(4)) / (-currentP(3))
        else
            error("Fixed-point not defined for non-cubic.");
        end
endfunction

x = linspace(-1,4, 100000); 
gx = polyval(OriginalP, x); 
plot(x, gx, 'b', "LineWidth", 1); 
plot(1, 0, 'k.');
plot(2, 0, 'k.');
plot(3, 0, 'k.');

xlabel("x_n");
xgrid();
disp("-----------------------------------------------------------");
disp("Testing Fixed-Point Iteration:");
factorize_polynomial(OriginalP, "fixed_point", 3.5, x1, tol, max_iter);

disp("-----------------------------------------------------------");
disp("Testing Secant Method:");
factorize_polynomial(OriginalP, "secant", x0, x1, tol, max_iter);

disp("-----------------------------------------------------------");
disp("Testing Newtons Method:");
factorize_polynomial(OriginalP, "newton", x0, x1, tol, max_iter);


disp("-----------------------------------------------------------");
disp("Testing Regula Falsi:");
factorize_polynomial(OriginalP, "regula_falsi", x0, x1, tol, max_iter);

disp("-----------------------------------------------------------");
disp("Testing Bisection:");
factorize_polynomial(OriginalP, "bisection", 2, 4, tol, max_iter);
