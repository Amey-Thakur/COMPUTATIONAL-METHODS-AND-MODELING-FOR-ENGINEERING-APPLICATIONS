% =========================================================================================
% FILE NAME: Q19_SquaredNormalSimulation.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script investigates the non-linear transformation of normally distributed 
% random variables. It simulates the mapping y = x^2 across varying trial counts 
% and evaluates the convergence of empirical moments (mean, variance) against 
% theoretical projections.
%
% PROBLEM STATEMENT (Q19):
% Suppose that y = x^2, where x is a normally distributed random variable with 
% a mean and variance of mu_x = 0 and sigma_x^2 = 5. Find the mean and variance 
% of y by simulation. Does mu_y = mu_x^2? Does sigma_y^2 = sigma_x^4? 
% Do this for 100, 1000, and 5000 trials.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 7, Q19.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Source Model Parameters (x ~ N(mu, var)) ---
mu_x = 0;
var_x = 5;
std_x = sqrt(var_x);
trials = [100, 1000, 5000];

% Theoretical Expected Outcomes:
% E[y] = E[x^2] = var(x) + (E[x])^2 = 5 + 0 = 5
% Var[y] = 2 * sigma^4 = 2 * (5^2) = 50
theoretical_mu_y = 5;
theoretical_var_y = 50;

% --- Results Visualization ---
fprintf('--- Squared Normal Variable Simulation Analysis ---\n');
fprintf('Source Distribution: x ~ N(0, 5)\n');
fprintf('Mapping Function:    y = x^2\n\n');

for N = trials
    % --- Stochastic Simulation Stage ---
    % Generate normally distributed x vectors
    x = mu_x + std_x * randn(N, 1);
    
    % Apply non-linear transformation
    y = x.^2;
    
    % Extract empirical moments
    mu_y_emp = mean(y);
    var_y_emp = var(y);
    
    % Performance Reporting
    fprintf('Trial Size: %d\n', N);
    fprintf('  Empirical Mean:     %8.4f (Target: 5.00) | Error: %.2f%%\n', ...
            mu_y_emp, abs(mu_y_emp - theoretical_mu_y)/theoretical_mu_y * 100);
    fprintf('  Empirical Variance: %8.4f (Target: 50.0) | Error: %.2f%%\n', ...
            var_y_emp, abs(var_y_emp - theoretical_var_y)/theoretical_var_y * 100);
    
    % Structural Inquiry Verification
    fprintf('  Verification: mu_y = mu_x^2? %s\n', ...
            mat2str(abs(mu_y_emp - mu_x^2) < 0.1)); % Checks against 0 (Incorrect expectation)
    fprintf('  Verification: var_y = var_x^2? %s\n\n', ...
            mat2str(abs(var_y_emp - var_x^2) < 5)); % Checks against 25 (Incorrect expectation)
end

% Professional Scholarly Footer
fprintf('\nEngineering Insight: This simulation disproves the naive assumption that statistical moments propagate linearly through quadratic mappings. Transforming a normal variable into its square generates a Chi-squared distribution (scaled), where the mean is equal to the variance of the source.\n');
