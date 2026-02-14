% =========================================================================================
% FILE NAME: Q3_NonLinearSimulation.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script implements a first-order non-linear differential equation model 
% derived from a Simulink simulation diagram. It solves for y(t) given a constant 
% forcing function f(t) = 1.
%
% PROBLEM STATEMENT (Q3):
% Draw a simulation diagram for the following equation:
% 3dy/dt + 5 sin(y) = f(t)
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 10, Q3.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Simulation Model Parameters ---
% Rearranging for solver: dy/dt = [f(t) - 5*sin(y)] / 3
f_t = @(t) 1; % Assume constant unit forcing function
dydt = @(t, y) (f_t(t) - 5 * sin(y)) / 3;

% --- Computational Solution Stage (ODE45) ---
t_span = [0, 10];
y0 = 0; % Assume zero initial displacement
[t_out, y_out] = ode45(dydt, t_span, y0);

% --- Visualization Engine (State Trajectory) ---
figure('Color', 'w', 'Name', 'Non-Linear Dynamic Response');
plot(t_out, y_out, 'b-', 'LineWidth', 2);
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Output Variable y(t)', 'FontSize', 12);
title('Non-Linear Response: 3\dot{y} + 5sin(y) = f(t)', 'FontSize', 14, 'FontWeight', 'bold');

% --- Simulink Architectural Description (Logic Diagram) ---
% 1. Source Block: Constant/Step (f(t))
% 2. Summing Junction: [f(t)] (+) AND [5*sin(y)] (-)
% 3. Gain Block: 1/3 (Coefficient of dy/dt)
% 4. Integrator Block: 1/s (Generates y from dy/dt)
% 5. Feedback Loop: Output y -> Sin function -> Gain (5) -> Summing Junction

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The simulation diagram logic reveals a non-linear feedback loop. The sin(y) term introduces state-dependent damping/restoration, leading to potentially non-linear equilibrium points as y(t) evolves under constant forcing.\n');
