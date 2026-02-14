% =========================================================================================
% FILE NAME: Q29_SphericalTankDrainage.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script models the drainage of a spherical fluid tank using Torricelli's 
% principle and the continuity equation. It solves the non-linear first-order 
% ODE for height h(t) and utilizes event detection to identify the time to empty.
%
% PROBLEM STATEMENT (Q29):
% The equation describing the water height h in a spherical tank with a drain 
% at the bottom is: pi(2rh - h^2) dh/dt = -Cd * A * sqrt(2gh).
% Standard parameters: r = 3 m, drain radius = 2 cm (0.02 m), Cd = 0.5, 
% initial height h(0) = 5 m, g = 9.81 m/s^2.
% a. Estimate how long it takes for the tank to empty.
% b. Plot the water height as a function of time until h(t) = 0.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 9, Q29.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Physical Constant Definition ---
r = 3;              % Tank radius (m)
r_hole = 0.02;      % Drain hole radius (m)
A_hole = pi * r_hole^2; % Cross-sectional area of hole (m^2)
Cd = 0.5;           % Discharge coefficient
g = 9.81;           % Gravity (m/s^2)
h0 = 5;             % Initial height (m)

% --- ODE Modeling ---
% dh/dt = [-Cd * A * sqrt(2*g*h)] / [pi * (2*r*h - h^2)]
dh_dt = @(t, h) (-Cd * A_hole * sqrt(2 * g * h)) / (pi * (2 * r * h - h^2));

% --- Computational Solution Stage (ODE45 with Events) ---
% We define an event to stop integration when water height reaches zero
options = odeset('Events', @drainEvent, 'RelTol', 1e-6, 'AbsTol', 1e-8);
t_span = [0, 1e6];  % Broad search range for time

[t_out, h_out, te, he, ie] = ode45(dh_dt, t_span, h0, options);

% --- Results Visualization ---
fprintf('--- Spherical Tank Drainage Results ---\n');
fprintf('Initial Fluid Height: %d m\n', h0);
fprintf('Estimated Time to Empty: %10.2f seconds (%.2f minutes)\n', te, te/60);

% --- Visualization Engine (Drainage Trajectory) ---
figure('Color', 'w', 'Name', 'Hydraulic Drainage Analysis');
plot(t_out, h_out, 'b-', 'LineWidth', 2);
grid on;
hold on;

% Mark the emptying point
plot(te, 0, 'rx', 'MarkerSize', 10, 'LineWidth', 2);
text(te, 0.5, sprintf(' T_{empty} = %.1f s', te), 'FontWeight', 'bold');

% Aesthetics and Labeling
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Water Height h(t) (m)', 'FontSize', 12);
title('Spherical Tank Drainage Dynamics: Water Height vs. Time', 'FontSize', 14, 'FontWeight', 'bold');

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The drainage rate decreases non-linearly as the head (pressure) drops and the cross-sectional area of the spherical segment changes. The singularities near h=0 are handled via MATLAB''s robust event detection, ensuring a precise termination of the physical model at the empty state.\n');

% --- Local Functions ---
function [value, isterminal, direction] = drainEvent(t, h)
    % Triggers when height reaches 0.001 to avoid numerical instability
    value = h - 0.0001; 
    isterminal = 1;  % Stop the integration
    direction = -1;  % Approaching from positive side
end
