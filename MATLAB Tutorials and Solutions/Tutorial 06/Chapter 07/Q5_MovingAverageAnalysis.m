% =========================================================================================
% FILE NAME: Q5_MovingAverageAnalysis.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script evaluates the mathematical precision and filtering effects of moving 
% averages on a sinusoidal signal. It investigates signal smoothing, phase lag, 
% and amplitude degradation across varied window sizes.
%
% PROBLEM STATEMENT (Q5):
% Create some data by evaluating the function x = sin(0.5t) for integer values 
% of t over the range 0, 10. Then, by plotting the data and the moving means, 
% investigate the accuracy of the moving average using (a) three points and 
% (b) five points.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 7, Q5.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Sinusoidal Signal Generation ---
t = 0:10;                   % Discrete-time integer sequence
x = sin(0.5 * t);           % Target function: x = sin(0.5t)

% --- Moving Mean Signal Processing ---
% a) Three-point moving average investigation
mm3 = movmean(x, 3);

% b) Five-point moving average investigation
mm5 = movmean(x, 5);

% --- Visualization Engine (Signal Tracking Analysis) ---
figure('Color', 'w', 'Name', 'Moving Average Smoothing Investigation');
plot(t, x, 'ko-', 'LineWidth', 2, 'MarkerFaceColor', 'k', 'MarkerSize', 8); 
hold on;
plot(t, mm3, 'b^--', 'LineWidth', 1.5);
plot(t, mm5, 'rs-', 'LineWidth', 1.5);

% Aesthetics and Scholarly Labeling
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Time Index (t)', 'FontSize', 12);
ylabel('Signal Amplitude (x)', 'FontSize', 12);
title('Accuracy Analysis: Moving Mean Filtering of sin(0.5t)', 'FontSize', 14, 'FontWeight', 'bold');
legend('Experimental Signal', '3-Point Moving Mean', '5-Point Moving Mean', ...
       'Location', 'southwest', 'FontSize', 9);
axis([0 10 -1.2 1.2]);

% --- Results Visualization ---
fprintf('--- Moving Average Accuracy Analysis ---\n');
fprintf('Source Signal: sin(0.5t) over t ∈ [0, 10]\n');
fprintf('  Max Amplitude (Original): %.4f\n', max(x));
fprintf('  Max Amplitude (3-Point):  %.4f\n', max(mm3));
fprintf('  Max Amplitude (5-Point):  %.4f\n', max(mm5));

% Professional Scholarly Footer
fprintf('\nEngineering Insight: Moving averages function as low-pass filters; while they effectively reduce noise, they introduce unintended signal distortion including attenuation of peaks and temporal phase shifts (lag).\n');
