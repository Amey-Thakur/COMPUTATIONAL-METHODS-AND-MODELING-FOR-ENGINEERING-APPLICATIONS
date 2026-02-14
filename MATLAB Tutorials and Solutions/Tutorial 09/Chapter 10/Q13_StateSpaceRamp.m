% =========================================================================================
% FILE NAME: Q13_StateSpaceRamp.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script models a second-order linear state-space system subjected to a 
% ramp input f(t) = 3t. It demonstrates how to handle time-varying inputs in 
% ordinary differential equation solvers.
%
% PROBLEM STATEMENT (Q13):
% Construct a Simulink model to plot the solution of the following equations 
% for 0 <= t <= 2:
% dx1/dt = -6x1 + 4x2
% dx2/dt = 5x1 - 7x2 + f(t)
% where f(t) = 3t. Use the Ramp block in the Sources library.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 10, Q13.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- State-Space Modeling ---
% dx/dt = Ax + Bu
% x = [x1; x2]
A = [-6, 4; 5, -7];
B = [0; 1];
f_ramp = @(t) 3 * t;

% Coupled ODE Handle
ramp_ode = @(t, x) A * x + B * f_ramp(t);

% --- Computational Solution Stage (ODE45) ---
t_span = [0, 2];
x0 = [0; 0]; % Assume zero initial energy
[t_out, x_out] = ode45(ramp_ode, t_span, x0);

% --- Visualization Engine (Dynamic Response) ---
figure('Color', 'w', 'Name', 'State-Space Ramp Response Analysis');
plot(t_out, x_out(:, 1), 'b-', 'LineWidth', 2); hold on;
plot(t_out, x_out(:, 2), 'r--', 'LineWidth', 2);
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('State Amplitudes', 'FontSize', 12);
title('Transient Response to Ramp Input f(t) = 3t', 'FontSize', 14, 'FontWeight', 'bold');
legend('x1(t)', 'x2(t)', 'Location', 'best');

% --- Simulink Architectural Description (Logic Diagram) ---
% 1. Source Block: Ramp (Slope=3, Start=0)
% 2. Integrator 1: Output x1
% 3. Integrator 2: Output x2
% 4. State x1 loop: Summation of [-6*x1] and [4*x2]
% 5. State x2 loop: Summation of [5*x1] and [-7*x2] and [f(t)]
% Note: Ramp block directly represents f(t) = 3t.

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The system response shows linear-like growth in the states after an initial transient phase. The ramp input continuously adds energy to the system, and since the system is stable (negative eigenvalues of A), the states diverge linearly at a rate determined by the forcing slope and the system gain matrix.\n');
