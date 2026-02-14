% =========================================================================================
% FILE NAME: Q5_MultiStateSimulation.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script models a coupled system of two first-order linear differential 
% equations. It replicates the behavior of a Simulink model involving cross-coupled 
% state feedback.
%
% PROBLEM STATEMENT (Q5):
% Draw a simulation diagram for the following model:
% dx/dt = -3x + 2y + f(t)
% dy/dt = 4x - 5y
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 10, Q5.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Coupled System Modeling ---
% Assume f(t) is a unit step function
f_t = @(t) 1;

% State-Space Form: [x_dot; y_dot] = [-3 2; 4 -5] * [x; y] + [1; 0]*f(t)
coupled_system = @(t, states) [
    -3 * states(1) + 2 * states(2) + f_t(t);
     4 * states(1) - 5 * states(2)
];

% --- Computational Solution Stage (ODE45) ---
t_span = [0, 5];
initial_conditions = [0; 0];
[t_out, S_out] = ode45(coupled_system, t_span, initial_conditions);

x_sol = S_out(:, 1);
y_sol = S_out(:, 2);

% --- Visualization Engine (State-Space Convergence) ---
figure('Color', 'w', 'Name', 'Coupled System Dynamics');
plot(t_out, x_sol, 'r-', 'LineWidth', 2); hold on;
plot(t_out, y_sol, 'b--', 'LineWidth', 2);
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('State Amplitudes', 'FontSize', 12);
title('Transient Response of Coupled State Variables', 'FontSize', 14, 'FontWeight', 'bold');
legend('State x(t)', 'State y(t)', 'Location', 'northeast');

% --- Simulink Architectural Description (Logic Diagram) ---
% Path 1 (x-state):
% - Sum x: [f(t)] (+) AND [2*y] (+) AND [3*x] (-)
% - Integrator: 1/s -> Output x
% Path 2 (y-state):
% - Sum y: [4*x] (+) AND [5*y] (-)
% - Integrator: 1/s -> Output y
% Interconnections:
% - Output x feeds back to Sum x (Gain -3) and Sum y (Gain 4)
% - Output y feeds back to Sum y (Gain -5) and Sum x (Gain 2)

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The system exhibits a damped convergence toward equilibrium. The coupling terms (2y and 4x) provide cross-modal energy transfer, while the diagonal terms (-3 and -5) ensure asymptotic stability of the system.\n');
