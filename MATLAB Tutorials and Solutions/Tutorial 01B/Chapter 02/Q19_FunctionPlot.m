% =========================================================================================
% FILE NAME: Q19_FunctionPlot.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script generates a high-resolution visualization of the non-linear function
% f(x) = (4*cos(x)) / (x + e^(-0.75x)) over the interval [-2, 16].
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 2, Q19.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Domain Grid Generation ---
% Using 1000 points to ensure a smooth curve for high-frequency fluctuations
x = linspace(-2, 16, 1000);

% --- Functional Computation ---
% f(x) = (4 * cos(x)) ./ (x + exp(-0.75 * x))
% Note: Element-wise division './' is critical for vector inputs
y = (4 * cos(x)) ./ (x + exp(-0.75 * x));

% --- Visualization Engine ---
figure('Color', 'w', 'Name', 'Non-Linear Function Analysis');
plot(x, y, 'LineWidth', 2, 'Color', '#7E2F8E');

% Aesthetics and Grid Configuration
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
ax = gca;
ax.GridLineStyle = '--';
ax.GridAlpha = 0.3;

% Annotation and Labeling
title('f(x) = 4cos(x) / (x + e^{-0.75x})', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Input variable (x)', 'FontSize', 12);
ylabel('Function value f(x)', 'FontSize', 12);

% Limit definition to prevent visual distortion
xlim([-2, 16]);

% Professional Scholarly Footer
fprintf('Visualization Insight: The function exhibits damped oscillatory behavior as x increases, driven by the decaying exponential in the denominator.\n');
