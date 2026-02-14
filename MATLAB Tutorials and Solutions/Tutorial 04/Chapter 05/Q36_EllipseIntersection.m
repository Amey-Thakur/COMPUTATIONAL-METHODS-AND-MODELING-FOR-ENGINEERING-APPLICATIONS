% =========================================================================================
% FILE NAME: Q36_EllipseIntersection.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script visualizes the intersection of two planar ellipses using implicit 
% plotting and provides an interactive interface for manual coordinate capture.
%
% PROBLEM STATEMENT (Q36):
% Planets and planetary satellites move in elliptical orbits. A certain ellipse 
% centered at the origin has the equation: x^2 + y^2/4 = 1.
% Another ellipse, also centered at the origin, is rotated relative to the 
% first ellipse. Its equation is: 0.5833x^2 - 0.2887xy + 0.4167y^2 = 1.
% We want to find all points where the ellipses intersect. Use the fimplicit 
% function and the hold command to plot both ellipses on the same plot. 
% Since both ellipses are centered at the origin, if they intersect they will 
% intersect at four points, so you will need to use the ginput function for 
% four points.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 5, Q36.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Functional Initialization (Implicit Forms) ---
% Ellipse 1: x^2 + y^2/4 - 1 = 0
f1 = @(x, y) x.^2 + (y.^2 / 4) - 1;

% Ellipse 2: 0.5833x^2 - 0.2887xy + 0.4167y^2 - 1 = 0
f2 = @(x, y) 0.5833.*x.^2 - 0.2887.*x.*y + 0.4167.*y.^2 - 1;

% --- Visualization Engine ---
figure('Color', 'w', 'Name', 'Planetary Orbit Intersections');
fimplicit(f1, [-3, 3], 'LineWidth', 2, 'Color', '#0072BD', 'DisplayName', 'Primary Ellipse');
hold on;
fimplicit(f2, [-3, 3], 'LineWidth', 2, 'Color', '#D95319', 'DisplayName', 'Rotated Ellipse');

% Aesthetics and Layout
grid on;
axis equal;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Horizontal Position (x)', 'FontSize', 12);
ylabel('Vertical Position (y)', 'FontSize', 12);
title('Implicit Ellipse Intersection Analysis', 'FontSize', 14, 'FontWeight', 'bold');
legend('Location', 'best');

% --- Interactive Intersection Capture ---
% Instructions for the user
fprintf('--- Interactive Intersection Step ---\n');
fprintf('The plot window should now be active. Please click on the 4 intersection points.\n');
fprintf('Waiting for input from Figure 1...\n');

% Coordinate capture via ginput
[xi, yi] = ginput(4);

% Highlight captured points on the plot
plot(xi, yi, 'kp', 'MarkerSize', 10, 'MarkerFaceColor', 'y', 'DisplayName', 'Captured Intersections');

% --- Results Visualization ---
fprintf('\n--- Captured Intersection Coordinates ---\n');
for i = 1:4
    fprintf('Point %d: (x = %8.4f, y = %8.4f)\n', i, xi(i), yi(i));
end

% Professional Scholarly Footer
fprintf('\nComputational Insight: While ginput provides rapid estimation, these intersection points could be numerically solved with high precision using fsolve or by calculating the resultant polynomial of the two quadratics.\n');
