function [z, x, pivalues, indices, exitflag] = fullsimplex(A, b, c, m, n)
%Solves min c'x s.t. Ax = b, x >= 0

    tolerance = 1e-7;
    total_vars = n + m;
    indices = (n+1:total_vars)';
    Bmatrix = eye(m);
    c_phase1 = [zeros(n,1); ones(m,1)]; %artificial vars cost = 1.
    %Phase 1:
    [z_phase1, x_phase1, pivalues, indices, exitflag] = revisedsimplex(A, b, c_phase1, m, total_vars, Bmatrix, indices, 1);

    if abs(z_phase1) > tolerance %if z>0, infeasible.
        exitflag = 1; 
        z = z_phase1; x = x_phase1;
        return;
    end

    %Bmatrix = A(:, indices); -->old solution
    I=eye(m);
    for i=1:m
        %disp(indices(i));
        if indices(i) <= n %valid indices
            Bmatrix(:,i) = A(:,indices(i));
        else %invalid indices
            Bmatrix(:,i) = I(:,indices(i) - n); %what the column would look like using the I matrix.
        end
    end

    %Phase 2: Run revisedsimplex with original cost c
    [z, x, pivalues, indices, exitflag] = revisedsimplex(A, b, c, m, n, Bmatrix, indices, 2);
    %convert pivalues to a column vector (I kept it as transposed pivalues in its original state):
    pivalues = pivalues';
    x = x(1:n);  %delete any artificial variable parts
end
