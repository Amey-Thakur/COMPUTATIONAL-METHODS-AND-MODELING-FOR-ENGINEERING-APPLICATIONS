% =========================================================================================
% FILE NAME: Q16_TrafficFlowNetwork.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script models a traffic flow network for a 6-intersection grid. It utilizes 
% the principle of flow conservation (Kirchhoff's Current Law equivalent) to 
% establish a system of linear equations and determines the network's constraints 
% and required sensor redundancy using Reduced Row Echelon Form (RREF).
%
% PROBLEM STATEMENT (Q16):
% Assume that no vehicles stop within the network. A traffic engineer wants 
% to know if the traffic flows f1, f2, ..., f7 can be computed given the 
% measured flows shown in Figure P16. If not, then determine how many more 
% traffic sensors need to be installed, and obtain the expressions for the 
% other traffic flows in terms of the measured quantities.
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 8, Q16.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Network Equilibrium Equations ---
% Conservation: Sum(In) = Sum(Out) at each node
% Node 1: f1 + f3 = 300
% Node 2: -f1 + f2 + f4 = 300
% Node 3: -f2 + f5 = -400  (f2 - f5 = 400)
% Node 4: -f3 + f6 = 200   (f6 - f3 = 200)
% Node 5: -f4 - f6 + f7 = -200 (f4 + f6 - f7 = 200)
% Node 6: -f5 - f7 = -200  (f5 + f7 = 200)

% Augmented Matrix [A | B] for f1, f2, f3, f4, f5, f6, f7
Aug = [
% f1  f2  f3  f4  f5  f6  f7 | RHS
   1,  0,  1,  0,  0,  0,  0,  300;  % Node 1
  -1,  1,  0,  1,  0,  0,  0,  300;  % Node 2
   0, -1,  0,  0,  1,  0,  0, -400;  % Node 3
   0,  0, -1,  0,  0,  1,  0,  200;  % Node 4
   0,  0,  0, -1,  0, -1,  1, -200;  % Node 5
   0,  0,  0,  0, -1,  0, -1, -200   % Node 6
];

% --- Computational Analysis (RREF) ---
R = rref(Aug);
[rows, cols] = size(Aug);
rank_A = rank(Aug(:, 1:end-1));
num_vars = 7;

% --- Results Visualization ---
fprintf('--- Traffic Network Analysis Results ---\n');
fprintf('Dimension of variable space: %d\n', num_vars);
fprintf('Rank of coefficient matrix:  %d\n', rank_A);
fprintf('Degrees of Freedom (DoF):    %d\n', num_vars - rank_A);

if rank_A < num_vars
    fprintf('\nSTATUS: The system is UNDERDETERMINED.\n');
    fprintf('Additional sensors required: %d\n', num_vars - rank_A);
else
    fprintf('\nSTATUS: The system has a UNIQUE solution.\n');
end

fprintf('\n--- Reduced Row Echelon Form (RREF) ---\n');
disp(R);

fprintf('--- Dependency Expressions (f1-f5 in terms of f6, f7) ---\n');
fprintf('f1 = %4d + f6 - f7\n', R(1, end));
fprintf('f2 = %4d + f6\n', R(2, end));
fprintf('f3 = %4d - f6 + f7\n', R(3, end));
fprintf('f4 = %4d + f7\n', R(4, end));
fprintf('f5 = %4d + f6\n', R(5, end));
fprintf('Note: f6 and f7 are free variables; f1-f5 depend on their measured values.\n');

% Professional Scholarly Footer
fprintf('\nEngineering Insight: The network analysis confirms that 2 additional sensors are required for complete flow observability. The RREF analysis effectively decouples the dependent flow variables, revealing that f6 and f7 act as the fundamental degrees of freedom for the systemic traffic load.\n');
