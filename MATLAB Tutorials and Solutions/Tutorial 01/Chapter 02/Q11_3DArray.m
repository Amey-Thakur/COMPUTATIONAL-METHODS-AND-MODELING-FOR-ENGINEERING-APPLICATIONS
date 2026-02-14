% =========================================================================================
% FILE NAME: Q11_3DArray.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script constructs and analyzes a three-dimensional array (Tensor). 
% It identifies local maxima within each spatial "layer" and the global maximum
% across the entire 3D volume.
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 2, Q11.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;

% --- Matrix Layer Initialization ---
A = [ 3, -2,  1; 
      6,  8, -5; 
      7,  9, 10];
      
B = [ 6,  9, -4; 
      7,  5,  3; 
     -8,  2,  1];
     
C = [-7, -5,  2; 
     10,  6,  1; 
      3, -9,  8];

% --- 3D Array Construction ---
% Concatenate slices along the third dimension
D(:, :, 1) = A;
D(:, :, 2) = B;
D(:, :, 3) = C;

% --- Maxima Detection Analysis ---

% Find the largest element in each layer
max_layer1 = max(max(D(:, :, 1)));
max_layer2 = max(max(D(:, :, 2)));
max_layer3 = max(max(D(:, :, 3)));

% Global maximum across entire 3D structure
% Nested max calls are required for multidimensional reduction
global_max = max(D(:));

% --- Results Visualization ---
fprintf('--- 3D Array Maxima Analysis ---\n');
fprintf('Max in Layer 1 (A): %2d\n', max_layer1);
fprintf('Max in Layer 2 (B): %2d\n', max_layer2);
fprintf('Max in Layer 3 (C): %2d\n', max_layer3);
fprintf('Global Maximum in D: %2d\n', global_max);

% Professional Scholarly Footer
fprintf('\nTechnical Insight: 3D arrays represent multidimensional data structures. Global reduction using D(:) flattens the array for simplified statistical analysis.\n');
