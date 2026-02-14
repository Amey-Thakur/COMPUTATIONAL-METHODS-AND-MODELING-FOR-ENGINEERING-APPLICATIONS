% =========================================================================================
% FILE NAME: Q9_PaintDryingAnalysis.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script performs a rigorous polynomial regression audit (Degrees 1-4) on 
% paint drying time datasets, evaluating goodness-of-fit through statistical 
% metrics and identifying the optimal additive concentration for drying speed.
%
% PROBLEM STATEMENT (Q9):
% The following data give the drying time T of a certain paint as a function of 
% the amount of a certain additive A.
% a. Find the first-, second-, third-, and fourth-degree polynomials that fit 
%    the data, and plot each polynomial with the data. Determine the quality 
%    of the curve fit for each by computing J, S, and r^2.
% b. Use the polynomial giving the best fit to estimate the amount of additive 
%    that minimizes the drying time.
%
% Additive A (oz): [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
% Time T (min):   [130, 115, 110, 90, 89, 89, 95, 100, 110, 125]
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 6, Q9.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Experimental Dataset Acquisition ---
A = 0:9;
T = [130, 115, 110, 90, 89, 89, 95, 100, 110, 125];
n = length(T);

% --- Statistical Analysis Loop (Degrees 1-4) ---
degrees = 1:4;
colors = lines(length(degrees));
A_smooth = linspace(0, 9, 200);

figure('Color', 'w', 'Name', 'Drying Time Polynomial Fit Suite');
plot(A, T, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 7, 'DisplayName', 'Experimental Data');
hold on;

stats_table = zeros(length(degrees), 3); % Columns: J, S, r2

for d = degrees
    % Fit polynomial
    p = polyfit(A, T, d);
    T_fit_data = polyval(p, A);
    T_fit_smooth = polyval(p, A_smooth);
    
    % Residual calculation
    residuals = T - T_fit_data;
    J = sum(residuals.^2); % Sum of squared residuals
    S = sqrt(J / (n - (d + 1))); % Fit error (standard error)
    
    % R-squared calculation
    SSR = sum((T_fit_data - mean(T)).^2);
    SST = sum((T - mean(T)).^2);
    r2 = SSR / SST;
    
    % Store stats
    stats_table(d, :) = [J, S, r2];
    
    % Visualization
    plot(A_smooth, T_fit_smooth, 'LineWidth', 1.5, 'Color', colors(d, :), ...
        'DisplayName', sprintf('Degree %d (r^2=%.3f)', d, r2));
end

% Aesthetics and Labeling
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Additive Concentration (A) [oz]', 'FontSize', 12);
ylabel('Drying Time (T) [minutes]', 'FontSize', 12);
title('Polynomial Regression Audit: Paint Drying Optimization', 'FontSize', 14, 'FontWeight', 'bold');
legend('Location', 'northeast');

% --- Best Fit Optimization (Degree 4 usually highest r^2) ---
[~, best_degree] = max(stats_table(:, 3));
p_best = polyfit(A, T, 4); % We use degree 4 for the final optimization

% Find minimum of the degree-4 polynomial in the range [0, 9]
% We use fminbnd for localized optimization
[opt_A, opt_T] = fminbnd(@(x) polyval(p_best, x), 0, 9);

% --- Results Visualization ---
fprintf('--- Statistical Performance Audit ---\n');
fprintf('Degree |    J (SSE)    |    S (RMSE)   |    r^2 (COD)  \n');
fprintf('-------------------------------------------------------\n');
for d = degrees
    fprintf('   %d   |   %10.2f  |   %10.4f  |   %10.4f\n', d, stats_table(d,1), stats_table(d,2), stats_table(d,3));
end

fprintf('\n--- Paint Formulation Optimization ---\n');
fprintf('Optimal Fit selected: Degree %d\n', best_degree);
fprintf('Amount of additive that minimizes drying time: %8.4f oz\n', opt_A);
fprintf('Minimum estimated drying time:                 %8.4f min\n', opt_T);

% Professional Scholarly Footer
fprintf('\nStatistical Insight: Higher-degree polynomials reduce residual variance (J) but may introduce overfitting. The 4th degree polynomial provides the best numerical fit for identifying the global optimum additive concentration.\n');
