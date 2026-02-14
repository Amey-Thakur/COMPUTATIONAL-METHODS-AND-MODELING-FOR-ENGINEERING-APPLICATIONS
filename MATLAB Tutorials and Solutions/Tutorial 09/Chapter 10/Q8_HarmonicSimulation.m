% =========================================================================================
% FILE NAME: Q8_HarmonicSimulation.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script models a second-order differential equation with dual harmonic 
% forcing functions. It computes the system response y(t) given specific 
% initial conditions for position and velocity.
%
% PROBLEM STATEMENT (Q8):
% Create a Simulink model to plot the solution of the following equation for 0 <= t <= 6:
% 10y'' = 7 sin(4t) + 5 cos(3t)
% Initial Conditions: y(0) = 3, y'(0) = 2.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 10, Q8.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Analytical System Modeling ---
% Rearranging for solver: y'' = (7*sin(4t) + 5*cos(3t)) / 10
% State variables: x1 = y, x2 = y'
% dx1/dt = x2
% dx2/dt = (7*sin(4*t) + 5*cos(3*t)) / 10

harmonic_ode = @(t, x) [
    x(2);
    (7 * sin(4 * t) + 5 * cos(3 * t)) / 10
];

% --- Computational Solution Stage (ODE45) ---
t0 = 0;
tf = 6;
y_init = [3; 2]; % y(0)=3, y'(0)=2
[t_out, S_out] = ode45(harmonic_ode, [t0, tf], y_init);

y_sol = S_out(:, 1);

% --- Visualization Engine (Harmonic Trajectory) ---
figure('Color', 'w', 'Name', 'Harmonic Forced Vibration Analysis');
plot(t_out, y_sol, 'm-', 'LineWidth', 2);
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Displacement y(t)', 'FontSize', 12);
title('Transient Response: 10\ddot{y} = 7sin(4t) + 5cos(3t)', 'FontSize', 14, 'FontWeight', 'bold');

% --- Simulink Architectural Description (Logic Diagram) ---
% 1. Source Block A: Sine Wave (Amp=7, Freq=4)
% 2. Source Block B: Sine Wave (Amp=5, Freq=3, Phase=pi/2 for Cosine)
% 3. Summing Point: [Source A] (+) [Source B] (+)
% 4. Gain Block: 1/10 (to get y'')
% 5. Integrator 1: (Init=2) -> Output y'
% 6. Integrator 2: (Init=3) -> Output y
% 7. Scope: View y

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The resulting motion is a superposition of two distinct frequencies modulated onto the initial kinematic state. Since there is no damping term (cy''), the displacement exhibits pure oscillatory behavior compounded by the initial velocity and position.\n');
