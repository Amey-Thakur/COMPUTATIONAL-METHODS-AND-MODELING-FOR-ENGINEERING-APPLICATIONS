% =========================================================================================
% FILE NAME: Q45_ResponseSuperposition.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script investigates the principle of superposition for a second-order 
% linear differential equation. It demonstrates that the total system response 
% is the exact sum of the zero-input (free) response and the zero-state (step) response.
%
% PROBLEM STATEMENT (Q45):
% Consider 5y'' + 2y' + 10y = f(t).
% a. Plot the free response for y(0) = 10, y'(0) = -5.
% b. Plot the unit-step response (for zero initial conditions).
% c. Demonstrate that the total response is the sum of the free and step responses
%    with y(0) = 10, y'(0) = -5.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 9, Q45.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% - Toolbox: Control System Toolbox
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- System Model Definition ---
% 5y'' + 2y' + 10y = f(t)
% Transfer Function: H(s) = 1 / (5s^2 + 2s + 10)
num = [1];
den = [5, 2, 10];
sys = tf(num, den);

% Time span for analysis
t = 0:0.1:20;

% --- Task A: Free Response (Zero Input) ---
% Using initial conditions: y(0)=10, y'(0)=-5
% Note: initial() requires state-space
[A, B, C, D] = tf2ss(num, den);
ss_sys = ss(A, B, C, D);
x0 = [10; -5]; % Wait, tf2ss state definitions might vary. 
% For [5 2 10], steady state is x1=y. 
% Standard state space: 5y'' + 2y' + 10y = f
% x1 = y, x2 = y'
% dx1 = x2, dx2 = (-2x2 - 10x1 + f)/5
A_std = [0, 1; -10/5, -2/5];
B_std = [0; 1/5];
C_std = [1, 0];
D_std = 0;
sys_std = ss(A_std, B_std, C_std, D_std);

y_free = initial(sys_std, [10; -5], t);

% --- Task B: Unit-Step Response (Zero State) ---
y_step = step(sys_std, t);

% --- Task C: Total Response Synthesis & Verification ---
% Total = Free + Step
y_sum = y_free + y_step;

% Solve total response directly with lsim or ode45
y_total_direct = lsim(sys_std, ones(size(t)), t, [10; -5]);

% --- Visualization Engine (Superposition Analysis) ---
figure('Color', 'w', 'Name', 'Linear System Superposition Verification');

subplot(3, 1, 1);
plot(t, y_free, 'b-', 'LineWidth', 1.5);
grid on;
title('a) Free Response (Zero-Input): y(0)=10, y''(0)=-5', 'FontSize', 11);
ylabel('y_{free}(t)');

subplot(3, 1, 2);
plot(t, y_step, 'g-', 'LineWidth', 1.5);
grid on;
title('b) Unit-Step Response (Zero-State)', 'FontSize', 11);
ylabel('y_{step}(t)');

subplot(3, 1, 3);
plot(t, y_sum, 'r-', 'LineWidth', 2.5); hold on;
plot(t, y_total_direct, 'k--', 'LineWidth', 1);
grid on;
title('c) Total Response Verification: [Free + Step] vs. [Direct Solution]', 'FontSize', 11);
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('y_{total}(t)');
legend('Summed Response', 'Directly Computed', 'Location', 'best');

% --- Results Visualization ---
error_norm = norm(y_sum - y_total_direct);
fprintf('--- Superposition Principle Verification ---\n');
fprintf('L2 Norm of Difference: %.4e\n', error_norm);
if error_norm < 1e-10
    fprintf('STATUS: VERIFIED. Linear Superposition Principle holds.\n');
end

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The perfect alignment between the summed components and the direct solution validates the linearity of the underlying differential operator. This principle allows engineers to decouple complex transient analyses into simpler, independent sub-problems.\n');
