clc; clear;

fprintf("=== Test Case 1: Feasible and Bounded ===\n");
% min x1 + 2x2  s.t. x1 + x2 <= 4, x1 + 3x2 <= 6, x1,x2 >= 0
A1 = [1 1 1 0;
      1 3 0 1];
b1 = [4; 6];
c1 = [1; 2; 0; 0];
[z1, x1, pi1, ind1, flag1] = fullsimplex(A1, b1, c1, 2, 4);
disp("z = " + z1 + ", x = "); disp(x1'); disp("exitflag = " + flag1);

fprintf("\n=== Test Case 2: Unbounded ===\n");
% min -x1 - x2 s.t. x1 - x2 >= 1 -> -x1 + x2 + a1 = -1
A2 = [-1 1 1];
b2 = [-1];
c2 = [-1; -1; 0];
[z2, x2, pi2, ind2, flag2] = fullsimplex(A2, b2, c2, 1, 3);
disp("z = " + z2 + ", x = "); disp(x2'); disp("exitflag = " + flag2);

fprintf("\n=== Test Case 3: Infeasible ===\n");
% x1 + x2 = 1, x1 + x2 = 3 => inconsistent system, add 2 artificial vars
A3 = [1 1 1 0;
      1 1 0 1];
b3 = [1; 3];
c3 = [1; 1; 0; 0];
[z3, x3, pi3, ind3, flag3] = fullsimplex(A3, b3, c3, 2, 4);
disp("z = " + z3 + ", x = "); disp(x3'); disp("exitflag = " + flag3);

fprintf("\n=== Test Case 4: Degenerate Corner Case ===\n");
% x1 + x2 = 1, 2x1 + 2x2 = 2 => same constraint repeated
A4 = [1 1 1 0;
      2 2 0 1];
b4 = [1; 2];
c4 = [1; 1; 0; 0];
[z4, x4, pi4, ind4, flag4] = fullsimplex(A4, b4, c4, 2, 4);
disp("z = " + z4 + ", x = "); disp(x4'); disp("exitflag = " + flag4);
