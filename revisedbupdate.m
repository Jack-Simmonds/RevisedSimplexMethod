function [Bmatrix, cb, indices, isbasic] = revisedbupdate(Bmatrix, cb, indices, isbasic, as, cs, s, leave)
    Bmatrix(:, leave) = as;
    isbasic(indices(leave)) = 0;
    isbasic(s) = 1;
    if length(cb) < leave
        cb(leave) = 0;  %Just in case leave > current length; a redundancy.
    end
    cb(leave) = cs;
    indices(leave) = s;
end
