# Revised Simplex Method (2025)
This repository contains a fully developed phase 1 - phase 2 revised simplex method that solves any feasible linear program to optimality. To view some test cases and how to format your linear program, open $DemoTestCases.m$. 

## Features:
- Edge-case (unboundedness/infeasibility) detection with early termination.
- Works for degenerate phase 1 and phase 2 solutions (when $x_i = 0$).
- Optimised for efficient computation using π matrix calculation.

## How it works:
- First, $fullsimplex.m$ is called with your problem as inputs in the form of matrices.
- This then calls $revisedsimplex.m$, which runs the revised simplex algorithm with a Phase 1 approach using artificial variable formulation. This finds an initial basic feasible solution with the aim of eliminating all artificial variables.
- Then, Phase 2 is called, which again runs the $revisedsimplex.m$ algorithm. Starting with the basic feasible solution, the algorithm continuously attempts to find an entering variable that will improve the objective function (via $revisedfindenter.m$). If all reduced costs are greater than or equal to 0, the optimal solution is found, and the algorithm can terminate. If optimality is not found, the leaving variable is found by applying a ratio test in $revisedfindleave.m$. The algorithm terminates if the solution is unbounded, which occurs if none of the basic variables reach 0, implying the objective function can be minimised indefinitely. Finally, the Bmatrix is updated using the $revisedbupdate.m$ function. This process is repeated until an optimal solution is found or the boundedness test fails.
 
# How to use:
MATLAB scripts - After the files are on your system, run the function $fullsimplex$ using your personal inputs. Further details of this are shown below.

## Input Requirements:
- The linear program must be of the form $Ax = b$ (Standard computational form). 
- The problem is assumed to be a minimisation LP, meaning that the costs of the objective function ($c$) must reflect this. (If this is a maximisation problem, multiply cost matrix by -1).



# Model improvements:
Updated inverse basis matrix ($\hat{B}^{-1}$) calculation can be further optimised via Gauss-Jordan elimination.

Preprocessing heuristics (to improve performance), such as:
- Redundant constraint removal
- Variable elimination
- Dual problem solving 

