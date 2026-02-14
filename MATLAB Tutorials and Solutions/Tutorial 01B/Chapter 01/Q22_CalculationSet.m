% =========================================================================================
% FILE NAME: Q22_CalculationSet.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script executes a suite of complex numerical evaluations involving nested 
% exponentials, logarithms, and squared trigonometric functions (cos^2).
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 1, Q22.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;

% --- Mathematical Logic Suite ---

% a. e^(-2.1)^3 + 3.47 * log(14) + root(4, 287)
% Note: log() in MATLAB is the natural logarithm (ln)
result_a = exp(-2.1)^3 + 3.47 * log(14) + 287^(1/4);

% b. (3.4)^7 * log(14) + root(4, 287)
result_b = (3.4)^7 * log(14) + 287^(1/4);

% c. cos^2( (4.12*pi) / 6 )
% Calculated as (cos(x))^2
val_c = (4.12 * pi) / 6;
result_c = cos(val_c)^2;

% d. cos( (4.12*pi) / 6 )^2
% Interpreted similarly to expression c based on textbook notation
result_d = cos(val_c)^2;

% --- Results Visualization ---
fprintf('--- Complex Numerical Evaluation Suite ---\n');
fprintf('a. exp(-2.1)^3 + 3.47*ln(14) + 287^(1/4) = %8.4f\n', result_a);
fprintf('b. (3.4)^7 * ln(14) + 287^(1/4)          = %8.4f\n', result_b);
fprintf('c. cos^2((4.12*pi)/6)                    = %8.4f\n', result_c);
fprintf('d. cos((4.12*pi)/6)^2                    = %8.4f\n', result_d);

% Professional Scholarly Footer
fprintf('\nTechnical Insight: MATLAB''s trigonometric functions assume inputs in radians. Exponentiation of decimals and roots are handled with high precision via the IEEE 754-2008 standard.\n');
