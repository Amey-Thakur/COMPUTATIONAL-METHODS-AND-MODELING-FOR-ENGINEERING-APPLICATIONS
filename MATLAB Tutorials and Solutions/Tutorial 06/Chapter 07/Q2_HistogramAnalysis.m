% =========================================================================================
% FILE NAME: Q2_HistogramAnalysis.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script analyzes the breaking force of structural timber using absolute 
% frequency histograms. It evaluates the impact of varying bin widths on data 
% visualization and identifies an optimized interval for meaningful interpretation.
%
% PROBLEM STATEMENT (Q2):
% Thirty pieces of structural timber of the same dimensions were subjected to 
% an increasing lateral force until they broke. The measured force in pounds 
% required to break them is given in the following list. Plot the absolute 
% frequency histogram. Try bin widths of 50, 100, and 200 lb. Which gives the 
% most meaningful histogram? Try to find a better value for the bin width.
%
% Data: 
% 243, 236, 389, 628, 143, 417, 205, 404, 464, 605, 137, 123, 372, 439, 497, 
% 500, 535, 577, 441, 231, 675, 132, 196, 217, 660, 569, 865, 725, 457, 347.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 7, Q2.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Experimental Dataset Acquisition ---
breaking_force = [243, 236, 389, 628, 143, 417, 205, ...
                  404, 464, 605, 137, 123, 372, 439, ...
                  497, 500, 535, 577, 441, 231, 675, ...
                  132, 196, 217, 660, 569, 865, 725, ...
                  457, 347];

% --- Visualization Engine (Histogram Sensitivity Analysis) ---
figure('Color', 'w', 'Name', 'Timber Breaking Force Distribution Analysis');

% Comparative Analysis for Varied Bin Widths
bin_widths = [50, 100, 200, 75]; % Including optimized width (75)
titles = {'Bin Width = 50 lb', 'Bin Width = 100 lb', 'Bin Width = 200 lb', 'Optimized Bin Width = 75 lb'};

for i = 1:length(bin_widths)
    subplot(2, 2, i);
    histogram(breaking_force, 'BinWidth', bin_widths(i), 'FaceColor', [0.2 0.4 0.6], 'EdgeColor', 'k');
    grid on;
    set(gca, 'FontName', 'Arial', 'FontSize', 9);
    title(titles{i}, 'FontWeight', 'bold');
    xlabel('Breaking Force (lb)');
    ylabel('Frequency (Absolute)');
end

% --- Results Visualization ---
fprintf('--- Histogram Bin Analysis Results ---\n');
fprintf('Visual inspection suggests that a bin width of 100 lb provides a clear \n');
fprintf('overview of the distribution, while 75 lb offers a better balance between \n');
fprintf('resolution and noise reduction for this specific sample size (N=30).\n');

% Professional Scholarly Footer
fprintf('\nEngineering Insight: Proper bin width selection is critical in statistical modeling; excessive granularity (50 lb) introduces noise, while excessive smoothing (200 lb) obscures distribution peaks.\n');
