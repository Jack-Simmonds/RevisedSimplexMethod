function [as, cs, s] = revisedfindenter(A, pivalues, c, isbasic, phase)
    tolerance = -1e-6;
    [m, n] = size(A); %note that this function doesn't use m.
    total_vars = n;
    s = 0;
    min_r = tolerance;

    if length(c) < size(A, 2) %check if safe.
        c = [c; zeros(size(A,2) - length(c), 1)];
    end

    r = zeros(total_vars, 1);
    for j = 1:total_vars
        if isbasic(j) == 0 %only include non-basic variables
            if phase == 1 && j > n
                continue; %Skip artificial variables for phase 1
            end
            aj = A(:, j);
            rj = c(j) - pivalues * aj;
            if rj < min_r
                min_r = rj;
                s = j;
            end
        end
    end

    if s == 0 % Optimal 
        as = [];
        cs = 0;
        return;
    end
    as = A(:, s);
    cs = c(s);
end
