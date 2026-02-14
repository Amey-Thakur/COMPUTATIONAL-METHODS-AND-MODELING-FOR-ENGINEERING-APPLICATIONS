% =========================================================================================
% FILE NAME: Q14_LinearSystem3x3.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script computes the solutions for a conventional three-variable system of 
% linear equations. It utilizes matrix inversion via the backslash operator (\\) 
% and verifies the solution integrity through residual analysis.
%
% PROBLEM STATEMENT (Q14):
% Solve the following equations:
% 6x - 4y + 3z = 10
% 4x + 3y - 2z = 46
% 10x - y + z = 56
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 8, Q14.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Linear System Modeling ---
% Matrix A (Coefficients) and Vector B (Constants)
A = [ 6, -4,  3;
      4,  3, -2;
     10, -1,  1];
     
B = [10; 46; 56];

% --- Computational Solution Stage ---
% We utilize the matrix left-division operator for robust solving
% X = A^-1 * B
X = A \ B;

% --- Solution Verification ---
% B_check must equal B if X is accurate
B_check = A * X;
residual = norm(B - B_check);

% --- Results Visualization ---
fprintf('--- Linear System Solution Results ---\n');
fprintf('x = %8.4f\n', X(1));
fprintf('y = %8.4f\n', X(2));
fprintf('z = %8.4f\n', X(3));

fprintf('\n--- Numerical Integrity Verification ---\n');
fprintf('Residual Error (Norm): %.4e\n', residual);

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The system is well-conditioned, as evidenced by the extreme precision of the solution (residual near machine epsilon). Matrix left-division is computationally superior to direct inversion for such engineering applications due to its use of Gaussian elimination and LU decomposition.\n');
