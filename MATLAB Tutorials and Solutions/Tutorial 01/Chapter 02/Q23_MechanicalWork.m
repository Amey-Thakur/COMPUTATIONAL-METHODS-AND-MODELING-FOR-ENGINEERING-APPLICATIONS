% =========================================================================================
% FILE NAME: Q23_MechanicalWork.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script computes the mechanical work performed over a piecewise path.
% It utilizes the fundamental relationship W = F * d for discrete path segments
% with varying friction properties and calculates the cumulative work.
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 2, Q23.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;

% --- Dataset Acquisition ---
% Vectors representing discrete Path Segments 1 through 5
force_vec = [400, 550, 700, 500, 600]; % Force (N)
dist_vec  = [3, 0.5, 0.75, 1.5, 5];    % Distance (m)

% --- Computational Work Analysis ---

% a. Work done on each segment (element-wise multiplication)
work_segments = force_vec .* dist_vec; % W_i = F_i * d_i

% b. Total work performed over the entire path (summation)
work_total = sum(work_segments);

% --- Results Visualization ---
fprintf('--- Mechanical Work Segment Analysis ---\n');
fprintf('Segment | Force (N) | Distance (m) | Work (J)\n');
fprintf('--------------------------------------------\n');
for i = 1:length(work_segments)
    fprintf('   %d    |   %5.1f   |    %5.2f     |  %7.1f\n', i, force_vec(i), dist_vec(i), work_segments(i));
end
fprintf('--------------------------------------------\n');
fprintf('TOTAL WORK PERFORMED: %8.1f Joules\n', work_total);

% Professional Scholarly Footer
fprintf('\nPhysics Insight: Total mechanical work is the scalar sum of the energy expended during each discrete displacement phase.\n');
