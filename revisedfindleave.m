function leave = revisedfindleave(Bmatrix, as, xb, phase, n, indices)
%need to incorporate tolerance, also how do i find if xb(i) is artificial?
%Extended leaving variable algorithm for both phases:
%note a_s is the entering variable column.

    m = size(Bmatrix, 1);
    tolerance = 1e-7;
    Binv = inv(Bmatrix);
    y = Binv*as;

    minratio =Inf;
    leave =0;

    for i = 1:m
        %check if artificial
        if (phase == 2) && (indices(i) > n) %check if it is an artificial variable.
            if ~(abs(y(i)) < tolerance && abs(y(i)) > -tolerance) %if y(i)~=0
                minratio=0;
                leave = i;
                return;
            end
        else %standard ratio test
            if y(i) > tolerance
                ratio = xb(i)/y(i);
                if ratio < minratio
                    minratio = ratio;
                    leave = i;
                end
            end
        end
    end
end
