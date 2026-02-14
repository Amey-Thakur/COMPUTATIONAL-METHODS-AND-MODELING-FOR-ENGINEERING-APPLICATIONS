% =========================================================================================
% FILE NAME: Q10_ApproximationComparison.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script investigates the accuracy of a local analytical approximation for 
% a linear differential equation with a transcendental forcing function (tan t). 
% It compares numerical integration against a provided series-like approximation.
%
% PROBLEM STATEMENT (Q10):
% The following equation has no simple analytical solution:
% dx/dt + x = tan(t), x(0) = 0
% The approximate solution is:
% x(t) = (1/3)t^3 - t^2 + 3t - 3 + 3*exp(-t)
% Compare the numerical solution with the approximation for small values of t.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 10, Q10.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Mathematical Modeling ---
% Exact ODE: dx/dt = tan(t) - x
exact_ode = @(t, x) tan(t) - x;

% Approximate Solution Function
approx_sol = @(t) (1/3)*t.^3 - t.^2 + 3*t - 3 + 3*exp(-t);

% --- Computational Solution Stage (Numerical Integration) ---
% Note: tan(t) has singularities at pi/2 (approx 1.57). 
% We evaluate on [0, 1.4] to maintain bounded behavior.
t_span = [0, 1.4];
[t_num, x_num] = ode45(exact_ode, t_span, 0);

% Evaluate approximation on the same grid
x_approx = approx_sol(t_num);

% --- Visualization Engine (Error Analysis) ---
figure('Color', 'w', 'Name', 'Approximation Fidelity Analysis');

% Subplot 1: Trajectory Comparison
subplot(2, 1, 1);
plot(t_num, x_num, 'b-', 'LineWidth', 2); hold on;
plot(t_num, x_approx, 'r--', 'LineWidth', 1.5);
grid on;
title('State Trajectory: Numerical vs. Approximate', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Variable x(t)', 'FontSize', 10);
legend('Exact (Numerical)', 'Poly Approximation', 'Location', 'northwest');

% Subplot 2: Local Error Magnitude
subplot(2, 1, 2);
plot(t_num, abs(x_num - x_approx), 'k-', 'LineWidth', 1.5);
grid on;
title('Absolute Approximation Error', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('|Error|', 'FontSize', 10);

% --- Results Visualization ---
fprintf('--- Approximation Accuracy Audit ---\n');
fprintf('Time (s) | Numerical x | Approx x | Absolute Error\n');
fprintf('---------------------------------------------------\n');
eval_pts = [0.2, 0.5, 1.0];
for tp = eval_pts
    x_n = interp1(t_num, x_num, tp);
    x_a = approx_sol(tp);
    fprintf('%8.2f | %11.4f | %8.4f | %12.4e\n', tp, x_n, x_a, abs(x_n - x_a));
end

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The polynomial approximation holds high fidelity for small values of t (t < 0.5) but begins to diverge significantly as t approaches the singularity of the tangent function. This demonstrates that Taylor-series approximations are inherently local and must be validated against precise numerical schemas for broader domains.\n');
