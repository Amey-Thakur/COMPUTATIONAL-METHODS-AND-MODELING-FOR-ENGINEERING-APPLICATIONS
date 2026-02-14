% =========================================================================================
% FILE NAME: Q22_PathDistance.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script computes the distance of closest approach between a ship traveling on a 
% straight-line course and a lighthouse located at the origin (0,0).
% The course is defined by the linear equation y = (200 - 5x) / 6.
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 2, Q22.
%
% MATHEMATICAL MODEL:
% 1. Distance squared: D^2 = x^2 + y^2
% 2. Substitution:    D^2 = x^2 + [ (200 - 5x) / 6 ]^2
% 3. Optimization:    Find x that minimizes D (or D^2) within x \in [-20, 40].
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;

% --- Domain Definition ---
% Defined ship interval for x
x_domain = linspace(-20, 40, 1000);

% --- Computational Analysis ---

% a. Define the course path y(x)
y_path = (200 - 5 * x_domain) / 6;

% b. Calculate the distance (D) from origin (0,0) to each point (x, y)
% D = sqrt( x^2 + y^2 )
distance = sqrt( x_domain.^2 + y_path.^2 );

% c. Find the minimum distance and the corresponding location
[min_distance, min_index] = min(distance);
closest_x = x_domain(min_index);
closest_y = y_path(min_index);

% --- Results Visualization ---
fprintf('--- Ship-to-Lighthouse Proximity Analysis ---\n');
fprintf('Closest Approach Distance: %8.4f km\n', min_distance);
fprintf('Coordinate of Closest Approach: (x = %8.4f, y = %8.4f)\n', closest_x, closest_y);

% Professional Scholarly Footer
fprintf('\nNavigational Insight: The closest approach is geometrically defined by the perpendicular projection of the origin onto the linear course path.\n');
