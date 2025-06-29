# Revised Simplex Method (2025)
This repository contains a fully developed phase 1 - phase 2 revised simplex method that solves any feasible linear program to optimality.

Included is edge-case (unboundedness/infeasibility) detection with early termination.

Optimised for efficient computation using π matrix calculation.

# How to use:
MATLAB scripts - After the files are on your system, the function $fullsimplex$.

## Input Requirements:
The linear program must be of the form $Ax = b$ (Standard computational form). 

The problem is assumed to be a minimisation LP, meaning that the costs of the objective function ($c$) must reflect this.



# Model improvements:
Updated inverse basis matrix ($\hat{B}^{-1}$) calculation can be further optimised via Gauss-Jordan elimination.

Preprocessing heuristics (to improve performance), such as:
- Redundant constraint removal
- Variable elimination
- Dual problem solving 

