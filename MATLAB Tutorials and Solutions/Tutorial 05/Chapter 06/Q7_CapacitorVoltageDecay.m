% =========================================================================================
% FILE NAME: Q7_CapacitorVoltageDecay.m
% AUTHOR: [Amey Thakur](https://github.com/Amey-Thakur)
% COURSE REPO: https://github.com/Amey-Thakur/COMPUTATIONAL-METHODS-AND-MODELING-FOR-ENGINEERING-APPLICATIONS
% RELEASE DATE: September 08, 2023
% LICENSE: Creative Commons Attribution 4.0 International (CC BY 4.0)
%
% DESCRIPTION:
% This script models the exponential discharge of a capacitor in an RC circuit 
% using linear regression on transformed time-series voltage data.
%
% PROBLEM STATEMENT (Q7):
% A certain electric circuit has a resistor and a capacitor. The capacitor is 
% initially charged to 100 V. When the power supply is detached, the capacitor 
% voltage decays with time, as the following data table shows. Find a 
% functional description of the capacitor voltage v as a function of time t. 
% Plot the function and the data on the same plot.
%
% Time (s):    [0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4]
% Voltage (V): [100, 62, 38, 21, 13, 7, 4, 2, 3]
%
% Reference: MATLAB for Engineering Applications, William J. Palm, Chapter 6, Q7.
%
% TECHNOLOGY STACK:
% - Programming Language: MATLAB (R2023a+)
% =========================================================================================

% --- Environment Initialization ---
clc;
clear;
close all;

% --- Experimental Dataset Acquisition ---
time = [0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4];
voltage = [100, 62, 38, 21, 13, 7, 4, 2, 3]; 

% Note: The last data point (4s, 3V) deviates from the strictly decreasing trend (3.5s, 2V), 
% but the prompt requires using the dataset as provided.

% --- Exponential Decay Modeling ---
% Model: v(t) = V0 * exp(-t/tau)
% Linearization: ln(v) = ln(V0) - (1/tau) * t
% We use polyfit on the log-transformed voltage
log_v = log(voltage);
coeffs = polyfit(time, log_v, 1);

m = coeffs(1); % Slope = -1/tau
b = exp(coeffs(2)); % Intercept = V0

% --- Validation and Visualization ---
time_smooth = linspace(0, 4, 200);
voltage_fit = b * exp(m * time_smooth);

figure('Color', 'w', 'Name', 'RC Circuit Discharge Analysis');
plot(time, voltage, 'ks', 'MarkerFaceColor', 'k', 'MarkerSize', 6);
hold on;
plot(time_smooth, voltage_fit, 'r-', 'LineWidth', 2);

% Aesthetics and Labeling
grid on;
set(gca, 'FontName', 'Arial', 'FontSize', 10);
xlabel('Time (t) [seconds]', 'FontSize', 12);
ylabel('Capacitor Voltage (v) [Volts]', 'FontSize', 12);
title('Capacitor Transient Voltage Decay Modeling', 'FontSize', 14, 'FontWeight', 'bold');
legend('Measured Data', sprintf('Functional Model: v(t) = %.1f e^{%.4f t}', b, m), 'Location', 'northeast');

% --- Results Visualization ---
fprintf('--- RC Functional Description ---\n');
fprintf('Calculated V0 (Amplitude): %8.2f V\n', b);
fprintf('Calculated m (Decay Rate): %8.4f s^-1\n', m);
fprintf('Time Constant (tau):       %8.4f s\n', -1/m);

% Professional Scholarly Footer
fprintf('\nCircuit Insight: The decay rate is inversely proportional to the RC time constant, characterizing the system response speed during discharge.\n');
