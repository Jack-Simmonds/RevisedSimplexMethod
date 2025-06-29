function [z, x, pivalues, indices, exitflag] = revisedsimplex(A, b, c, m, n, Bmatrix, indices, phase)
    tolerance = -1e-6;
    exitflag = 0;
    x = zeros(n, 1);
    total_vars = length(c);

    %track which variables are basic
    isbasic = zeros(total_vars, 1);
    isbasic(indices) = 1;

    %Extend cost vector c with zeros for artificial variables
    if length(c) < max(indices)
        c = [c; zeros(max(indices) - length(c), 1)];
    end
    cb = c(indices);


    while true
        Binv = inv(Bmatrix);
        xb = Binv * b;
        pivalues = cb' * Binv;

        %find entering variable
        [as, cs, s] = revisedfindenter(A, pivalues, c, isbasic, phase);
        if s == 0
            %if optimal solution found
            x(indices(indices <= n)) = xb(indices <= n);
            z = c(1:n)' * x;
            return;
        end

        %find leaving variable
        leave = revisedfindleave(Bmatrix, as, xb, phase, n, indices);
        if leave == 0
            x(indices(indices <= n)) = xb(indices <= n);
            z = c(1:n)'*x;
            exitflag = -1; %unbounded
            return;
        end

        %update basis
        [Bmatrix, cb, indices, isbasic] = revisedbupdate(Bmatrix, cb, indices, isbasic, as, cs, s, leave);
        
    end
end
