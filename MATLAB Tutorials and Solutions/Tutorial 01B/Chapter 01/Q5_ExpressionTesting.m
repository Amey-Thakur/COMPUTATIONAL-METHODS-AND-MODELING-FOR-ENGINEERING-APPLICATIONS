% =========================================================================================
% FILE NAME: Q5_ExpressionTesting.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script evaluates complex mathematical expressions using a specific set of 
% empirical constants (a, b, c, d, f) to verify structural computational logic.
%
% PROBLEM STATEMENT (Q5):
% Assuming that the variables a, b, c, d, and f are scalars, write MATLAB statements 
% to compute and display the following expressions. Test your statements for the 
% values a = 1.12, b = 2.34, c = 0.72, d = 0.81, and f = 19.83.
% x = 1 + a/b + c/f^2
% s = (b-a) / (d-c)
% r = 1 / ( 1/a + 1/b + 1/c + 1/d )
% y = ab * (1/c) * (f^2 / 2)
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 1, Q5.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;

% --- Empirical Dataset Definition ---
a = 1.12;
b = 2.34;
c = 0.72;
d = 0.81;
f = 19.83;

% --- Computational Logic Engine ---

% Expression x: 1 + a/b + c/f^2
x = 1 + (a / b) + (c / f^2);

% Expression s: (b - a) / (d - c)
s = (b - a) / (d - c);

% Expression r: 1 / ( (1/a) + (1/b) + (1/c) + (1/d) )
r = 1 / ( (1/a) + (1/b) + (1/c) + (1/d) );

% Expression y: a * b * ( (1 / c) * ( (f^2) / 2 ) )
y = a * b * ( (1 / c) * ( (f^2) / (2) ) );

% --- Results Visualization ---
fprintf('--- Geometric & Scalar Expression Results ---\n');
fprintf('x: %8.4f\n', x);
fprintf('s: %8.4f\n', s);
fprintf('r: %8.4f\n', r);
fprintf('y: %8.4f\n', y);

% Professional Scholarly Footer
fprintf('\nTechnical Insight: Nested parentheses and reciprocal summations (as seen in variable ''r'') are fundamental to rational network and circuit analysis.\n');
