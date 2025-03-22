disp("Nonlinear System Solver");
disp("-----------------------------------------------------");
disp("System:");

disp("-----------------------------------------------------");

// input parameters
x0 = [0.2; 2];  //initial soln
tol = 1e-14;     // tolerance
maxiter = 100;   // maximum iterations


//mga newton
for newton_opt = 1:5
    disp("-----------------------------------------------------");
    printf("Running Newton method %d...\n", newton_opt);
    [x, f, convi, iter] = MyNewton(x0, tol, maxiter, newton_opt);
    disp("-----------------------------------------------------");
    printf("Results for Newton method variant %d:\n", newton_opt);
    disp("Solution x:");
    disp(x);
    disp("Function F(x):");
    disp(f);
    disp("Convergence norm:");
    disp(convi);
    disp("Number of iterations:");
    disp(iter);
end

//seidel
disp("-----------------------------------------------------");
disp("Running Seidel method...");
[x, f, convi, iter] = MySeidel(x0, tol, maxiter);
disp("-----------------------------------------------------");
disp("Results for Seidel method :");
disp("Solution x:");
disp(x);
disp("Function F(x):");
disp(f);
disp("Convergence norm:");
disp(convi);
disp("Number of iterations:");
disp(iter);
