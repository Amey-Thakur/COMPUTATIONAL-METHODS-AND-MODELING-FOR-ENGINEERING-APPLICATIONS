% =========================================================================================
% FILE NAME: Q15_SinusoidalCoupling.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script models a coupled first-order linear system driven by a sinusoidal 
% forcing function. It visualizes the transient and steady-state oscillations 
% of both state variables.
%
% PROBLEM STATEMENT (Q15):
% Construct a Simulink model to plot the solution of the following equations 
% for 0 <= t <= 10:
% dx/dt = -5x + 3y + 5 sin(2t)
% dy/dt = 3x - 4y
% Initial Conditions: x(0) = 0, y(0) = 0.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 10, Q15.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Analytical System Modeling ---
% dx/dt = -5x + 3y + 5*sin(2t)
% dy/dt = 3x - 4y
% State Vector: [x; y]

forcing_func = @(t) 5 * sin(2 * t);
system_ode = @(t, S) [
    -5 * S(1) + 3 * S(2) + forcing_func(t);
     3 * S(1) - 4 * S(2)
];

% --- Computational Solution Stage (ODE45) ---
t_span = [0, 10];
x0 = [0; 0];
[t_out, S_out] = ode45(system_ode, t_span, x0);

x_sol = S_out(:, 1);
y_sol = S_out(:, 2);

% --- Visualization Engine (Oscillatory Dynamics) ---
figure('Color', 'w', 'Name', 'Coupled Sinusoidal Response');
plot(t_out, x_sol, 'b-', 'LineWidth', 2); hold on;
plot(t_out, y_sol, 'r--', 'LineWidth', 2);
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Amplitude', 'FontSize', 12);
title('State Trajectories for Forced Coupled System', 'FontSize', 14, 'FontWeight', 'bold');
legend('State x(t)', 'State y(t)', 'Location', 'northeast');

% --- Simulink Architectural Description (Logic Diagram) ---
% 1. Source Block: Sine Wave (Amp=5, Freq=2)
% 2. Summing Point (for x): [Source] (+) [3*y] (+) [-5*x] (+)
% 3. Integrator 1: Output x
% 4. Summing Point (for y): [3*x] (+) [-4*y] (+)
% 5. Integrator 2: Output y
% 6. Feedback Loops establish the cross-coupling (3x and 3y signals)

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The system filters the 2 rad/s input frequency through its internal coupling. State x(t) receives the direct forcing, while state y(t) responds as a secondary oscillatory mode through the coupling gain 3x. The phase shift between x and y is characteristic of the system''s time constants.\n');
