clc
clear
close all

%Part (c)

N = 5; % substitute a value between 1 and 45
wname = ['db', int2str(N)];
[h0, h1, f0, f1]= wfilters(wname);

e00 = h0(1:2:end);
e01 = h0(2:2:end);
e10 = h1(1:2:end);
e11 = h1(2:2:end);

E = {e00, e01; e10, e11};

E_n = cellfun(@transpose, E, 'UniformOutput', false);

%we reverse the orders of entries

%polynomial multiplication is convolution of the coefficient vectors

E_nE = {conv(E_n{1, 2}, E{1,2}), conv(E_n{1, 1}, E{1,1}); conv(E_n{2, 2}, E{2,2}), conv(E_n{2, 1}, E{2,1})};

% is proportional to the identity matrix

[gd_h0, ~] = grpdelay(h0);
[gd_h1, ~] = grpdelay(h1);

[gd_f0, ~] = grpdelay(f0);
[gd_f1, ~] = grpdelay(f1);

D_anl = max([gd_h0; gd_h1]);
D_synth = max([gd_f0; gd_f1]);
D_tot = D_anl + D_synth;

% D_tot is the end to end delay

w = linspace(0, pi, 1e4);

H0_mag = abs(freqz(h0, 1, w));
H1_mag = abs(freqz(h1, 1, w));

figure;
plot(w, H0_mag);
title('Magnitude Responses |H_0(\omega)| & |H_1(\omega)|');
xlabel('Frequency (\omega)');
ylabel('|H(\omega)|');
hold on;
plot(w, H1_mag);
grid on;
legend('|H_0(\omega)|', '|H_1(\omega)|');
hold off;




