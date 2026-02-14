% =========================================================================================
% FILE NAME: Q35_HydraulicDrainageSim.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script models the non-linear hydraulic drainage of a spherical tank. 
% It replicates the architectural logic of a Simulink model to determine the 
% time-varying water height and emptying time.
%
% PROBLEM STATEMENT (Q35):
% The equation describing the water height h in a spherical tank with a drain 
% at the bottom is: pi(2rh - h^2) dh/dt = -Cd * A * sqrt(2gh).
% Parameters: r = 3 m, drain radius = 2 cm (0.02 m), Cd = 0.5, h(0) = 5 m, g = 9.81 m/s^2.
% Use Simulink (modeled here via numerical ODE integration) to solve and plot 
% water height versus time until h(t) = 0.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 10, Q35.
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
A_hole = pi * r_hole^2; 
Cd = 0.5;           % Flow Discharge coefficient
g = 9.81;           % Gravity (m/s^2)
h0 = 5;             % Initial height (m)

% --- Hydraulic ODE Modeling ---
% dh/dt = [-Cd * A_hole * sqrt(2*g*h)] / [pi * (2*r*h - h^2)]
hydraulic_ode = @(t, h) (-Cd * A_hole * sqrt(2 * g * h)) / (pi * (2 * r * h - h^2));

% --- Computational Solution Stage (ODE45 with Stop Event) ---
% Defining an event function to terminate when h <= 0
options = odeset('Events', @drainEvent_Sim, 'RelTol', 1e-6);
[t_out, h_out, te, he, ie] = ode45(hydraulic_ode, [0, 100000], h0, options);

% --- Visualization Engine (Hydraulic Sink Profile) ---
figure('Color', 'w', 'Name', 'Hydraulic Simulation Analysis');
plot(t_out, h_out, 'b-', 'LineWidth', 2); hold on;
grid on;

% Labeling Empty Point
plot(te, 0, 'ro', 'MarkerFaceColor', 'r');
text(te, 0.4, sprintf('  Empty: %.1f s', te), 'FontWeight', 'bold');

set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Water Height h(t) (m)', 'FontSize', 12);
title('Spherical Tank Discharge: Simulink-Equivalent Numerical Model', 'FontSize', 14, 'FontWeight', 'bold');

% --- Simulink Architectural Description (Logic Diagram) ---
% 1. Feedback Loop: State h
% 2. Math Block: sqrt(2*g*h) -> calculates exit velocity
% 3. Gain Block: -Cd*A_hole -> calculates flow rate
% 4. Multiplier Block: (2*r*h - h^2) * pi -> calculates surface area at h
% 5. Divider Block: [Flow Rate] / [Surface Area] -> gives dh/dt
% 6. Integrator Block: (Init=5) -> Generates h from dh/dt

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The simulation illustrates Torricelli''s principle coupled with the geometry of a sphere. The flattening of the curve at high t is not due to friction, but due to the reduction in hydrostatic head and the volumetric change of the spherical vessel segments.\n');

% Local Event function for solver
function [value, isterminal, direction] = drainEvent_Sim(t, h)
    value = h - 0.0001; 
    isterminal = 1;
    direction = -1;
end
