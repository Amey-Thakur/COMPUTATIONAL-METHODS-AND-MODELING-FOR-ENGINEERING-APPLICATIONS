% =========================================================================================
% FILE NAME: Q17_CubicPolynomialFitting.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script determines the coefficients of a cubic polynomial that passes 
% exactly through four provided data points. It solves the resulting system 
% of linear equations and visualizes the polynomial curve relative to the 
% original coordinates.
%
% PROBLEM STATEMENT (Q17):
% Use MATLAB to find the coefficients of the cubic polynomial ax^3 + bx^2 + cx + d 
% that passes through the four points: 
% (x, y) = (1, 12), (2, 76), (4, 620), (5, 1160).
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 8, Q17.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Experimental Coordinate Acquisition ---
x_pts = [1, 2, 4, 5]';
y_pts = [12, 76, 620, 1160]';

% --- Linear System Modeling (Vandermonde Approach) ---
% Matrix Equation: V * [a; b; c; d] = Y
% Where rows of V are [x^3, x^2, x^1, x^0]
V = [x_pts.^3, x_pts.^2, x_pts, ones(size(x_pts))];

% Solve for coefficient vector p = [a; b; c; d]
coeff_vec = V \ y_pts;
a = coeff_vec(1);
b = coeff_vec(2);
c = coeff_vec(3);
d = coeff_vec(4);

% --- Visualization Engine (Polynomial Reconstruction) ---
x_smooth = linspace(min(x_pts)-0.5, max(x_pts)+0.5, 200);
y_smooth = a*x_smooth.^3 + b*x_smooth.^2 + c*x_smooth + d;

figure('Color', 'w', 'Name', 'Cubic Polynomial Point-Mapping Analysis');
plot(x_pts, y_pts, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8); hold on;
plot(x_smooth, y_smooth, 'b-', 'LineWidth', 2);

% Aesthetics and Scholarly Labeling
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Independent Variable (x)', 'FontSize', 12);
ylabel('Polynomial Output (y)', 'FontSize', 12);
title('Exact Point-Mapping via Cubic Interpolatory Polynomial', 'FontSize', 14, 'FontWeight', 'bold');
legend('Experimental Points', sprintf('Cubic Fit: %.1fx^3 + %.1fx^2 + %.1fx + %.1f', a, b, c, d), ...
       'Location', 'northwest');

% --- Results Visualization ---
fprintf('--- Cubic Polynomial Coefficient Results ---\n');
fprintf('a (Cubic):     %8.4f\n', a);
fprintf('b (Quadratic): %8.4f\n', b);
fprintf('c (Linear):    %8.4f\n', c);
fprintf('d (Intercept): %8.4f\n', d);

% Verification (Value at x=4 should be 620)
y_check = V * coeff_vec;
fprintf('\n--- Precision Verification ---\n');
fprintf('Target Y values: '); fprintf('%6.1f ', y_pts); fprintf('\n');
fprintf('Computed Y vals: '); fprintf('%6.4f ', y_check); fprintf('\n');

% Professional Scholarly Footer
fprintf('\nEngineering Insight: A cubic polynomial is uniquely determined by four points. The resulting Vandermonde system is solved exactly via matrix left-division, effectively mapping the discrete coordinates to a continuous analytic function with zero interpolation error at the nodes.\n');
