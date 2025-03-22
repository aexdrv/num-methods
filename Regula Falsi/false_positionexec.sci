// Plot the function f(x) = cos(x)
    x = linspace(-2, 4, 1000);  // Generate x values from -1 to 2
    y = f(x);                  // Compute f(x)

//it function
function fx = f(x)
    fx = cos(x)-x;
endfunction

//Initial parameters
    p0 = -2;        // first guess
    p1 = 1;     // second guess
    tol = %eps;      // tolerance
    max_iter = 100;        // maximum iterations

//graph
    clf;
    plot(x, y, "b-");      // f(x) in blue
    plot(p0, f(p0), "go"); // initial val 
    plot(p1, f(p1), "go"); // initial val yo
    zy=zeros(1000,1); zx=linspace(-2,4,1000);//an x-axis
    plot(zx',zy',"r");



// Call the False Position method
    [root, iter] = false_position_wdsp(f, p0, p1, tol, max_iter);

// Display the result
    disp("Approximate root: " + string(root));
    disp("Iterations: " + string(iter-1));


//plot root
    plot(root, f(root), "r."); // root with red circle
    
//ha graph
    xlabel("x"); 
    ylabel("f(x)");
    xgrid;

