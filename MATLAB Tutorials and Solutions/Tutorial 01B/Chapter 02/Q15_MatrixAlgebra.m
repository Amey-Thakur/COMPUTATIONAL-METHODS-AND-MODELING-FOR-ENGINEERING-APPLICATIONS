% =========================================================================================
% FILE NAME: Q15_MatrixAlgebra.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script verifies the fundamental laws of matrix algebra—specifically the 
% commutative and associative laws of addition—using structured 2x2 matrices.
%
% PROBLEM STATEMENT (Q15):
% Given the matrices A = [-7 11; 4 9], B = [4 -5; 12 -2], and C = [-3 -9; 7 8], 
% use MATLAB to:
% a. Find A + B + C.
% b. Find A - B + C.
% c. Verify the associative law: (A + B) + C = A + (B + C)
% d. Verify the commutative law: A + B + C = B + C + A = A + C + B
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 2, Q15.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;

% --- Matrix Initialization ---
A = [-7, 11; 
      4,  9];
      
B = [ 4, -5; 
     12, -2];
     
C = [-3, -9; 
      7,  8];

% --- Algebraic Verification Engine ---

% a. Addition: A + B + C
Sum_ABC = A + B + C;

% b. Mixed Operations: A - B + C
Mixed_ABC = A - B + C;

% c. Verification of Associative Law: (A + B) + C = A + (B + C)
LHS_associative = (A + B) + C;
RHS_associative = A + (B + C);
is_associative = isequal(LHS_associative, RHS_associative);

% d. Verification of Commutative Law: A + B + C = B + C + A = A + C + B
S1 = A + B + C;
S2 = B + C + A;
S3 = A + C + B;
is_commutative = isequal(S1, S2, S3);

% --- Results Visualization ---
fprintf('--- Matrix Algebraic Analysis ---\n');
fprintf('a. Result of A + B + C:\n'); disp(Sum_ABC);
fprintf('b. Result of A - B + C:\n'); disp(Mixed_ABC);

% Conditional status reporting
assoc_str = 'FAILED';
if is_associative
    assoc_str = 'VERIFIED';
end
comm_str = 'FAILED';
if is_commutative
    comm_str = 'VERIFIED';
end

fprintf('c. Associative Law Proof Status: %s\n', assoc_str);
fprintf('d. Commutative Law Proof Status: %s\n', comm_str);

% Professional Scholarly Footer
fprintf('\nAlgebraic Insight: Matrix addition is both associative and commutative because it boils down to element-wise scalar addition, which inherits these properties.\n');
