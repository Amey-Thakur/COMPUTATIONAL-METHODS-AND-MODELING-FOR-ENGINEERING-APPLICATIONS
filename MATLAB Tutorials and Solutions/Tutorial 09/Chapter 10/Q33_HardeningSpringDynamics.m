% =========================================================================================
% FILE NAME: Q33_HardeningSpringDynamics.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script models a mass supported by a nonlinear 'hardening' spring. 
% It solves the second-order non-linear ODE to analyze the periodic oscillation 
% and restores kinematic states.
%
% PROBLEM STATEMENT (Q33):
% The following model describes a mass supported by a nonlinear, hardening spring. 
% Units are SI. Use g = 9.81 m/s^2.
% 5y'' = 5g - (900y + 1700y^3)
% Initial Conditions: y(0) = 0.5 m, y'(0) = 0.
% Create a Simulink model to plot the solution for 0 <= t <= 2.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 10, Q33.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Mathematical System Modeling ---
% 5y'' = 5*g - (900*y + 1700*y^3)
% y'' = g - (900/5)*y - (1700/5)*y^3
% y'' = 9.81 - 180*y - 340*y^3

g_const = 9.81;
hardening_ode = @(t, x) [
    x(2);
    g_const - 180 * x(1) - 340 * x(1)^3
];

% --- Computational Solution Stage (ODE45) ---
t0 = 0;
tf = 2;
y0 = [0.5; 0]; % Position=0.5, Velocity=0
[t_out, S_out] = ode45(hardening_ode, [t0, tf], y0);

y_sol = S_out(:, 1);

% --- Visualization Engine (Phase-Space Oscillation) ---
figure('Color', 'w', 'Name', 'Non-linear Vibration Analysis');
plot(t_out, y_sol, 'g-', 'LineWidth', 2);
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Displacement y(t) (m)', 'FontSize', 12);
title('Dynamics of a Nonlinear Hardening Spring System', 'FontSize', 14, 'FontWeight', 'bold');

% --- Simulink Architectural Description (Logic Diagram) ---
% 1. Constant Block: 5g (Gravity Force)
% 2. Integrator 1: (Init=0) -> Output y' (Velocity)
% 3. Integrator 2: (Init=0.5) -> Output y (Position)
% 4. Summing Junction (Acceleration): [5g] (+) [-900*y] (-) [-1700*y^3] (-)
% 5. Gain Block: 1/5 (Coefficient of y'') 
% 6. Math Function (Power): y^3 logic block for non-linearity

% Professional Scholarly Footer
fprintf('\nEngineering Insight: A hardening spring has a stiffness that increases with displacement (due to the y^3 term). This results in a "stiffer" restoring force at higher amplitudes, leading to non-sinusoidal periodicity. The system oscillates around the static equilibrium point where 5g = 900y + 1700y^3.\n');
