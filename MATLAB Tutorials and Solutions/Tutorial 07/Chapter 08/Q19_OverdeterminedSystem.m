% =========================================================================================
% FILE NAME: Q19_OverdeterminedSystem.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script solves an overdetermined system of three linear equations with 
% two variables. It utilizes the least-squares method (via the \\ operator) 
% to identify the optimal state vector [x; y] that minimizes the sum of squared residuals.
%
% PROBLEM STATEMENT (Q19):
% Use MATLAB to solve the following overdetermined problem:
% x + 6y = 64
% 7x - 2y = 8
% 2x + 3y = 38
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 8, Q19.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Overdetermined System Modeling ---
% Coefficient Matrix A (3x2) and Constant Vector B (3x1)
A = [ 1,  6;
      7, -2;
      2,  3];
      
B = [64; 8; 38];

% --- Computational Solution Stage (Least-Squares) ---
% For overdetermined systems, A \ B computes the least-squares solution
% Mathematically equivalent to: (A' * A) \ (A' * B)
X = A \ B;

% --- Solution Verification & Residual Analysis ---
% Calculate the projection of the solution back to the constant space
B_fit = A * X;
residuals = B - B_fit;
total_resid_norm = norm(residuals);

% --- Results Visualization ---
fprintf('--- Overdetermined System Results ---\n');
fprintf('Optimized x (LSQ): %8.4f\n', X(1));
fprintf('Optimized y (LSQ): %8.4f\n', X(2));

fprintf('\n--- Residual Analysis ---\n');
fprintf('Equation 1 Error: %10.4f\n', residuals(1));
fprintf('Equation 2 Error: %10.4f\n', residuals(2));
fprintf('Equation 3 Error: %10.4f\n', residuals(3));
fprintf('Total Residual Norm: %.4e\n', total_resid_norm);

% --- Visualization Engine (Geometric Interpretation) ---
% Plotting the lines represented by each equation
y_range = -5:0.1:20;
l1 = (64 - 1*y_range)/6; % Wait, x+6y=64 => x = 64-6y? 
% Let's plot y as a function of x for standard viewing
x_range = -5:0.1:15;
y1 = (64 - x_range)/6;
y2 = (7*x_range - 8)/2;
y3 = (38 - 2*x_range)/3;

figure('Color', 'w', 'Name', 'Least-Squares Intersection Analysis');
plot(x_range, y1, 'r--', 'LineWidth', 1.2); hold on;
plot(x_range, y2, 'g--', 'LineWidth', 1.2);
plot(x_range, y3, 'b--', 'LineWidth', 1.2);
plot(X(1), X(2), 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8);

% Aesthetics and Labeling
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Variable x', 'FontSize', 12);
ylabel('Variable y', 'FontSize', 12);
title('Optimal Least-Squares Fit for Overdetermined Equations', 'FontSize', 14, 'FontWeight', 'bold');
legend('L1: x+6y=64', 'L2: 7x-2y=8', 'L3: 2x+3y=38', 'LSQ Optimal Centroid', 'Location', 'best');
axis([0 12 0 15]);

% Professional Scholarly Footer
fprintf('\nEngineering Insight: Because the three lines do not intersect at a unique point, no exact solution exists. The least-squares solution represents the "centroid" of the intersection region that minimizes the orthogonal deviation across all three systemic constraints.\n');
