% =========================================================================================
% FILE NAME: Q42_TemperatureMapping.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script visualizes the steady-state temperature distribution on a square metal 
% plate using 3D surface and contour mapping to identify gradients and point extrema.
%
% PROBLEM STATEMENT (Q42):
% A square metal plate is heated to 80°C at the corner corresponding to x = y = 1. 
% The temperature distribution in the plate is described by:
% T = 80 * e^(- (x-1)^2 ) * e^(- 3 * (y-1)^2 )
% Obtain the surface and contour plots for the temperature. Label each axis. 
% What is the temperature at the corner corresponding to x = y = 0?
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 5, Q42.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Spatial Grid Generation ---
% Defining the square plate from 0 to 1 along both axes
x_vec = linspace(0, 1.5, 100); % Slightly extended for visual periphery
y_vec = linspace(0, 1.5, 100);
[X, Y] = meshgrid(x_vec, y_vec);

% --- Temperature Functional Computation ---
T = 80 .* exp(-(X - 1).^2) .* exp(-3 .* (Y - 1).^2);

% --- Visualization Engine ---
figure('Color', 'w', 'Name', 'Steady-State Thermal Analysis');

% Subplot 1: 3D Surface Plot
subplot(1, 2, 1);
surf(X, Y, T, 'EdgeColor', 'none');
shading interp;
colormap hot;
colorbar;
grid on;
xlabel('Position (x) [m]'); ylabel('Position (y) [m]'); zlabel('Temperature (T) [°C]');
title('3D Temperature Surface Profile', 'FontWeight', 'bold');
view(45, 30);

% Subplot 2: Contour Map
subplot(1, 2, 2);
contourf(X, Y, T, 20); % 20 contour levels for high resolution
colorbar;
xlabel('Position (x) [m]'); ylabel('Position (y) [m]');
title('Thermal Gradient Contour Map', 'FontWeight', 'bold');

% --- Point Analysis ---
% Temperature at x = 0, y = 0
T_origin = 80 * exp(-(0-1)^2) * exp(-3*(0-1)^2);

% --- Results Visualization ---
fprintf('\n--- Thermal Point Analysis ---\n');
fprintf('Temperature at Corner (0,0): %8.4f °C\n', T_origin);

% Professional Scholarly Footer
fprintf('\nScientific Insight: The distribution reveals a localized heat source at (1,1) with steeper decay along the y-axis due to the coefficient of 3, indicating anisotropic thermal properties or boundary conditions.\n');
