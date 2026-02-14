% =========================================================================================
% FILE NAME: Q6_BearingLifeEstimation.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script performs exponential regression to model the relationship between 
% machine bearing life and operating temperature, enabling predictive maintenance 
% through lifestyle estimation.
%
% PROBLEM STATEMENT (Q6):
% The useful life of a machine bearing depends on its operating temperature, 
% as the following data show. Obtain a functional description of these data. 
% Plot the function and the data on the same plot. Estimate a bearing's life 
% if it operates at 150°F.
%
% Temperature (°F):   [100, 120, 140, 160, 180, 200, 220]
% Bearing life (h*10^3): [28,  21,  15,  11,  8,   6,   4]
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 6, Q6.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Experimental Dataset Acquisition ---
temp = [100, 120, 140, 160, 180, 200, 220]; % Temperature in °F
life = [28, 21, 15, 11, 8, 6, 4];           % Life in hours x 10^3

% --- Exponential Regression Modeling ---
% Functional model: Life = b * exp(m * temp)
% Linearization: ln(Life) = ln(b) + m * temp
log_life = log(life);
coeffs = polyfit(temp, log_life, 1);

m = coeffs(1);
b = exp(coeffs(2));

% --- Predictive Analysis ---
target_temp = 150;
estimated_life = b * exp(m * target_temp);

% --- Visualization Engine ---
temp_smooth = linspace(min(temp), max(temp), 200);
life_fit = b * exp(m * temp_smooth);

figure('Color', 'w', 'Name', 'Bearing Life Reliability Analysis');
plot(temp, life, 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 6);
hold on;
plot(temp_smooth, life_fit, 'r-', 'LineWidth', 2);

% Aesthetics and Labeling
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Operating Temperature (°F)', 'FontSize', 12);
ylabel('Bearing Life (Hours \times 10^3)', 'FontSize', 12);
title('Exponential Reliability Model for Machine Bearings', 'FontSize', 14, 'FontWeight', 'bold');
legend('Experimental Data', sprintf('Regression Model: y = %.2f e^{%.4f x}', b, m), 'Location', 'northeast');

% --- Results Visualization ---
fprintf('--- Exponential Model Parameters ---\n');
fprintf('Calculated b (Amplitude): %8.4f\n', b);
fprintf('Calculated m (Rate):      %8.4f\n', m);
fprintf('\n--- Prediction Results ---\n');
fprintf('Estimated bearing life at 150°F: %8.2f (hours x 10^3)\n', estimated_life);

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The exponential decay model effectively captures the accelerated wear characteristics common in high-temperature bearing operation.\n');
