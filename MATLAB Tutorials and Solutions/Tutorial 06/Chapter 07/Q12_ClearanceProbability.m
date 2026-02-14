% =========================================================================================
% FILE NAME: Q12_ClearanceProbability.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script conducts a statistical reliability analysis for mechanical assembly 
% clearance. It calculates interference probabilities for a shaft and bearing 
% system by modeling component diameter variances as normal distributions.
%
% PROBLEM STATEMENT (Q12):
% A certain product requires that a shaft be inserted into a bearing. 
% Measurements show that the diameter d1 of the cylindrical hole in the bearing 
% is normally distributed with a mean of 4 cm and a variance of 0.0064. 
% The diameter d2 of the shaft is normally distributed with a mean of 3.96 cm 
% and a variance of 0.0036.
% a. Compute the mean and the variance of the clearance c = d1 - d2.
% b. Find the probability that a given shaft will not fit into the bearing. 
%    (Hint: Find the probability that the clearance is negative.)
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 7, Q12.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Component Geometric Parameters ---
% Bearing (d1) ~ N(mu1, var1)
mu1 = 4.00;
var1 = 0.0064;

% Shaft (d2) ~ N(mu2, var2)
mu2 = 3.96;
var2 = 0.0036;

% --- clearance Distribution Modeling ---
% Final Clearance (c) = d1 - d2
% Mean: mu_c = mu1 - mu2
% Variance: var_c = var1 + var2 (Assumes independence)
mu_c = mu1 - mu2;
var_c = var1 + var2;
std_c = sqrt(var_c);

% --- Reliability & Probability Analysis ---
% Find P(c < 0) for interference detection
prob_failure = normcdf(0, mu_c, std_c);

% --- Results Visualization ---
fprintf('--- Statistical Tolerance Summary ---\n');
fprintf('Clearance Mean (mu_c):     %8.4f cm\n', mu_c);
fprintf('Clearance Variance (var_c): %8.4f cm^2\n', var_c);
fprintf('Clearance Std Dev (sigma):  %8.4f cm\n', std_c);

fprintf('\n--- Assembly Interference Analysis ---\n');
fprintf('Probability of Non-Fit (Interference): %.4f (%.2f%%)\n', prob_failure, prob_failure * 100);
fprintf('Design Reliability (Successful Fit):   %.4f (%.2f%%)\n', 1 - prob_failure, (1 - prob_failure) * 100);

% Professional Scholarly Footer
fprintf('\nEngineering Insight: A ~34.46%% interference rate indicates that the current tolerances (variance) are too high relative to the mean clearance, necessitating a tighter manufacturing quality control or a revision of the nominal dimensions.\n');
