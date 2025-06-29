# Revised Simplex Method (2025)
This repository contains a fully developed phase 1 - phase 2 revised simplex method that solves any feasible linear program to optimality. To view some test cases and how to format your linear program, open $DemoTestCases.m$. 

## Features:
- Edge-case (unboundedness/infeasibility) detection with early termination.
- Works for degenerate phase 1 and phase 2 solutions (when $x_i = 0$).
- Optimised for efficient computation using π matrix calculation.

## How it works:
- First, $fullsimplex.m$ is called with your problem as inputs in the form of matrices.
- This then calls $revisedsimplex.m$, which runs the simplex algorithm with a Phase 1 approach using artificial variable formulation. This finds an initial basic feasible solution with the aim to eliminate all artificial variables.
- Then, Phase 2 is called, which again runs the simplex algorithm. This works by 
 
# How to use:
MATLAB scripts - After the files are on your system, the function $fullsimplex$.

## Input Requirements:
- The linear program must be of the form $Ax = b$ (Standard computational form). 
- The problem is assumed to be a minimisation LP, meaning that the costs of the objective function ($c$) must reflect this. (If this is a maximisation problem, multiply cost matrix by -1).



# Model improvements:
Updated inverse basis matrix ($\hat{B}^{-1}$) calculation can be further optimised via Gauss-Jordan elimination.

Preprocessing heuristics (to improve performance), such as:
- Redundant constraint removal
- Variable elimination
- Dual problem solving 

