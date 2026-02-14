% =========================================================================================
% FILE NAME: Q21_DerivativeEstimation.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script estimates the numerical derivative of a complex mathematical function 
% at x = 0.6 using the discrete diff() function. It demonstrates the sensitivity 
% of numerical differentiation to the chosen step size (delta_x).
%
% PROBLEM STATEMENT (Q21):
% Use the diff function to estimate the derivative of 
% y = exp(-2x) * sin(4x) / (x^2 + 3)
% at the point x = 0.6.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 9, Q21.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Analytical Function Modeling ---
% y(x) = exp(-2x) * sin(4x) / (x^2 + 3)
y_func = @(x) exp(-2 * x) .* sin(4 * x) ./ (x.^2 + 3);

% --- Numerical Differentiation Stage ---
dx = 0.0001;                 % Differential step size
x_eval = [0.6, 0.6 + dx];    % Points for evaluation
y_eval = y_func(x_eval);     % Functional values

% Compute estimation: dy/dx approx diff(y)/diff(x)
derivative_est = diff(y_eval) / diff(x_eval);

% --- Symbolic Verification (Ground Truth) ---
syms x_sym;
y_sym = exp(-2 * x_sym) * sin(4 * x_sym) / (x_sym^2 + 3);
dy_sym = diff(y_sym, x_sym);
true_val = double(subs(dy_sym, x_sym, 0.6));

% --- Results Visualization ---
fprintf('--- Numerical Differentiation Results ---\n');
fprintf('Point of Evaluation (x):  0.6\n');
fprintf('Step Size (dx):          %.1e\n', dx);
fprintf('Estimated Derivative:     %8.6f\n', derivative_est);
fprintf('Exact Symbolic Value:     %8.6f\n', true_val);
fprintf('Absolute Error:           %8.2e\n', abs(true_val - derivative_est));

% --- Visualization Engine (Linearity at Point) ---
x_range = linspace(0.55, 0.65, 100);
y_range = y_func(x_range);
tangent_line = y_func(0.6) + true_val * (x_range - 0.6);

figure('Color', 'w', 'Name', 'Local Differentiation Analysis');
plot(x_range, y_range, 'b-', 'LineWidth', 2); hold on;
plot(x_range, tangent_line, 'r--', 'LineWidth', 1.5);
plot(0.6, y_func(0.6), 'ko', 'MarkerFaceColor', 'k');

% Aesthetics and Labeling
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('x', 'FontSize', 12);
ylabel('y(x)', 'FontSize', 12);
title('Local Tangent Estimation at x = 0.6', 'FontSize', 14, 'FontWeight', 'bold');
legend('Function y(x)', 'Tangent at x=0.6', 'Location', 'best');

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The diff() function provides a first-order forward difference approximation. While symbolic differentiation offers an exact analytical solution, numerical methods are critical in real-world scenarios where the underlying function is defined by discrete datasets rather than continuous algebraic expressions.\n');
