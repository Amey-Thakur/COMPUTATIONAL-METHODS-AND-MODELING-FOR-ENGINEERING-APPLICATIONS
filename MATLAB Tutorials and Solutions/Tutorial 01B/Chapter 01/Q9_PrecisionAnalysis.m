% =========================================================================================
% FILE NAME: Q9_PrecisionAnalysis.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script analyzes IEEE 754 floating-point precision limits in MATLAB using 
% realmax and realmin to detect overflow and underflow conditions during computation.
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 1, Q9.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;

% --- IEEE 754 Boundary Identification ---
upper_limit = realmax; 
lower_limit = realmin;

fprintf('--- MATLAB Precision Boundaries ---\n');
fprintf('RealMax: %e\n', upper_limit);
fprintf('RealMin: %e\n\n', lower_limit);

% --- Variable Initialization ---
a = 3 * 10^150;
b = 5 * 10^200;
d = 5 * 10^-200;

% --- Computational Scenarios ---

% a. Calculation of c = a * b
% Analyzing potential Overflow
c = a * b;

% b. Calculation of f = d / a
% Analyzing potential Underflow
f = d / a;

% c. Product x = a * b * d
% Comparing direct calculation vs. sequential splitting
x_direct = a * b * d;

y_temp = b * d;
x_split = a * y_temp;

% --- Results Visualization ---
fprintf('--- Overflow/Underflow Simulation ---\n');
fprintf('c = a * b: %e (Status: %s)\n', c, isinf(c)?'OVERFLOW (Inf)':'Finite');
fprintf('f = d / a: %e (Status: %s)\n', f, (f==0)?'UNDERFLOW (0)':'Finite');
fprintf('\n--- Calculation Sequence Dependency ---\n');
fprintf('Direct (a*b*d): %e\n', x_direct);
fprintf('Split (a*(b*d)): %e\n', x_split);

% Professional Scholarly Footer
fprintf('\nScientific Insight: Numerical stability is highly dependent on calculation order. Sequential splitting (as in step c) prevents intermediate overflow that occurs in direct multiplication.\n');

function result = isinf(val)
    % Helper function for clarity
    result = val == Inf;
end
