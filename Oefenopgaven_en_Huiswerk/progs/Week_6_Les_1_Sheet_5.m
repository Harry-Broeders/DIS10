Fs = 8000;
b = [0.0378, 0, -0.0378];
a = [1, 0, 0.9244];
sys = tf(b, a, 1 / Fs);
figure
% plot polen en nulpunten van IIR-filter:
pzmap(sys)
title('Polen en nulpunten van het IIR-filter')
% plot spectrum van IIR-filter:
figure
freqz(b, a, 0 : Fs / 2, Fs);
ax = gca;
ax.YLim = [-50 0];
title('Overdracht van het IIR-filter')
