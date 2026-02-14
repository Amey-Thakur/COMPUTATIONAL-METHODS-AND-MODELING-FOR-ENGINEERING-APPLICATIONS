% =========================================================================================
% FILE NAME: Q41_LinearSolver.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script solves a system of three linear algebraic equations using the 
% computationally efficient left-division method (\).
%
% PROBLEM STATEMENT (Q41):
% Solve the following problem using the left-division method:
%  6x - 3y + 4z =  41
% 12x + 5y - 7z = -26
% -5x + 2y - 6z =  16
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 2, Q41.
%
% FORM: A * X = B  => X = A \ B
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;

% --- Matrix Construction ---
% Coefficient Matrix A
A = [ 6, -3,  4; 
     12,  5, -7; 
     -5,  2, -6];

% Constant Vector B
B = [41; -26; 16];

% --- Computational Solution ---
% Solution Vector X = [x; y; z]
% Using Left-Division (\) for optimal Gaussian elimination solver
X = A \ B;

% --- Results Visualization ---
fprintf('--- Linear Systems Solver Analysis ---\n');
fprintf('Computed Solution Vector X:\n');
fprintf('x = %8.4f\n', X(1));
fprintf('y = %8.4f\n', X(2));
fprintf('z = %8.4f\n', X(3));

% Validation: Check if A*X matches B (Residual Analysis)
Residual = A * X - B;
fprintf('\nResidual Check (A*X - B):\n');
fprintf('Norm of Residual: %e\n', norm(Residual));

% Professional Scholarly Footer
fprintf('\nMathematical Insight: The left-division operator uses LAPACK routines to select the best solver (e.g., LU decomposition with partial pivoting) for the specific matrix structure.\n');
