% =========================================================================================
% FILE NAME: Q11_MatrixPlotting.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script demonstrates the visualization of experimental matrix data, plotting 
% multiple force-time relationships from a structured dataset.
%
% PROBLEM STATEMENT (Q11):
% Plot columns 2 and 3 of the following matrix A versus column 1. The data in 
% column 1 are time (seconds). The data in columns 2 and 3 are force (newtons).
% A = [ 0 -7  6; 
%       5 -4  3; 
%      10 -1  9; 
%      15  1  0; 
%      20  2 -1]
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 5, Q11.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Dataset Acquisition ---
A = [ 0, -7,  6; 
      5, -4,  3; 
     10, -1,  9; 
     15,  1,  0; 
     20,  2, -1];

% Extract individual components
time = A(:, 1);
force1 = A(:, 2);
force2 = A(:, 3);

% --- Visualization Engine ---
figure('Color', 'w', 'Name', 'Force-Time Data Analysis');

% Plotting both force columns against time
plot(time, force1, '-ok', 'LineWidth', 1.5, 'MarkerFaceColor', 'k'); % Black with circles
hold on;
plot(time, force2, '--sr', 'LineWidth', 1.5, 'MarkerFaceColor', 'r'); % Red dashed with squares

% Aesthetics and Grid Configuration
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Time (t) [seconds]', 'FontSize', 12);
ylabel('Force (F) [Newtons]', 'FontSize', 12);
title('Experimental Force-Time Series Analysis', 'FontSize', 14, 'FontWeight', 'bold');

% Legend and Scaling
legend('Sensor Group 1 (Column 2)', 'Sensor Group 2 (Column 3)', 'Location', 'best');
ylim([-10, 10]); % Setting limits for symmetrical comparison

% Professional Scholarly Footer
fprintf('Data Insight: The plot reveals distinct linear trends in Sensor Group 1 and nonlinear fluctuations in Sensor Group 2 over the 20-second interval.\n');
