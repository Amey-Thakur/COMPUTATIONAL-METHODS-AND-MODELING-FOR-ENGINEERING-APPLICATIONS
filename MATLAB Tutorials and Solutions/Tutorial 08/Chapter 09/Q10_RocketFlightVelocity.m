% =========================================================================================
% FILE NAME: Q10_RocketFlightVelocity.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script models the vertical flight of a rocket under constant thrust with 
% time-varying mass due to fuel consumption. It solves the equation of motion 
% using the ODE45 numerical solver to determine velocity at burnout.
%
% PROBLEM STATEMENT (Q10):
% A rocket's mass decreases as it burns fuel. The equation of motion is 
% m(t) dv/dt = T - m(t)g, where m(t) = m0(1 - rt/b).
% Given: 
% T = 48,000 N, m0 = 2200 kg, r = 0.8, g = 9.81 m/s^2, b = 40 s.
% Determine the rocket's velocity at burnout (t = b = 40s).
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 9, Q10.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Design Parameters & Constants ---
T = 48000;          % Thrust (N)
m0 = 2200;          % Initial Mass (kg)
r = 0.8;            % Fraction of mass burnt
g = 9.81;           % Gravity (m/s^2)
b = 40;             % Burn time (s)

% --- ODE Modeling ---
% State equation: dv/dt = T/m(t) - g
% where m(t) = m0 * (1 - r*t/b)
m_func = @(t) m0 * (1 - (r * t) / b);
dvdt = @(t, v) (T / m_func(t)) - g;

% --- Computational Solution Stage (ODE45) ---
t_span = [0, b];    % Burn duration from 0 to 40s
v0 = 0;             % Initial velocity (m/s)

% solve using Runge-Kutta 4th/5th order Method
[t_out, v_out] = ode45(dvdt, t_span, v0);

% Final velocity at burnout
v_burnout = v_out(end);

% --- Visualization Engine (Velocity Profile) ---
figure('Color', 'w', 'Name', 'Rocket Burn Phase Kinematics');
plot(t_out, v_out, 'r-', 'LineWidth', 2);
grid on;
hold on;

% Burnout highlight
plot(t_out(end), v_burnout, 'ko', 'MarkerFaceColor', 'k');
text(t_out(end)-5, v_burnout, sprintf('  Burnout: %.2f m/s', v_burnout), ...
    'VerticalAlignment', 'top', 'FontWeight', 'bold');

% Aesthetics and Labeling
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Vertical Velocity (m/s)', 'FontSize', 12);
title('Rocket Velocity Profile during Powered Flight', 'FontSize', 14, 'FontWeight', 'bold');

% --- Results Visualization ---
fprintf('--- Rocket Performance Results ---\n');
fprintf('Initial Mass (m0):   %d kg\n', m0);
fprintf('Thrust (T):          %d N\n', T);
fprintf('Burn Duration (b):    %d s\n', b);
fprintf('Velocity at Burnout: %8.4f m/s\n', v_burnout);

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The increasing slope of the velocity curve demonstrates the accelerating effect of mass reduction. As fuel is consumed, the thrust-to-weight ratio increases significantly, leading to non-linear velocity accumulation until burnout at t=40s.\n');
