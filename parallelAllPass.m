clc
clear
close all

a = [1, -0.4954];
b = [-0.4954, 1];

b_bits = 5;
s = 1;

w_a = b_bits + 1;
f_a = b_bits - 1;
a_quantized = fi(a, s, w_a, f_a);

w_b = b_bits + 1;
f_b = b_bits - 1;
b_quantized = fi(b, s, w_b, f_b);

disp('Quantized Denominator Coefficients (a):');
disp(a_quantized);

disp('Quantized Numerator Coefficients (b):');
disp(b_quantized);