% =========================================================================================
% FILE NAME: Q10_ArrayOperations.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script demonstrates advanced array manipulation and computational linear algebra.
% It performs row/column selection, statistical aggregation, and element-wise 
% operations on logarithmically transformed matrices.
%
% PROBLEM STATEMENT (Q10):
% Given the matrix A = [1 4 2; 2 4 100; 7 9 7; 3 pi 42], use MATLAB to:
% a. Find the matrix B = ln(A) and select the second row of B.
% b. Evaluate the sum of the second row of B.
% c. Multiply the second column of B and the first column of A element-wise.
% d. Evaluate the maximum value of the result from step (c).
% e. Divide the first row of A by the first 3 elements of the third column of B.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 2, Q10.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;

% --- Matrix Initialization ---
% Matrix A initialization based on textbook specifications
A = [1, 4, 2; 
     2, 4, 100; 
     7, 9, 7; 
     3, pi, 42];

% Logarithmic transformation: Matrix B = natural log of A
B = log(A);

% --- Computational Tasks ---

% a. Select just the second row of B
B_row2 = B(2, :);

% b. Evaluate the sum of the second row of B
B_row2_sum = sum(B_row2);

% c. Multiply the second column of B and the first column of A element-wise
% Both columns are 4x1 vectors.
product_vec = B(:, 2) .* A(:, 1);

% d. Evaluate the maximum value of the resulting vector from step (c)
max_val = max(product_vec);

% e. Element-wise division: First row of A (1x3) divided by first 3 elements 
% of the third column of B (3x1). Note: The 3x1 vector must be transposed to 1x3.
result_vec = A(1, :) ./ B(1:3, 3)';
final_sum = sum(result_vec);

% --- Results Visualization ---
fprintf('--- Array Operation Analysis ---\n');
fprintf('a. Second Row of B: [%s]\n', num2str(B_row2, '%8.4f '));
fprintf('b. Sum of Second Row of B: %8.4f\n', B_row2_sum);
fprintf('c. Element-wise Product Vector: [%s]\n', num2str(product_vec', '%8.4f '));
fprintf('d. Maximum value of Product: %8.4f\n', max_val);
fprintf('e. Final Computational Sum: %8.4f\n', final_sum);

% Professional Scholarly Footer
fprintf('\nTechnical Insight: Vectorized operations (.* and ./) allow for efficient computation without explicit loops, leveraging MATLAB''s optimized BLAS/LAPACK kernels.\n');
