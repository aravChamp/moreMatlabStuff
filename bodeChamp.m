clc
clear
close all

% Define the symbolic variable 's'
s = tf('s');

% Define the transfer function H(s) symbolically
H = (s + 1) / (s^2 + 2*s + 1);

% Frequency range
omega = logspace(-2, 2, 1000);

% Evaluate the transfer function at different frequencies
H_eval = freqresp(H, omega);

% Extract magnitude and phase
magnitude = abs(squeeze(H_eval));
phase = angle(squeeze(H_eval));

% Plot Bode plots
figure;

subplot(2, 1, 1);
semilogx(omega, 20*log10(magnitude));
grid on;
title('Bode Plot - Magnitude (dB)');
ylabel('Magnitude (dB)');

subplot(2, 1, 2);
semilogx(omega, rad2deg(phase));
grid on;
title('Bode Plot - Phase (degrees)');
xlabel('Frequency (rad/s)');
ylabel('Phase (degrees)');