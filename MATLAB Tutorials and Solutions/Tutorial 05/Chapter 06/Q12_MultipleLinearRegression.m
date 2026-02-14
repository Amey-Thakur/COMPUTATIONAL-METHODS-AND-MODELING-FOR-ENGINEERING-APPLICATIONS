% =========================================================================================
% FILE NAME: Q12_MultipleLinearRegression.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script implements multiple linear regression to model a response variable y 
% as a function of two independent variables x1 and x2, visualizing the result 
% as a regression surface.
%
% PROBLEM STATEMENT (Q12):
% Obtain a linear model y = a0 + a1*x1 + a2*x2 for the following data to 
% describe the relationship:
%
% y:    [2.85, 4.2, 4.5, 3.75, 4.35, 4.2]
% x1:   [10,   16,  18,  22,   26,   28]
% x2:   [8,    12,  14,  24,   28,   34]
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 6, Q12.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Experimental Dataset Acquisition ---
y = [2.85; 4.2; 4.5; 3.75; 4.35; 4.2];
x1 = [10; 16; 18; 22; 26; 28];
x2 = [8; 12; 14; 24; 28; 34];

% --- Multiple Linear Regression ---
% Model: y = a0 + a1*x1 + a2*x2
% Construct the Independent Variable Matrix (Design Matrix)
% The first column is all ones to accommodate the intercept a0
X = [ones(size(x1)), x1, x2];

% Solve for coefficients using the backslash operator (Leas-Squares solution)
a = X \ y;

a0 = a(1);
a1 = a(2);
a2 = a(3);

% --- Validation and Visualization ---
% Create a grid for surface plotting
[X1_grid, X2_grid] = meshgrid(linspace(min(x1), max(x1), 30), linspace(min(x2), max(x2), 30));
Y_fit = a0 + a1 .* X1_grid + a2 .* X2_grid;

figure('Color', 'w', 'Name', 'Multivariate Regression Analysis');
surf(X1_grid, X2_grid, Y_fit, 'FaceAlpha', 0.5, 'EdgeColor', 'none');
hold on;
plot3(x1, x2, y, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8); % Data points

% Aesthetics and Labeling
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Feature 1 (x1)', 'FontSize', 12);
ylabel('Feature 2 (x2)', 'FontSize', 12);
zlabel('Response (y)', 'FontSize', 12);
title('3D Multiple Linear Regression Surface', 'FontSize', 14, 'FontWeight', 'bold');
legend('Regression Plane', 'Experimental Data', 'Location', 'best');
view(45, 30);

% --- Results Visualization ---
fprintf('--- Multiple Linear Model Parameters ---\n');
fprintf('Intercept (a0):   %8.4f\n', a0);
fprintf('Coeff x1 (a1):    %8.4f\n', a1);
fprintf('Coeff x2 (a2):    %8.4f\n', a2);
fprintf('\nModel Equation: y = %.4f + %.4f*x1 + %.4f*x2\n', a0, a1, a2);

% Professional Scholarly Footer
fprintf('\nTechnical Insight: The backslash operator (\) solves the overdetermined system of equations (X*a = y) using QR factorization, minimizing the sum of the squared residuals.\n');
