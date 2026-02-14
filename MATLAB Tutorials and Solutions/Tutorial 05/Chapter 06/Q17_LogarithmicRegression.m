% =========================================================================================
% FILE NAME: Q17_LogarithmicRegression.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script applies least-squares regression to a logarithmic model, estimating 
% system parameters and performing point predictions within and beyond the 
% experimental interval.
%
% PROBLEM STATEMENT (Q17):
% The following function is linear in the parameters a1 and a2:
% y(x) = a1 + a2 * ln(x)
% Use least-squares regression with the following data to estimate the values 
% of a1 and a2. Use the curve fit to estimate the values of y at x = 2.5 
% and at x = 11.
%
% x: [1,  2,  3,  4,  5,  6,  7,  8,  9,  10]
% y: [15, 21, 24, 27, 28, 30, 31.5, 33, 34.5, 34.5]
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 6, Q17.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Experimental Dataset Acquisition ---
x = 1:10;
y = [15, 21, 24, 27, 28, 30, 31.5, 33, 34.5, 34.5];

% --- Logarithmic Regression Analysis ---
% Model: y = a1 + a2 * ln(x)
% Linearization: We treat ln(x) as the independent variable term
ln_x = log(x);

% Fitting a 1st degree polynomial to (ln_x, y)
% p = [a2, a1] because polyfit returns powers in descending order
p = polyfit(ln_x, y, 1);

a2 = p(1);
a1 = p(2);

% --- Predictive Point Analysis ---
x_test = [2.5, 11];
y_test = a1 + a2 .* log(x_test);

% --- Visualization Engine ---
x_smooth = linspace(1, 11, 200);
y_fit = a1 + a2 .* log(x_smooth);

figure('Color', 'w', 'Name', 'Logarithmic Growth Characterization');
plot(x, y, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6);
hold on;
plot(x_smooth, y_fit, 'b-', 'LineWidth', 2);
plot(x_test, y_test, 'rp', 'MarkerSize', 10, 'MarkerFaceColor', 'y'); % Test points

% Aesthetics and Labeling
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Independent Variable (x)', 'FontSize', 12);
ylabel('Response Variable (y)', 'FontSize', 12);
title('Logarithmic Regression Model Analysis', 'FontSize', 14, 'FontWeight', 'bold');
legend('Experimental Data', sprintf('Model: y = %.2f + %.2f ln(x)', a1, a2), 'Predictions', 'Location', 'southeast');

% --- Results Visualization ---
fprintf('--- Logarithmic Model Parameters ---\n');
fprintf('Parameter a1 (Intercept): %8.4f\n', a1);
fprintf('Parameter a2 (Slope):     %8.4f\n', a2);
fprintf('\n--- Prediction Results ---\n');
fprintf('Estimated y at x = 2.5:   %8.4f\n', y_test(1));
fprintf('Estimated y at x = 11:    %8.4f\n', y_test(2));

% Professional Scholarly Footer
fprintf('\nMathematical Insight: Logarithmic regression is ideal for modeling phenomena that exhibit fast initial growth followed by deceleration, reaching a quasi-saturation state.\n');
