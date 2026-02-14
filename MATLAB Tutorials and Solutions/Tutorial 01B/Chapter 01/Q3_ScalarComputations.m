% =========================================================================================
% FILE NAME: Q3_ScalarComputations.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script performs fundamental scalar algebraic computations to evaluate mathematical 
% expressions involving exponents, trigonometric constants, and rational fractions.
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 1, Q3.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;    % Reset Command Window
clear;  % Refresh Workspace

% --- Input Variable Definition ---
x = 5;
y = 2;

% --- Mathematical Evaluator ---

% a. (1 - 1/x^5)^-1
result_a = (1 - 1/x^5)^-1;

% b. 3*pi*x^2
result_b = 3 * pi * x^2;

% c. 3y / (4x - 8)
result_c = (3 * y) / (4 * x - 8);

% d. 4(y - 5) / (3x - 6)
result_d = (4 * (y - 5)) / (3 * x - 6);

% --- Results Visualization ---
fprintf('--- Scalar Computation Results (x=5, y=2) ---\n');
fprintf('a. (1 - 1/x^5)^-1 = %8.6f\n', result_a);
fprintf('b. 3*pi*x^2       = %8.4f\n', result_b);
fprintf('c. 3y/(4x-8)      = %8.4f\n', result_c);
fprintf('d. 4(y-5)/(3x-6)  = %8.4f\n', result_d);

% Professional Scholarly Footer
fprintf('\nTechnical Note: These operations demonstrate MATLAB''s precedence rules (BODMAS/PEMDAS) in scalar arithmetic contexts.\n');
