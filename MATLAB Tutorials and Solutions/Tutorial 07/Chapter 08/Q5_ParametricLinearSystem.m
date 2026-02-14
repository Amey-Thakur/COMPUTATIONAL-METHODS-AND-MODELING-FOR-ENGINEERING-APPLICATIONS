% =========================================================================================
% FILE NAME: Q5_ParametricLinearSystem.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script solves a system of three linear equations parameterized by 'c'. 
% It computes the vector solution [x; y; z] across a continuous range of 'c' values 
% and visualizes the linear proportionality of the variables.
%
% PROBLEM STATEMENT (Q5):
% a. Use MATLAB to solve the following equations for x, y, and z as functions 
%    of the parameter c:
%    x - 5y - 2z = 11c
%    6x + 3y + z = 13c
%    7x + 3y - 5z = 10c
% b. Plot the solutions for x, y, and z versus c on the same plot, for -10 <= c <= 10.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 8, Q5.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Linear System Modeling ---
% Equation Matrix Form: A * [x; y; z] = B * c
A = [ 1, -5, -2;
      6,  3,  1;
      7,  3, -5];

% Right-hand side coefficients for c
B_basis = [11; 13; 10];

% --- Computational Iteration ---
c_range = -10:0.1:10;
sol_matrix = zeros(length(c_range), 3);

for i = 1:length(c_range)
    c = c_range(i);
    % Solve A * X = B_basis * c
    X = A \ (B_basis * c);
    sol_matrix(i, :) = X';
end

% Extract individual solution vectors
x_sol = sol_matrix(:, 1);
y_sol = sol_matrix(:, 2);
z_sol = sol_matrix(:, 3);

% --- Visualization Engine (Parametric Tracking) ---
figure('Color', 'w', 'Name', 'Parametric Linear Solution Analysis');
plot(c_range, x_sol, 'r-', 'LineWidth', 2); hold on;
plot(c_range, y_sol, 'g--', 'LineWidth', 2);
plot(c_range, z_sol, 'b-.', 'LineWidth', 2);

% Aesthetics and Scholarly Labeling
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Parameter Value (c)', 'FontSize', 12);
ylabel('Solution Variables (x, y, z)', 'FontSize', 12);
title('Solution Trajectories for Parametric Linear System', 'FontSize', 14, 'FontWeight', 'bold');
legend('x(c)', 'y(c)', 'z(c)', 'Location', 'northeast');

% --- Results Visualization ---
fprintf('--- Solution Relationship for c = 1 ---\n');
sol_c1 = A \ B_basis;
fprintf('x = %.4fc\n', sol_c1(1));
fprintf('y = %.4fc\n', sol_c1(2));
fprintf('z = %.4fc\n', sol_c1(3));

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The solutions exhibit linear scaling with respect to the parameter c, confirming the homogeneity of the system. The matrix left-division (A\\B) provides the state-transition mapping from the parameter space to the variable space.\n');
