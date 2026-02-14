% =========================================================================================
% FILE NAME: Q37_HelicalVisualization.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script generates 3D visualizations of circular helices, demonstrating the 
% effects of pitch and handiness through parametric variation of the 'tightness' 
% constant b.
%
% PROBLEM STATEMENT (Q37):
% The popular amusement ride known as the corkscrew has a helical shape. The 
% parametric equations for a circular helix are:
% x = a * cos(t)
% y = a * sin(t)
% z = b * t
% where a is the radius and b is a constant that determines the "tightness" of 
% the path. If b > 0, the helix is a right-handed screw; if b < 0, it is left-handed.
% Obtain the three-dimensional plot of the helix for the following three cases 
% and compare their appearance: Use 0 <= t <= 10*pi and a = 1.
% a. b = 0.1
% b. b = 0.2
% c. b = -0.1
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 5, Q37.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Configuration Parameters ---
a = 1; % Radius
t = linspace(0, 10*pi, 1000); % Parametric domain (5 full revolutions)
b_cases = [0.1, 0.2, -0.1];

% --- Visualization Engine ---
figure('Color', 'w', 'Name', '3D Helical Motion Analysis');

for i = 1:length(b_cases)
    b = b_cases(i);
    
    % Parametric Computation
    x = a .* cos(t);
    y = a .* sin(t);
    z = b .* t;
    
    % Subplot Generation
    subplot(1, 3, i);
    plot3(x, y, z, 'LineWidth', 2, 'Color', '#0072BD');
    
    % Aesthetics and Layout
    grid on;
    axis equal;
    set(gca, 'FontName', 'Arial', 'FontSize', 9);
    xlabel('X-Axis'); ylabel('Y-Axis'); zlabel('Z-Axis');
    
    % Characterizing Handiness and Tightness
    if b > 0
        handiness = 'Right-Handed';
    else
        handiness = 'Left-Handed';
    end
    title(sprintf('b = %.1f\n(%s)', b, handiness), 'FontSize', 10, 'FontWeight', 'bold');
    
    % Setting consistent views
    view(45, 30);
end

% Professional Scholarly Footer
fprintf('Geometrical Insight: Increasing |b| from 0.1 to 0.2 effectively doubles the pitch (vertical displacement per revolution), while the sign of b dictates the chiral orientation of the path.\n');
