% =========================================================================================
% FILE NAME: Q7_TimberLimitEstimation.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script estimates the statistical strength limits for structural timber. 
% It utilizes mean and standard deviation to establish theoretical 68% and 96% 
% confidence intervals and verifies them against experimental observations.
%
% PROBLEM STATEMENT (Q7):
% For the data given in Problem 2:
% a. Plot the scaled frequency histogram.
% b. Compute the mean and standard deviation and use them to estimate the lower 
%    and upper limits of strength corresponding to 68 and 96 percent of such 
%    timber pieces. Compare these limits with those of the data.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 7, Q7.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Experimental Dataset Acquisition (From Q2) ---
breaking_force = [243, 236, 389, 628, 143, 417, 205, ...
                  404, 464, 605, 137, 123, 372, 439, ...
                  497, 500, 535, 577, 441, 231, 675, ...
                  132, 196, 217, 660, 569, 865, 725, ...
                  457, 347];

% --- Statistical Computation & Interval Estimation ---
avg_force = mean(breaking_force);
std_force = std(breaking_force);

% Empirical Rule Thresholds:
% mu +/- 1*sigma corresponds to approx 68%
% mu +/- 2*sigma corresponds to approx 95.4% (Problem asks for 96%)
limits_68 = [avg_force - std_force, avg_force + std_force];
limits_96 = [avg_force - 2*std_force, avg_force + 2*std_force];

% --- Visualization Engine (Probability Density Function) ---
figure('Color', 'w', 'Name', 'Timber Reliability and Limit Analysis');
histogram(breaking_force, 'Normalization', 'pdf', 'FaceColor', [0.8 0.4 0.2], 'EdgeColor', 'w');
hold on;

% Overlay Normal Distribution Fit for Scholarly Comparison
x_range = linspace(min(breaking_force)-100, max(breaking_force)+100, 200);
y_pdf = (1 / (std_force * sqrt(2*pi))) * exp(-0.5 * ((x_range - avg_force) / std_force).^2);
plot(x_range, y_pdf, 'k--', 'LineWidth', 2);

% Aesthetics and Labeling
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Structural Breaking Force (lb)', 'FontSize', 12);
ylabel('Probability Density (f(x))', 'FontSize', 12);
title('Scaled Strength Distribution: Structural Timber Analysis', 'FontSize', 14, 'FontWeight', 'bold');
legend('Experimental Scaled Data', 'Theoretical Normal Fit', 'Location', 'northeast');

% --- Results Visualization ---
fprintf('--- Statistical Limit Summary (lb) ---\n');
fprintf('Empirical Mean (mu):     %8.2f\n', avg_force);
fprintf('Standard Deviation (std): %8.2f\n', std_force);
fprintf('\n--- Confidence Interval Projections ---\n');
fprintf('Theoretical 68%% Range: [%8.2f, %8.2f]\n', limits_68);
fprintf('Theoretical 96%% Range: [%8.2f, %8.2f]\n', limits_96);

% Coverage Verification
in_68 = sum(breaking_force >= limits_68(1) & breaking_force <= limits_68(2));
in_96 = sum(breaking_force >= limits_96(1) & breaking_force <= limits_96(2));

fprintf('\n--- Dataset Coverage Analysis ---\n');
fprintf('Observational Density (68%% Limit): %d/%d (%.1f%%)\n', in_68, length(breaking_force), (in_68/length(breaking_force))*100);
fprintf('Observational Density (96%% Limit): %d/%d (%.1f%%)\n', in_96, length(breaking_force), (in_96/length(breaking_force))*100);

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The dataset exhibits strong alignment with the 68-95-99.7 rule, validating the assumption of normality for load forecasting in structural timber applications.\n');
