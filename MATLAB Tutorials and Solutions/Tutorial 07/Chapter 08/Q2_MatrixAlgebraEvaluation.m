% =========================================================================================
% FILE NAME: Q2_MatrixAlgebraEvaluation.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script performs symbolic matrix algebra to solve a matrix identity for an 
% unknown matrix C. It then evaluates the resulting expression using specific 
% numerical matrices A and B to verify the solution.
%
% PROBLEM STATEMENT (Q2):
% a. Solve the following matrix equation for the matrix C:
%    A(BC + A) = B
% b. Evaluate the solution obtained in part a for the case:
%    A = [7 9; -2 4], B = [4 -3; 7 6]
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 8, Q2.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Analytical Matrix Manipulation (Part a) ---
% Step-by-step symbolic derivation:
% A(BC + A) = B
% ABC + A^2 = B (Distributive Property)
% ABC = B - A^2
% BC = A^-1 * (B - A^2)
% C = B^-1 * A^-1 * (B - A^2) OR C = (AB)^-1 * (B - A^2)

% --- Numerical Evaluation (Part b) ---
% Define experimental matrices A and B
A = [ 7, 9; 
     -2, 4];
     
B = [ 4, -3; 
      7,  6];

% Computational execution of the derived model:
% C = (A*B) \ (B - A^2)
C = inv(A * B) * (B - A^2);

% --- Verification ---
% Re-substituting C into A(BC + A) to check mapping to B
B_check = A * (B * C + A);

% --- Results Visualization ---
fprintf('--- Matrix Evaluation Results ---\n');
fprintf('Matrix A:\n'); disp(A);
fprintf('Matrix B:\n'); disp(B);
fprintf('\nCalculated Matrix C:\n'); disp(C);

fprintf('--- Solution Integrity Verification ---\n');
fprintf('Recalculated B from A(BC + A):\n'); disp(B_check);
fprintf('Residual Error (Norm): %.4e\n', norm(B - B_check));

% Professional Scholarly Footer
fprintf('\nEngineering Insight: Matrix multiplication is non-commutative; the symbolic derivation must strictly maintain the order of operations. The near-zero residual norm validates the precision of the numerical inversion and distributive mapping.\n');
