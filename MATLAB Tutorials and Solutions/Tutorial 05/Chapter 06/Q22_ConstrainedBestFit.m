% =========================================================================================
% FILE NAME: Q22_ConstrainedBestFit.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script computes a constrained linear best-fit line that is forced to pass 
% through a specific coordinate point, utilizing analytical optimization.
%
% PROBLEM STATEMENT (Q22):
% Consider the following data. Find the best-fit line that passes through the 
% point x0 = 10, y0 = 20.
%
% x: [0,   5,   10]
% y: [0.4, 9.7, 20]
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 6, Q22.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Experimental Dataset Acquisition ---
x = [0, 5, 10];
y = [0.4, 9.7, 20];

% Constraint Point
x0 = 10;
y0 = 20;

% --- Analytical Constrained Modeling ---
% Line equation: y - y0 = m * (x - x0)
% => y = m * (x - x0) + y0
% Let u = x - x0 and v = y - y0
% Then v = m * u
% The least-squares estimate for m in v = m * u (with no intercept) is:
% m = sum(u * v) / sum(u^2)

u = x - x0;
v = y - y0;

m_opt = sum(u .* v) / sum(u.^2);

% Functional result: y = m_opt * (x - 10) + 20
% Intercept b: y = m_opt * x + (20 - 10 * m_opt)
b_opt = y0 - m_opt * x0;

% --- Validation and Visualization ---
x_smooth = linspace(-1, 11, 200);
y_fit = m_opt .* (x_smooth - x0) + y0;

figure('Color', 'w', 'Name', 'Constrained Regression Analysis');
plot(x, y, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8, 'DisplayName', 'Experimental Data');
hold on;
plot(x_smooth, y_fit, 'r-', 'LineWidth', 2, 'DisplayName', 'Constrained Fit Line');
plot(x0, y0, 'ys', 'MarkerSize', 10, 'MarkerFaceColor', 'y', 'DisplayName', 'Constraint Point (10, 20)');

% Aesthetics and Labeling
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Independent Variable (x)', 'FontSize', 12);
ylabel('Response Variable (y)', 'FontSize', 12);
title('Line of Best Fit with Fixed Coordinate Constraint', 'FontSize', 14, 'FontWeight', 'bold');
legend('Location', 'northwest');

% --- Results Visualization ---
fprintf('--- Constrained Model Parameters ---\n');
fprintf('Optimized Slope (m):    %8.4f\n', m_opt);
fprintf('Effective Intercept (b): %8.4f\n', b_opt);
fprintf('\nModel Equation: y = %.4f * (x - 10) + 20\n', m_opt);

% Professional Scholarly Footer
fprintf('\nMathematical Insight: Constrained regression reduces the degrees of freedom by forcing the model through a known physical anchor point, ensuring the model adheres to theoretical or empirical boundary conditions.\n');
