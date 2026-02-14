% =========================================================================================
% FILE NAME: Q6_RootFinding.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script utilizes the fplot function to visualize a non-linear transcendental 
% equation and identify its roots within a specified interval.
%
% PROBLEM STATEMENT (Q6):
% To compute the forces in structures, sometimes we must solve equations similar 
% to the following. Use the fplot function to find all the roots of this 
% equation between 0 and 5:
% x * tan(2x) = 10
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 5, Q6.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Functional Definition ---
% We rearrange the equation to f(x) = x * tan(2x) - 10 = 0
f = @(x) x .* tan(2 .* x) - 10;

% --- Visualization Engine ---
figure('Color', 'w', 'Name', 'Root Finding Analysis');
fplot(f, [0, 5], 'LineWidth', 2, 'Color', '#0072BD');

% Aesthetics and Grid Configuration
grid on;
yline(0, 'k-', 'HandleVisibility', 'off'); % Reference line at y=0
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Input Variable (x)', 'FontSize', 12);
ylabel('f(x) = x*tan(2x) - 10', 'FontSize', 12);
title('Root Identification via fplot', 'FontSize', 14, 'FontWeight', 'bold');

% --- Numerical Root Extraction ---
% Based on the plot, roots appear near x = 0.7, 2.3, and 3.9
% Using fzero with initial guesses derived from visual inspection
root1 = fzero(f, 0.7);
root2 = fzero(f, 2.3);
root3 = fzero(f, 3.9);

% --- Highlight Roots on Plot ---
hold on;
plot([root1, root2, root3], [0, 0, 0], 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
legend('Function Curve', 'Identified Roots', 'Location', 'best');

% --- Results Visualization ---
fprintf('--- Transcendental Root Analysis (Interval [0, 5]) ---\n');
fprintf('Root 1: %8.4f\n', root1);
fprintf('Root 2: %8.4f\n', root2);
fprintf('Root 3: %8.4f\n', root3);

% Professional Scholarly Footer
fprintf('\nNumerical Insight: The fplot function intelligently handles the vertical asymptotes of the tangent function, making it superior to simple plot() for root exploration.\n');
