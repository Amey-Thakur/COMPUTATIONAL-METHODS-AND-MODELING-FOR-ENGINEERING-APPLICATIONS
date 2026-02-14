% =========================================================================================
% FILE NAME: Q22_MotorSpeedModeling.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script models the rotational speed of a motor using non-linear curve fitting 
% techniques to determine empirical constants b and c.
%
% PROBLEM STATEMENT (Q22):
% When a constant voltage was applied to a certain motor initially at rest, its 
% rotational speed s(t) versus time was measured. The data appear in the 
% following table:
% Time (sec): [1, 2, 3, 4, 5, 6, 7, 8, 10]
% Speed (rpm): [1210, 1866, 2301, 2564, 2724, 2881, 2879, 2915, 3010]
% Determine whether the following function can describe the data. If so, find the 
% values of the constants b and c: s(t) = b * (1 - e^(ct))
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 5, Q22.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Experimental Dataset Acquisition ---
time = [1, 2, 3, 4, 5, 6, 7, 8, 10];
speed = [1210, 1866, 2301, 2564, 2724, 2881, 2879, 2915, 3010];

% --- Mathematical Modeling & Optimization ---
% Model: s(t) = b * (1 - exp(c * t))
% Optimization Objective: Minimize the Sum of Squared Errors (SSE)
sse_func = @(params) sum((speed - params(1) * (1 - exp(params(2) * time))).^2);

% Initial Guesses:
% b (steady-state speed) ~ 3000
% c (rate constant) ~ -0.5
initial_guesses = [3000, -0.5];

% Optimization via fminsearch (Simplex algorithm)
optimal_params = fminsearch(sse_func, initial_guesses);
b_opt = optimal_params(1);
c_opt = optimal_params(2);

% --- Validation and Visualization ---
time_smooth = linspace(0, 10, 200);
speed_fit = b_opt * (1 - exp(c_opt * time_smooth));

figure('Color', 'w', 'Name', 'Motor Dynamics Characterization');
plot(time, speed, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6); % Data points
hold on;
plot(time_smooth, speed_fit, 'r-', 'LineWidth', 2); % Regression curve

% Aesthetics and Labeling
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Time (t) [seconds]', 'FontSize', 12);
ylabel('Rotational Speed (s) [RPM]', 'FontSize', 12);
title('Motor Speed Curve Fitting Analysis', 'FontSize', 14, 'FontWeight', 'bold');
legend('Measured Data', sprintf('Model Fit: b=%.2f, c=%.4f', b_opt, c_opt), 'Location', 'southeast');

% --- Results Visualization ---
fprintf('--- Motor Speed Model Parameters ---\n');
fprintf('Optimized Constant b: %8.2f RPM\n', b_opt);
fprintf('Optimized Constant c: %8.4f s^-1\n', c_opt);
fprintf('Final SSE:           %8.2e\n', sse_func(optimal_params));

% Professional Scholarly Footer
fprintf('\nModel Insight: The negative value of constant c confirms the expected asymptotic behavior where speed approaches limit b as time increases.\n');
