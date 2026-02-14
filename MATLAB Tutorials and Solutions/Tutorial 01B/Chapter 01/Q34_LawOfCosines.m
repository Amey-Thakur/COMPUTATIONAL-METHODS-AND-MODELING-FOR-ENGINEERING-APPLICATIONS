% =========================================================================================
% FILE NAME: Q34_LawOfCosines.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script implements a geometric solver based on the Law of Cosines to calculate 
% side lengths in a quadrilateral composed of two adjacent triangles.
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 1, Q34.
%
% MATHEMATICAL MODEL:
% Law of Cosines: a^2 = b^2 + c^2 - 2*b*c*cos(A)
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;

% --- Input Dataset (Figure P34) ---
% Side lengths (meters)
b1 = 200;
b2 = 180;
c1 = 120;

% Internal Angles (Degrees)
A1 = 120;
A2 = 100;

% --- Computational Analysis ---

% 1. Compute common side 'a' using the top triangle properties
% Degrees to Radians conversion is required for MATLAB's cosD function or manual cos(A*pi/180)
a_squared = b1^2 + c1^2 - 2 * b1 * c1 * cosd(A1);
a = sqrt(a_squared);

% 2. Compute side 'c2' using the bottom triangle properties (given sides a, b2 and angle A2)
% a^2 = b2^2 + c2^2 - 2*b2*c2*cos(A2)
% Rearranged as a quadratic equation in terms of c2:
% c2^2 - (2*b2*cos(A2))*c2 + (b2^2 - a^2) = 0

coeff_quadratic = [1, -2 * b2 * cosd(A2), (b2^2 - a^2)];
roots_c2 = roots(coeff_quadratic);

% Select the positive physical root
c2 = roots_c2(roots_c2 > 0);

% --- Results Visualization ---
fprintf('--- Geometric Quadrilateral Analysis ---\n');
fprintf('Common Internal Side (a): %8.4f m\n', a);
fprintf('Target External Side (c2): %8.4f m\n', c2);

% Professional Scholarly Footer
fprintf('\nStructural Insight: The quadratic solution for side c2 represents the geometric constraint of the triangular closure. Negative roots are non-physical and discarded.\n');
