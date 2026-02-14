% =========================================================================================
% FILE NAME: Q27_TemperaturePlot.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script visualizes temperature variation over time by plotting the function
% T = 7*ln(t) - 8*e^(0.3t) within the temporal interval [1, 3].
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 1, Q27.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;    % Clear Command Window for optimal visualization
clear;  % Purge workspace variables to maintain computational integrity
close all; % Close existing figure windows for a fresh plotting environment

% --- Data Acquisition & Grid Generation ---
% Define the time interval [1, 3] with high-resolution sampling for smooth plotting
t = linspace(1, 3, 500); % 500 points for a precise continuous curve

% --- Functional Computation ---
% T(t) = 7 * ln(t) - 8 * e^(0.3 * t)
temperature = 7 * log(t) - 8 * exp(0.3 * t);

% --- Visualization Engine ---
figure('Color', 'w', 'Name', 'Temperature Variation Analysis');
plot(t, temperature, 'LineWidth', 2, 'Color', '#0072BD');

% Grid and Aesthetic Configuration
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
ax = gca;
ax.GridLineStyle = ':';
ax.GridAlpha = 0.4;

% Annotation and Labeling
title('Temperature vs. Time Analysis', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Time (t) [minutes]', 'FontSize', 12);
ylabel('Temperature (T) [°Celsius]', 'FontSize', 12);

% Professional Scholarly Footer
fprintf('Scholarly Insight: The temperature profile exhibits a non-linear decay characteristic of combined logarithmic and exponential dynamics.\n');
