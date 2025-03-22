function [p,i] = false_position_ndsp(f, p0, p1, tol, max_iter)

// Step 1: Initialize variables
    q0 = f(p0);
    q1 = f(p1);

// Ensure f(p0) and f(p1) have opposite signs
    if q0 * q1 >= 0 then
        disp("Need values with opposite signs.");
        p = 0;
        return;
    end

    prev_p = p1;  // Holder han previous p for error

// Step 2: Start the iteration process
    for i = 2:max_iter

// Step 3: False Position formula
        p = p1 - q1 * (p1 - p0) / (q1 - q0);

// Step 4: Check if the solution meets the tolerance criteria

    //Absolute error
        error1 = abs(p - prev_p);
    //Check error
        if error1 < tol then
            return;
        end
        
// Step 5: Update function value at new approximation
        q = f(p);

// Step 6: Determine the new interval
        if q * q1 < 0 then
            p0 = p1;
            q0 = q1;
        end

// Step 7: Update values for next iteration
        p1 = p;
        q1 = q;
        prev_p = p; // Store previous p for next error calculation
    end

// Step 8: If max iterations reached, return failure
    disp("Reached max iterations.");
endfunction
