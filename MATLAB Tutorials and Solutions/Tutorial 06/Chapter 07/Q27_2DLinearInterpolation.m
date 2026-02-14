% =========================================================================================
% FILE NAME: Q27_2DLinearInterpolation.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script performs linear interpolation across a temporal-spatial temperature 
% grid. It identifies and computationally estimates missing observations in a 
% dataset representing weekly temperature fluctuations across 5 specific hours 
% and 5 working days.
%
% PROBLEM STATEMENT (Q27):
% The following table gives temperature data in Celsius as a function of time 
% of day and day of the week at a specific location. Data are missing for the 
% entries marked with a question mark (?). Use linear interpolation with 
% MATLAB to estimate the temperature at the missing points.
%
% Hour | Mon | Tues | Wed | Thurs | Fri
% -----|-----|------|-----|-------|----
% 1    | 16  | 15   | 12  | 17    | 16
% 2    | 13  | ?    | 8   | 11    | 12
% 3    | 14  | 15   | 9   | ?     | 15
% 4    | 17  | 15   | 14  | 17    | 19
% 5    | 21  | 18   | 19  | 20    | 24
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 7, Q27.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Spatiotemporal Temperature Grid Acquisition ---
% Days: 1=Mon, 2=Tue, 3=Wed, 4=Thu, 5=Fri
hours = 1:5;
days = 1:5;

% Temperature Dataset (NaN indicates missing sensors or observations)
temp_matrix = [
    16, 15, 12, 17, 16;
    13, NaN, 8, 11, 12;
    14, 15, 9, NaN, 15;
    17, 15, 14, 17, 19;
    21, 18, 19, 20, 24
];

% --- Computational Interpolation Stage ---
% We utilize 1D linear interpolation along the hourly axis (rows) for each missing point.

% Task 1: Estimate (Hour 2, Tue)
% Extracting Tue (Col 2) known sensors
h_known_tue = [1, 3, 4, 5];
t_known_tue = [15, 15, 15, 18];
est_t2_h2 = interp1(h_known_tue, t_known_tue, 2, 'linear');

% Task 2: Estimate (Hour 3, Thu)
% Extracting Thu (Col 4) known sensors
h_known_thu = [1, 2, 4, 5];
t_known_thu = [17, 11, 17, 20];
est_t4_h3 = interp1(h_known_thu, t_known_thu, 3, 'linear');

% --- Visualization Engine (Interpolated Field) ---
temp_matrix_filled = temp_matrix;
temp_matrix_filled(2, 2) = est_t2_h2;
temp_matrix_filled(3, 4) = est_t4_h3;

figure('Color', 'w', 'Name', 'Interpolated Temperature Field Analysis');
imagesc(days, hours, temp_matrix_filled);
colormap(hot); % Hot colormap for temperature visualization
colorbar;

% Metadata and Aesthetic Labeling
set(gca, 'FontName', 'Arial', 'FontSize', 10);
set(gca, 'XTick', 1:5, 'XTickLabel', {'Mon', 'Tue', 'Wed', 'Thu', 'Fri'});
set(gca, 'YTick', 1:5);
title('Computational Estimation of Spatiotemporal Temperature Data', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Observation Day', 'FontSize', 12);
ylabel('Hour of Measurement', 'FontSize', 12);
grid off; % imagesc/heatmaps usually look cleaner without grid

% Label specific interpolated points
text(2, 2, sprintf('%.1f', est_t2_h2), 'Color', 'w', 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
text(4, 3, sprintf('%.1f', est_t4_h3), 'Color', 'w', 'FontWeight', 'bold', 'HorizontalAlignment', 'center');

% --- Results Visualization ---
fprintf('--- Temperature Interpolation Results ---\n');
fprintf('Estimated Temperature (Hour 2, Tuesday): %8.2f °C\n', est_t2_h2);
fprintf('Estimated Temperature (Hour 3, Thursday):%8.2f °C\n', est_t4_h3);

% Professional Scholarly Footer
fprintf('\nEngineering Insight: Linear interpolation assuming local gradients successfully reconstructs missing spatiotemporal data; however, higher-order methods or physical constraints may be required if atmospheric dynamics exhibit non-linear turbulence.\n');
