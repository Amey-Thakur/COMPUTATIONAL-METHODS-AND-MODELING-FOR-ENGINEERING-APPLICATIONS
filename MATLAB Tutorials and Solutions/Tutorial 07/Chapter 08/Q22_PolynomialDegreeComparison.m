% =========================================================================================
% FILE NAME: Q22_PolynomialDegreeComparison.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script investigates the sensitivity of polynomial fitting to the specified 
% degree. It compares a unique quadratic solution against an underdetermined 
% cubic model using the same three coordinate points, demonstrating the concept 
% of model over-parameterization.
%
% PROBLEM STATEMENT (Q22):
% a. Use MATLAB to find the coefficients of the quadratic polynomial y = ax^2 + bx + c 
%    that passes through the three points (x, y) = (1, 4), (4, 73), (5, 120).
% b. Use MATLAB to find the coefficients of the cubic polynomial y = ax^3 + bx^2 + cx + d 
%    that passes through the three points given in part a.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 8, Q22.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Experimental Coordinate Acquisition ---
x_pts = [1, 4, 5]';
y_pts = [4, 73, 120]';

% --- Task A: Quadratic Polynomial Fitting (n=2) ---
% Matrix Equation: V2 * [a; b; c] = Y
V2 = [x_pts.^2, x_pts, ones(size(x_pts))];
coeffs_quad = V2 \ y_pts;

% --- Task B: Cubic Polynomial Fitting (n=3) ---
% Matrix Equation: V3 * [a; b; c; d] = Y
% Note: 3 equations, 4 unknowns -> Underdetermined system
V3 = [x_pts.^3, x_pts.^2, x_pts, ones(size(x_pts))];
% MATLAB's \ operator finds a basic solution (one variable zero) for underdetermined systems
coeffs_cubic = V3 \ y_pts;

% --- Visualization Engine (Model Comparison) ---
x_smooth = linspace(min(x_pts)-1, max(x_pts)+1, 200);
y_quad = coeffs_quad(1)*x_smooth.^2 + coeffs_quad(2)*x_smooth + coeffs_quad(3);
y_cubic = coeffs_cubic(1)*x_smooth.^3 + coeffs_cubic(2)*x_smooth.^2 + ...
          coeffs_cubic(3)*x_smooth + coeffs_cubic(4);

figure('Color', 'w', 'Name', 'Polynomial Degree Variance Analysis');
plot(x_pts, y_pts, 'ks', 'MarkerFaceColor', 'k', 'MarkerSize', 10); hold on;
plot(x_smooth, y_quad, 'r-', 'LineWidth', 2);
plot(x_smooth, y_cubic, 'b--', 'LineWidth', 2);

% Aesthetics and Scholarly Labeling
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Independent Variable (x)', 'FontSize', 12);
ylabel('Output Variable (y)', 'FontSize', 12);
title('Comparative Analysis: Quadratic vs. Cubic Fit Consistency', 'FontSize', 14, 'FontWeight', 'bold');
legend('Experimental Sensors', 'Quadratic Fit (Unique)', 'Cubic Fit (Underdetermined)', ...
       'Location', 'northwest');

% --- Results Visualization ---
fprintf('--- Quadratic Coefficients (Task A) ---\n');
fprintf('a: %8.4f | b: %8.4f | c: %8.4f\n', coeffs_quad);

fprintf('\n--- Cubic Coefficients (Task B) ---\n');
fprintf('a: %8.4f | b: %8.4f | c: %8.4f | d: %8.4f\n', coeffs_cubic);

fprintf('\n--- Observational Consistency ---\n');
fprintf('Quadratic Output at x=4: %8.4f\n', coeffs_quad(1)*4^2 + coeffs_quad(2)*4 + coeffs_quad(3));
fprintf('Cubic Output at x=4:     %8.4f\n', coeffs_cubic(1)*4^3 + coeffs_cubic(2)*4^2 + ...
        coeffs_cubic(3)*4 + coeffs_cubic(4));

% Professional Scholarly Footer
fprintf('\nEngineering Insight: While the quadratic solution is unique for three points, the cubic model is underdetermined, meaning infinitely many cubic polynomials exist. MATLAB''s backslash operator returns a "basic" solution, effectively setting one coefficient (typically the cubic term if the quadratic is sufficient) to zero if possible.\n');
