% =========================================================================================
% FILE NAME: Q12_CableTensionOptimization.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script analyzes the statics of a dual-cable suspension system. It computes 
% cable tensions (TAB, TAC) across a range of lengths (LAC) and identifies the 
% minimum length required to satisfy a maximum tension constraint of 2000 lb.
%
% PROBLEM STATEMENT (Q12):
% A weight W is supported by two cables anchored a distance D apart. 
% Principles of horizontal and vertical force equilibrium give:
% -TAB*cos(theta) + TAC*cos(phi) = 0
% TAB*sin(theta) + TAC*sin(phi) = W
%
% Given: D = 6 ft, LAB = 3 ft, W = 2000 lb.
% Use MATLAB to find LAC_min, the shortest length LAC without TAB or TAC 
% exceeding 2000 lb. Plot tensions vs LAC for LAC_min <= LAC <= 6.7 ft.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 8, Q12.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Design Parameters & Constants ---
D = 6;              % Anchor distance (ft)
LAB = 3;            % Cable AB length (ft)
W = 2000;           % Weight (lb)
max_tension = 2000; % Constraint (lb)

% --- Computational Search for LAC_min ---
lac_range = linspace(3.1, 6.7, 500); % Iterative search space
tab_vals = zeros(size(lac_range));
tac_vals = zeros(size(lac_range));

for i = 1:length(lac_range)
    LAC = lac_range(i);
    
    % Geometric Law of Cosines/Sines for angles
    theta = acos((D^2 + LAB^2 - LAC^2) / (2 * D * LAB));
    phi = asin(LAB * sin(theta) / LAC);
    
    % Equilibrium Matrix: [cos -cos; sin sin] * [TAB; TAC] = [0; W]
    % Wait, the equations in the prompt were:
    % -TAB*cos(theta) + TAC*cos(phi) = 0
    % TAB*sin(theta) + TAC*sin(phi) = W
    
    A_eq = [-cos(theta),  cos(phi);
             sin(theta),  sin(phi)];
    B_eq = [0; W];
    
    % Numerical solution
    tensions = A_eq \ B_eq;
    tab_vals(i) = tensions(1);
    tac_vals(i) = tensions(2);
end

% Identify LAC_min where both tensions are <= 2000
valid_indices = find(tab_vals <= max_tension & tac_vals <= max_tension);
if ~isempty(valid_indices)
    lac_min = lac_range(valid_indices(1));
    tab_plot = tab_vals(valid_indices);
    tac_plot = tac_vals(valid_indices);
    lac_plot = lac_range(valid_indices);
else
    error('Safety constraint cannot be met across the given LAC range.');
end

% --- Visualization Engine (Structural Integrity Analysis) ---
figure('Color', 'w', 'Name', 'Cable Suspension Statics Analysis');
plot(lac_plot, tab_plot, 'b-', 'LineWidth', 2); hold on;
plot(lac_plot, tac_plot, 'r--', 'LineWidth', 2);

% Safety Limit Reference
yline(max_tension, 'k:', 'Safety Limit: 2000 lb', 'LineWidth', 1.5, 'LabelVerticalAlignment', 'bottom');

% Aesthetics and Labeling
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Cable BC Length, LAC (ft)', 'FontSize', 12);
ylabel('Cable Tension (lb)', 'FontSize', 12);
title('Static Tension Analysis vs. Cable Length Optimization', 'FontSize', 14, 'FontWeight', 'bold');
legend('Tension AB (TAB)', 'Tension AC (TAC)', 'Location', 'northeast');

% --- Results Visualization ---
fprintf('--- Computational Design Results ---\n');
fprintf('Minimum Required Length LAC: %.4f ft\n', lac_min);
fprintf('TAB at LAC_min: %8.2f lb\n', tab_plot(1));
fprintf('TAC at LAC_min: %8.2f lb\n', tac_plot(1));

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The optimization reveals a non-linear inverse relationship between cable length and internal stresses. Selecting LAC < LAC_min violates the factor of safety, while excessive length (toward 6.7 ft) increases the vertical vector components and reduces overall efficiency.\n');
