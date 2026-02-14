% =========================================================================================
% FILE NAME: Q25_CascadedTransferFunctions.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script models a cascaded system of two second-order transfer functions. 
% It simulates the transient response of the aggregate system to a step input 
% f(t) = 75.
%
% PROBLEM STATEMENT (Q25):
% Use Transfer Function blocks to construct a Simulink model to plot the 
% solution of the following equations for 0 <= t <= 2:
% 3x'' + 15x' + 18x = f(t)
% 2y'' + 16y' + 50y = x(t)
% where f(t) = 75 * u_s(t) (Unit step). Initial conditions are zero.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 10, Q25.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% - Toolbox: Control System Toolbox
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Transfer Function Modeling ---
% Stage 1: X(s)/F(s) = 1 / (3s^2 + 15s + 18)
sys1 = tf([1], [3, 15, 18]);

% Stage 2: Y(s)/X(s) = 1 / (2s^2 + 16s + 50)
sys2 = tf([1], [2, 16, 50]);

% Cascaded System: Y(s)/F(s) = sys1 * sys2
sys_total = sys1 * sys2;

% --- Computational Solution Stage (Step Response) ---
t_span = 0:0.01:2;
f_input = 75; % Magnitude of the step effort

% Compute step response (Note: step() assumes unit magnitude)
[x_steady, t1] = step(f_input * sys1, t_span);
[y_total, t2] = step(f_input * sys_total, t_span);

% --- Visualization Engine (System Propagation) ---
figure('Color', 'w', 'Name', 'Cascaded Dynamic Analysis');

% Subplot 1: Intermediate State x(t)
subplot(2, 1, 1);
plot(t1, x_steady, 'b-', 'LineWidth', 2);
grid on;
title('Intermediate Stage Response: State x(t)', 'FontSize', 12);
ylabel('Amplitude x(t)', 'FontSize', 10);

% Subplot 2: Final System Output y(t)
subplot(2, 1, 2);
plot(t2, y_total, 'r-', 'LineWidth', 2);
grid on;
title('Complete System Response: Final Output y(t)', 'FontSize', 12);
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Amplitude y(t)', 'FontSize', 10);

% --- Simulink Architectural Description (Logic Diagram) ---
% 1. Source Block: Constant/Step (Val=75)
% 2. Transfer Fcn Block 1: [1] / [3 15 18] -> Output x(t)
% 3. Transfer Fcn Block 2: [1] / [2 16 50] -> Output y(t)
% 4. Scope: Monitor signals x(t) and y(t)

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The cascaded system acts as a high-order low-pass filter (4th order total). State x(t) reaches its steady-state relatively quickly, while y(t) exhibits a slower, more damped response as it must process the filtered signal from the first stage.\n');
