% =========================================================================================
% FILE NAME: Q18_SaturatedForcing.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script models a first-order non-linear differential equation driven by a 
% saturated sinusoidal signal. It demonstrates the behavior of dynamical systems 
% when subjected to input limits (clipping).
%
% PROBLEM STATEMENT (Q18):
% Construct a Simulink model for 5 dx/dt + sin(x) = f(t).
% Initial Condition: x(0) = 0.
% Forcing function f(t) is a saturated version of g(t) = 10 sin(4t):
% f(t) = -5 if g(t) <= -5
% f(t) = g(t) if -5 < g(t) < 5
% f(t) = 5 if g(t) >= 5
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 10, Q18.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Piecewise Forcing Function Logic ---
g_t = @(t) 10 * sin(4 * t);

% f(t) with hard-saturation at +/- 5
f_t = @(t) max(-5, min(5, g_t(t)));

% --- Non-Linear System Modeling ---
% dx/dt = [f(t) - sin(x)] / 5
saturated_ode = @(t, x) (f_t(t) - sin(x)) / 5;

% --- Computational Solution Stage (ODE45) ---
t0 = 0;
tf = 5;
x0 = 0;
[t_out, x_out] = ode45(saturated_ode, [t0, tf], x0);

% Generate forcing signals for visualization
g_profile = arrayfun(g_t, t_out);
f_profile = arrayfun(f_t, t_out);

% --- Visualization Engine (Saturation Effects) ---
figure('Color', 'w', 'Name', 'Input Saturation Performance');

% Subplot 1: Forcing Signal Comparison
subplot(2, 1, 1);
plot(t_out, g_profile, 'k:', 'LineWidth', 1); hold on;
plot(t_out, f_profile, 'r-', 'LineWidth', 2);
grid on;
title('Saturated Forcing Function f(t) vs. Raw Signal g(t)', 'FontSize', 12);
ylabel('Forcing Amplitude', 'FontSize', 10);
legend('Raw g(t)=10sin(4t)', 'Saturated f(t)', 'Location', 'northeast');

% Subplot 2: Resulting State x(t)
subplot(2, 1, 2);
plot(t_out, x_out, 'b-', 'LineWidth', 2);
grid on;
title('System Response x(t) under Saturated Excitation', 'FontSize', 12);
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Outcome x(t)', 'FontSize', 10);

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The saturation of the input signal at +/- 5 units prevents the system from experiencing the full peak-to-peak amplitude of the 10sin(4t) wave. This produces a "squared-off" response curve in the derivative, leading to a smoother, limited excursion of the state variable x(t) compared to an unsaturated linear model.\n');
