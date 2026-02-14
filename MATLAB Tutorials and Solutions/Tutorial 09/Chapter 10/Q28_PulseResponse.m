% =========================================================================================
% FILE NAME: Q28_PulseResponse.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script models the transient response of a first-order transfer function 
% to a unit-width pulse input. It demonstrates the superposition of two step 
% responses to form a pulse excitation.
%
% PROBLEM STATEMENT (Q28):
% Create a Simulink model to plot the solution of the following equation for 0 <= t <= 1:
% Y(s)/F(s) = 4 / (s + 5)
% where f(t) = u_s(t) - u_s(t-1) (Unit pulse of duration 1s).
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 10, Q28.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% - Toolbox: Control System Toolbox
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- System Definition ---
% H(s) = 4 / (s + 5)
sys = tf([4], [1, 5]);

% --- Computational Solution Stage (Pulse Response) ---
t_span = 0:0.01:2; % Analyzing slightly beyond t=1 to see decay

% f(t) = u_s(t) - u_s(t-1)
f_input = (t_span >= 0) - (t_span >= 1);

% Compute response using lsim (for custom input profiles)
[y_pulse, t_out] = lsim(sys, f_input, t_span);

% --- Visualization Engine (Dynamic Lag Analysis) ---
figure('Color', 'w', 'Name', 'First-Order Pulse Response');

% Subplot 1: Input Pulse
subplot(2, 1, 1);
plot(t_out, f_input, 'k-', 'LineWidth', 2);
grid on;
ylim([-0.1, 1.2]);
title('Input Forcing: Unit Pulse f(t) = u_s(t) - u_s(t-1)', 'FontSize', 12);
ylabel('Force Amplitude', 'FontSize', 10);

% Subplot 2: Output Response
subplot(2, 1, 2);
plot(t_out, y_pulse, 'b-', 'LineWidth', 2);
grid on;
title('System Response: Y(s)/F(s) = 4/(s+5)', 'FontSize', 12);
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Amplitude y(t)', 'FontSize', 10);

% --- Simulink Architectural Description (Logic Diagram) ---
% 1. Source 1: Step (Time=0, Amp=1)
% 2. Source 2: Step (Time=1, Amp=1)
% 3. Summing Junction (Forcing): [Step 1] (+) [Step 2] (-) -> Creates Pulse
% 4. Transfer Fcn Block: [4] / [1 5]
% 5. Scope: View output y(t)

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The first-order system exhibits exponential charging behavior while the pulse is active. Once the pulse terminates at t=1, the system begins a free-response exponential decay back toward zero, representing the discharge of energy stored during the active forcing phase.\n');
