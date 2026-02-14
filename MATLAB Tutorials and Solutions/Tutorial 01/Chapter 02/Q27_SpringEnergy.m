% =========================================================================================
% FILE NAME: Q27_SpringEnergy.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script analyzes Hooke''s Law and Elastic Potential Energy for multiple springs.
% It calculates displacement (x) and stored energy (U = 0.5 * k * x^2) from 
% empirical force and spring constant data.
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 2, Q27.
%
% PHYSICS MODELS:
% 1. Force Relationship: F = k * x  => x = F / k
% 2. Potential Energy:   U = 0.5 * k * x^2
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;

% --- Dataset Acquisition ---
% Dataset for five springs
% Force (N)
F = [11, 7, 8, 10, 9]; 

% Spring constants (N/m) - (Table specifies N/111 but logic suggests N/m unit standard)
k = [1000, 600, 900, 1300, 700];

% --- Computational Analysis ---

% a. Find the compression (x) in each spring
% x = F ./ k (Vectorized division)
compression = F ./ k;

% b. Find the potential energy stored in each spring
% U = 0.5 .* k .* compression.^2 (Vectorized squared operation)
potential_energy = 0.5 .* k .* compression.^2;

% --- Results Visualization ---
fprintf('--- Spring Elasticity & Energy Analysis ---\n');
fprintf('Spring | Constant (N/m) | Compression (m) | Energy (J)\n');
fprintf('-----------------------------------------------------\n');
for i = 1:length(F)
    fprintf('   %d   |      %4d      |     %8.5f    |  %8.5f\n', i, k(i), compression(i), potential_energy(i));
end
fprintf('-----------------------------------------------------\n');

% Professional Scholarly Footer
fprintf('\nScientific Insight: The displacement is linearly proportional to load, while stored energy increases quadratically with displacement.\n');
