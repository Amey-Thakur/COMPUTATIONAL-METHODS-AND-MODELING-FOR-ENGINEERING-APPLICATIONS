% =========================================================================================
% FILE NAME: Q44_StateSpaceAnalysis.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script implements a linear state-space model for a mechanical system. 
% It computes the free-energy response (initial state) and the forced response 
% (step input) using specialized Control System Toolbox functions.
%
% PROBLEM STATEMENT (Q44):
% The following state model describes the motion of a mass connected to a spring:
% [x1'; x2'] = [0 1; -5 -2][x1; x2] + [0; 1]f(t)
% a. Use the initial function to plot x1 if the initial position is 5 and 
%    initial velocity is 3.
% b. Use the step function to plot the step response of position and velocity 
%    for zero initial conditions, where the magnitude of the step input is 10.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 9, Q44.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% - Toolbox: Control System Toolbox
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- State-Space Matrix Definition ---
% dx/dt = Ax + Bu
A = [0, 1; -5, -2];
B = [0; 1];
C = [1, 0; 0, 1];     % Output all states (x1, x2)
D = [0; 0];

% Create State-Space Object
sys = ss(A, B, C, D);

% --- Task A: Initial State Response ---
x0 = [5; 3];         % Initial Position=5, Velocity=3
t_initial = 0:0.01:10;

% Compute free response
[y_initial, t_initial] = initial(sys, x0, t_initial);

% --- Task B: Forced Step Response ---
input_mag = 10;
t_step = 0:0.01:10;

% Compute step response (Note: step function assumes magnitude 1, so we scale)
[y_step, t_step] = step(input_mag * sys, t_step);

% --- Visualization Engine (Phase-Space and Time-Series) ---
figure('Color', 'w', 'Name', 'State-Space Response Characterization');

% Subplot 1: Free Response (Initial Conditions)
subplot(2, 1, 1);
plot(t_initial, y_initial(:, 1), 'b-', 'LineWidth', 2);
grid on;
title('Initial State Response: x1 (Position) for x(0) = [5, 3]', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Position x1', 'FontSize', 10);

% Subplot 2: Forced Response (Step Input)
subplot(2, 1, 2);
plot(t_step, y_step(:, 1), 'r-', 'LineWidth', 1.5); hold on;
plot(t_step, y_step(:, 2), 'g--', 'LineWidth', 1.5);
grid on;
title('Step Response (Magnitude = 10): Position and Velocity', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Amplitude', 'FontSize', 10);
legend('x1 (Position)', 'x2 (Velocity)', 'Location', 'northeast');

% --- Results Visualization ---
fprintf('--- State-Space Analysis Completed ---\n');
fprintf('Matrix A Eigenvalues: \n'); disp(eig(A));

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The system matrices define a stable second-order process. The initial response shows the decay of stored internal energy, while the step response demonstrates how the system transitions to a new steady-state displacement (2 units) under a constant forcing effort of 10 units.\n');
