% =========================================================================================
% FILE NAME: Q5_AccelerationIntegration.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script computes the velocity of an object at a specific time t=20s by 
% numerically integrating its time-varying acceleration function a(t) = 5t*sin(8t).
%
% PROBLEM STATEMENT (Q5):
% A certain object's acceleration is given by a(t) = 5t sin 8t m/s^2. 
% Compute its velocity at t = 20 s if its initial velocity is zero.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 9, Q5.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Analytical Modeling ---
% Velocity v(t) = Integral[a(t) dt] from 0 to t
% v(20) = Integral[5t * sin(8t)] dt from 0 to 20

% Define the acceleration function handle
acc_func = @(t) 5 * t .* sin(8 * t);

% --- Numerical Integration Stage ---
% We utilize the 'integral' function for high-precision quadrature
v_20 = integral(acc_func, 0, 20);

% --- Results Visualization ---
fprintf('--- Kinematic Integration Results ---\n');
fprintf('Acceleration function: a(t) = 5t sin(8t)\n');
fprintf('Initial Velocity:      0 m/s\n');
fprintf('Target Time:           20.0 s\n');
fprintf('Calculated Velocity:   %8.4f m/s\n', v_20);

% --- Visualization Engine (Acceleration Profile) ---
t_smooth = linspace(0, 20, 1000);
a_smooth = acc_func(t_smooth);

figure('Color', 'w', 'Name', 'Acceleration Profile Analysis');
plot(t_smooth, a_smooth, 'b-', 'LineWidth', 1.5);
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Acceleration (m/s^2)', 'FontSize', 12);
title('Time-Varying Object Acceleration: a(t) = 5t sin(8t)', 'FontSize', 14, 'FontWeight', 'bold');

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The numerical integration of the oscillatory acceleration function reveals the net velocity accumulation. The high frequency of the sin(8t) term results in rapid alternating acceleration/deceleration phases, emphasizing the importance of precise quadrature for dynamic kinematic models.\n');
