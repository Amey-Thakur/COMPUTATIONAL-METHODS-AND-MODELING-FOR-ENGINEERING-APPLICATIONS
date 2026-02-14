% =========================================================================================
% FILE NAME: Q45_TwoMassSystemResponse.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script models a two-mass-spring-damper system (2-DOF) subjected to a 
% piecewise triangular forcing function. It computes the state-space response 
% and visualizes the coupling between the primary and secondary masses.
%
% PROBLEM STATEMENT (Q45):
% Equations of motion:
% m1*x1'' + (c1+c2)x1' + (k1+k2)x1 - c2*x2' - k2*x2 = 0
% m2*x2'' + c2*x2' + k2*x2 - c2*x1' - k2*x1 = f(t)
% Given parameters: m1=m2=1, c1=3, c2=1, k1=1, k2=4.
% Forcing function f(t): t (0<=t<=1), 2-t (1<t<2), 0 (t>=2).
% Develop a model to plot response x1(t) for 0 <= t <= 10. Initial conditions zero.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 10, Q45.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Parameter Definitions ---
m1 = 1; m2 = 1;
c1 = 3; c2 = 1;
k1 = 1; k2 = 4;

% --- Piecewise Forcing Pulse f(t) ---
% f(t) describes a triangle pulse peaking at t=1
f_t = @(t) (t >= 0 && t <= 1) * t + ...
           (t > 1 && t < 2) * (2 - t) + ...
           (t >= 2) * 0;

% --- State-Space System Construction ---
% States: S = [x1; x1_dot; x2; x2_dot]
% DS = [x1_dot; x1_ddot; x2_dot; x2_ddot]
% 1. x1_ddot = [ -(c1+c2)x1' - (k1+k2)x1 + c2*x2' + k2*x2 ] / m1
% 2. x2_ddot = [ f(t) - c2*x2' - k2*x2 + c2*x1' + k2*x1 ] / m2

two_mass_ode = @(t, S) [
    S(2);
    (-(c1 + c2) * S(2) - (k1 + k2) * S(1) + c2 * S(4) + k2 * S(3)) / m1;
    S(4);
    (f_t(t) - c2 * S(4) - k2 * S(3) + c2 * S(2) + k2 * S(1)) / m2
];

% --- Computational Solution Stage (ODE45) ---
t_span = [0, 10];
S0 = [0; 0; 0; 0]; % Zero initial energy
[t_out, S_out] = ode45(two_mass_ode, t_span, S0);

x1_sol = S_out(:, 1);
x2_sol = S_out(:, 3);

% --- Visualization Engine (Coupled Transient Dynamics) ---
figure('Color', 'w', 'Name', '2-DOF Mechanical Response');
plot(t_out, x1_sol, 'b-', 'LineWidth', 2); hold on;
plot(t_out, x2_sol, 'r--', 'LineWidth', 1.5);
grid on;

% Marker for Pulse peak at t=1
f_vals = arrayfun(f_t, t_out);
plot(t_out, f_vals/5, 'k:', 'LineWidth', 1); % Scaled f(t) for reference

set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Displacement (m)', 'FontSize', 12);
title('Response x_1(t) and x_2(t) for Piecewise Triangular Force f(t)', 'FontSize', 14, 'FontWeight', 'bold');
legend('Primary Mass x1(t)', 'Secondary Mass x2(t)', 'Scaled Input f(t)/5', 'Location', 'northeast');

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The triangular pulse f(t) initially excites mass 2, which then transfers energy to mass 1 through the coupling spring k2 and damper c2. Even after the pulse terminates at t=2, the system continues to oscillate as energy is dissipated through the foundational damper c1 and coupling damper c2.\n');
