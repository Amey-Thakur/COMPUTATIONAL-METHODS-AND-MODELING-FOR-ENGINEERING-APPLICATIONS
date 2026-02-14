% =========================================================================================
% FILE NAME: Q30_CycloidPlot.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script generates a precise parametric plot of a cycloid, the curve traced by a 
% point on the circumference of a circular wheel rolling along a straight line.
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 1, Q30.
%
% PARAMETRIC EQUATIONS:
% x = r * (phi - sin(phi))
% y = r * (1 - cos(phi))
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Configuration Parameters ---
r = 10; % Radius of the rolling wheel (inches)
phi = linspace(0, 4*pi, 1000); % Angular parameter range [0, 4*pi] (two full rotations)

% --- Parametric Computation ---
x = r * (phi - sin(phi));
y = r * (1 - cos(phi));

% --- Visualization Engine ---
figure('Color', 'w', 'Name', 'Parametric Cycloid Visualization');
plot(x, y, 'LineWidth', 2.5, 'Color', '#D95319');

% Aesthetics and Layout
grid on;
axis equal; % Ensures the geometric proportions are preserved (e.g., circular cross-section)
set(gca, 'FontName', 'Arial', 'FontSize', 10);

% Annotation and Labeling
title(['Cycloid Path Visualization (r = ', num2str(r), ' in)'], 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Horizontal Displacement (x) [inches]', 'FontSize', 12);
ylabel('Vertical Displacement (y) [inches]', 'FontSize', 12);

% Annotating the rotational limits
text(x(1), y(1), ' \leftarrow Start (\phi = 0)', 'VerticalAlignment', 'bottom');
text(x(end), y(end), ' \leftarrow End (\phi = 4\pi)', 'VerticalAlignment', 'bottom');

% Professional Scholarly Footer
fprintf('Geometrical Insight: The resulting curve represents two full arching cycles of a point rolling on a 10-inch radius circle.\n');
