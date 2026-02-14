% =========================================================================================
% FILE NAME: Q15_UniformRandomDistribution.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script generates a dataset of 1000 uniformly distributed random numbers 
% with specific boundary constraints. It verifies empirical convergence to the 
% theoretical mean and analyzes distribution uniformity via frequency histograms.
%
% PROBLEM STATEMENT (Q15):
% Use a random number generator to produce 1000 uniformly distributed numbers 
% with a mean of 10, a minimum of 2, and a maximum of 18. Obtain the mean and 
% the histogram of these numbers, and discuss whether they appear uniformly 
% distributed with the desired mean.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 7, Q15.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Simulation Parameters & Configuration ---
N = 1000;              % Iteration count (Sample Size)
lower_bound = 2;       % Minimum value (a)
upper_bound = 18;      % Maximum value (b)
target_mean = (lower_bound + upper_bound) / 2; % Theoretical E[x]

% --- Stochastic Signal Generation ---
% Formula: x = a + (b-a) * rand(N, 1)
data = lower_bound + (upper_bound - lower_bound) * rand(N, 1);

% --- Statistical Verification ---
empirical_mean = mean(data);

% --- Visualization Engine (Distribution Uniformity) ---
figure('Color', 'w', 'Name', 'Uniform Stochastic Process Analysis');
histogram(data, 20, 'FaceColor', [0.3 0.7 0.9], 'EdgeColor', 'w');
hold on;

% Theoretical Mean Indicator
xline(target_mean, 'r--', 'LineWidth', 2.5);

% Plot Aesthetics
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Stochastic Variable Value', 'FontSize', 12);
ylabel('Frequency Count', 'FontSize', 12);
title(sprintf('Frequency Analysis: %d Samples in Uniform Field [%d, %d]', N, lower_bound, upper_bound), ...
      'FontSize', 14, 'FontWeight', 'bold');
legend('Sample Distribution', 'Theoretical Mean (10)', 'Location', 'northeast');

% --- Results Visualization ---
fprintf('--- Uniform Distribution Verification ---\n');
fprintf('Lower Bound (a):          %8.2f\n', lower_bound);
fprintf('Upper Bound (b):          %8.2f\n', upper_bound);
fprintf('Theoretical Mean:         %8.4f\n', target_mean);
fprintf('Empirical Sample Mean:    %8.4f\n', empirical_mean);
fprintf('Statistical Deviation:    %8.4f (%.2f%%)\n', ...
        abs(empirical_mean - target_mean), (abs(empirical_mean - target_mean)/target_mean)*100);

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The uniformity and mean convergence observe the Law of Large Numbers; for N=1000, stochastic noise is sufficiently averaged to reflect the underlying distribution integrity.\n');
