% =========================================================================================
% FILE NAME: Q32_PolarRoseSpiral.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script visualizes a complex polar geometry combining oscillating roses 
% and spiral dynamics within a 2D polar coordinate system.
%
% PROBLEM STATEMENT (Q32):
% Create a polar plot of the following function for the range 0 <= theta <= 2*pi:
% r = 6 * cos^2(0.8 * theta) + theta
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 5, Q32.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Domain Grid Generation ---
% Defining theta range [0, 2*pi] with 1000 points for high-fidelity rendering
theta = linspace(0, 2*pi, 1000);

% --- Polar Functional Computation ---
r = 6 * cos(0.8 .* theta).^2 + theta;

% --- Visualization Engine ---
figure('Color', 'w', 'Name', 'Polar Geometric Analysis');
polarplot(theta, r, 'LineWidth', 2.5, 'Color', '#77AC30');

% Aesthetics and Layout
title('Polar Plot: r = 6cos^2(0.8\theta) + \theta', 'FontSize', 14, 'FontWeight', 'bold');
ax = gca;
ax.FontSize = 10;
ax.GridAlpha = 0.3;
ax.ThetaTickLabel = {'0', '30', '60', '90', '120', '150', '180', '210', '240', '270', '300', '330'};

% Professional Scholarly Footer
fprintf('Geometric Insight: The resulting plot exhibits a hybrid topology: the 0.8 coefficient creates modular symmetry while the linear \''+ theta\'' term induces a centrifugal spiral.\n');
