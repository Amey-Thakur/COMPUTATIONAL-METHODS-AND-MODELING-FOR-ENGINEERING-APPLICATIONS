% =========================================================================================
% FILE NAME: Q32_SpringMassDamper.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script models a second-order dynamical system representing a spring-mass-damper 
% assembly. It investigates the transient response of the system to a step forcing 
% function f(t)=10 under two distinct initial velocity conditions.
%
% PROBLEM STATEMENT (Q32):
% The following equation describes the motion of a mass connected to a spring:
% 3y'' + 18y' + 102y = f(t)
% where f(t) = 0 for t < 0 and f(t) = 10 for t >= 0.
% a. Plot y(t) for t from 0 to 2s, given y(0) = 0 and y'(0) = 0.
% b. Plot y(t) for t from 0 to 2s, given y(0) = 0 and y'(0) = 10.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 9, Q32.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- ODE System Modeling ---
% 3y'' + 18y' + 102y = 10
% Standard Form: y'' + 6y' + 34y = 10/3
% State variables: x1 = y, x2 = y'
% dx1/dt = x2
% dx2/dt = (10 - 18*x2 - 102*x1) / 3

spring_ode = @(t, x) [x(2); (10 - 18 * x(2) - 102 * x(1)) / 3];

% --- Computational Solution Stage (Integration) ---
t_span = [0, 2];

% Condition A: Zero initial energy
[tA, xA] = ode45(spring_ode, t_span, [0; 0]);

% Condition B: High initial kinetic energy
[tB, xB] = ode45(spring_ode, t_span, [0; 10]);

% --- Visualization Engine (Dynamic Response) ---
figure('Color', 'w', 'Name', 'Mechanical System Transient Analysis');
subplot(2, 1, 1);
plot(tA, xA(:, 1), 'b-', 'LineWidth', 2);
grid on;
title('System Response: y(0)=0, y''(0)=0 (Resting Start)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Displacement y(t)', 'FontSize', 10);

subplot(2, 1, 2);
plot(tB, xB(:, 1), 'r-', 'LineWidth', 2);
grid on;
title('System Response: y(0)=0, y''(0)=10 (Kinetic Start)', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Displacement y(t)', 'FontSize', 10);

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The oscillatory behavior indicates an underdamped system (zeta < 1). Part a shows a standard step-response overshoot, while Part b demonstrates how significantly higher initial momentum induces extreme initial displacement before the damping components stabilize the mass toward its steady-state equilibrium.\n');
