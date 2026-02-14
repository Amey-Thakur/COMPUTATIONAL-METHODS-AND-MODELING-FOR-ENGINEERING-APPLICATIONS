% =========================================================================================
% FILE NAME: Q35_CubicEquation.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script computes the algebraic roots of a general cubic equation of the form:
% x^3 + a*x^2 + b*x + c = 0.
% It utilizes user-prompted coefficients and MATLAB's polynomial root-finding algorithms.
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 1, Q35.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;

% --- Data Acquisition (Interactive Input) ---
fprintf('--- Cubic Equation Solver (x^3 + ax^2 + bx + c = 0) ---\n');
a = input('Enter coefficient a: ');
b = input('Enter coefficient b: ');
c = input('Enter coefficient c: ');

% --- Mathematical Logic: Root Finding ---
% Polynomial coefficients are represented as a vector [1, a, b, c]
% corresponding to powers of x in descending order.
coefficients = [1, a, b, c];

% MATLAB uses the companion matrix method to find roots
equation_roots = roots(coefficients);

% --- Results Visualization ---
fprintf('\n--- Calculation Results ---\n');
fprintf('Root 1: %8.4f + %8.4fi\n', real(equation_roots(1)), imag(equation_roots(1)));
fprintf('Root 2: %8.4f + %8.4fi\n', real(equation_roots(2)), imag(equation_roots(2)));
fprintf('Root 3: %8.4f + %8.4fi\n', real(equation_roots(3)), imag(equation_roots(3)));

% Professional Scholarly Footer
fprintf('\nScholarly Note: The computed roots represent the intersection points of the cubic polynomial with the x-axis (y = 0).\n');
