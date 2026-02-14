% =========================================================================================
% FILE NAME: Q19_ProjectileAnalysis.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script performs a comprehensive kinematic analysis of projectile motion, 
% evaluating height, range, and flight duration across varying initial conditions.
%
% PROBLEM STATEMENT (Q19):
% The height h(t) and horizontal distance x(t) traveled by a ball thrown at an 
% angle A with a speed v are given by:
% h(t) = v*t*sin(A) - 0.5*g*t^2
% x(t) = v*t*cos(A)
% At Earth's surface, g = 9.81 m/s^2.
% a. Suppose v = 20 m/s at an angle of 25. Compute max height, distance, and time.
% b. Plot the ball's trajectory for part a.
% c. Plot trajectories for A = 45 corresponding to v = 20, 24, 28, 32, 36 m/s.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 5, Q19.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Constants and Shared Parameters ---
g = 9.81; % Acceleration due to gravity (m/s^2)

% --- Part (a): Specific Kinematic Computation ---
v_a = 20;
A_a = 25; % Degrees

% Convert angle to radians for trigonometric functions
theta_a = deg2rad(A_a);

% 1. Time to hit the ground (h(t) = 0)
% 0 = v*t*sin(A) - 0.5*g*t^2 => t_flight = 2*v*sin(A) / g
t_flight = (2 * v_a * sin(theta_a)) / g;

% 2. Maximum height (occurs at t_flight / 2)
t_peak = t_flight / 2;
h_max = v_a * t_peak * sin(theta_a) - 0.5 * g * t_peak^2;

% 3. Total horizontal distance (Range)
x_range = v_a * t_flight * cos(theta_a);

% Visualization of Results (a)
fprintf('--- Projectile Kinematic Results (v=20m/s, A=25) ---\n');
fprintf('Time of Flight:   %8.4f s\n', t_flight);
fprintf('Maximum Height:   %8.4f m\n', h_max);
fprintf('Total Distance:   %8.4f m\n', x_range);

% --- Part (b): Trajectory Visualization for (a) ---
t_vec = linspace(0, t_flight, 100);
x_vals = v_a * t_vec * cos(theta_a);
h_vals = v_a * t_vec * sin(theta_a) - 0.5 * g * t_vec.^2;

figure('Color', 'w', 'Name', 'Projectile Trajectory Suite');
subplot(2, 1, 1);
plot(x_vals, h_vals, 'LineWidth', 2, 'Color', '#0072BD');
grid on;
title('Trajectory: v = 20 m/s, A = 25°', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Distance (x) [m]');
ylabel('Height (h) [m]');
ylim([0, max(h_vals) * 1.2]);

% --- Part (c): Velocity Variation Trajectories (A = 45°) ---
A_c = 45;
v_set = [20, 24, 28, 32, 36];
theta_c = deg2rad(A_c);

subplot(2, 1, 2);
hold on;
colors = lines(length(v_set));

for i = 1:length(v_set)
    v_curr = v_set(i);
    t_f = (2 * v_curr * sin(theta_c)) / g;
    t_v = linspace(0, t_f, 100);
    x_v = v_curr * t_v * cos(theta_c);
    h_v = v_curr * t_v * sin(theta_c) - 0.5 * g * t_v.^2;
    
    plot(x_v, h_v, 'LineWidth', 1.5, 'Color', colors(i, :));
end

grid on;
title('Trajectories at 45° for Varying Initial Velocities', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Distance (x) [m]');
ylabel('Height (h) [m]');
legend(arrayfun(@(v) sprintf('v = %d m/s', v), v_set, 'UniformOutput', false), 'Location', 'best');

% Professional Scholarly Footer
fprintf('\nKinematic Insight: Part (c) demonstrates that the range and maximum height scale quadratically with initial velocity for a constant launch angle.\n');
