% =========================================================================================
% FILE NAME: Q29_CubicSplineAnalysis.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script investigates the thermal dynamics of water flow using advanced 
% interpolation techniques. It compares linear vs. cubic spline approximations 
% for both forward estimation (T at specific t) and inverse estimation (t for 
% specific T), providing a high-fidelity model of faucet temperature response.
%
% PROBLEM STATEMENT (Q29):
% The following data are the measured temperature T (F) of water flowing from 
% a hot water faucet after it is turned on at time t = 0.
% t (sec): 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
% T (F): 72.5, 78.1, 86.4, 92.3, 110.6, 111.5, 109.3, 110.2, 110.5, 109.9, 110.2
%
% a. Plot the data, connecting them first with straight lines and then with a 
%    cubic spline.
% b. Estimate the temperature values at the following times, using linear 
%    interpolation and then cubic spline interpolation: t = 0.6, 2.5, 4.7, 8.9.
% c. Use both the linear and cubic spline interpolations to estimate the time 
%    it will take for the temperature to equal the following values: 
%    T = 75, 85, 90, 105.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 7, Q29.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Experimental Temperature Dataset ---
t = 0:10; % Time in seconds
T = [72.5, 78.1, 86.4, 92.3, 110.6, 111.5, 109.3, 110.2, 110.5, 109.9, 110.2];

% --- Forward Interpolation (T at specific t) ---
t_query = [0.6, 2.5, 4.7, 8.9];

% Linear Forward
T_linear = interp1(t, T, t_query, 'linear');

% Cubic Spline Forward
T_spline = interp1(t, T, t_query, 'spline');

% --- Inverse Interpolation (t for specific T) ---
T_inverse_query = [75, 85, 90, 105];

% Note: Given the non-monotonic nature after t=5, we interp1 on the monotonic region [0, 5]
t_monotonic = t(1:5);
T_monotonic = T(1:5);

% Linear Inverse
t_est_linear = interp1(T_monotonic, t_monotonic, T_inverse_query, 'linear');

% Cubic Spline Inverse
% For higher precision inverse, we interpolate a fine grid and find roots
t_fine = linspace(0, 5, 1000);
T_fine_spline = interp1(t_monotonic, T_monotonic, t_fine, 'spline');
t_est_spline = zeros(size(T_inverse_query));

for i = 1:length(T_inverse_query)
    [~, idx] = min(abs(T_fine_spline - T_inverse_query(i)));
    t_est_spline(i) = t_fine(idx);
end

% --- Visualization Engine (Interpolation Comparison) ---
figure('Color', 'w', 'Name', 'Water Temperature Thermal Response Analysis');
t_fine_all = linspace(0, 10, 500);
T_fine_linear = interp1(t, T, t_fine_all, 'linear');
T_fine_spline_all = interp1(t, T, t_fine_all, 'spline');

plot(t, T, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8); hold on;
plot(t_fine_all, T_fine_linear, 'b--', 'LineWidth', 1.2);
plot(t_fine_all, T_fine_spline_all, 'r-', 'LineWidth', 1.5);

% Aesthetics and Labeling
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Time Elapsed (seconds)', 'FontSize', 12);
ylabel('Water Temperature (°F)', 'FontSize', 12);
title('Faucet Thermal response: Linear vs. Cubic Spline Comparison', 'FontSize', 14, 'FontWeight', 'bold');
legend('Experimental Sensors', 'Linear (Straight Lines)', 'Cubic Spline (Smooth)', ...
       'Location', 'southeast');

% --- Results Visualization ---
fprintf('--- Part (b): Forward Interpolation Results ---\n');
fprintf('Time (s) | Linear T (°F) | Spline T (°F)\n');
fprintf('---------|--------------|--------------\n');
for i = 1:length(t_query)
    fprintf('%8.1f | %12.2f | %12.2f\n', t_query(i), T_linear(i), T_spline(i));
end

fprintf('\n--- Part (c): Inverse Interpolation Results (Time to Target T) ---\n');
fprintf('Target T (°F) | Linear Time (s) | Spline Time (s)\n');
fprintf('--------------|-----------------|----------------\n');
for i = 1:length(T_inverse_query)
    fprintf('%13.1f | %15.4f | %15.4f\n', T_inverse_query(i), t_est_linear(i), t_est_spline(i));
end

% Professional Scholarly Footer
fprintf('\nEngineering Insight: Cubic spline interpolation provides a high-fidelity, continuous model of thermal gradients; however, linear interpolation offers a conservative approximation that avoids the unintended overshoots (spline oscillations) seen in the post-stabilization phase of the faucet response.\n');
