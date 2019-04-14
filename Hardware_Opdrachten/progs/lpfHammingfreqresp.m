n = [-10:10];
b = 0.25 * sinc(0.25 * n);
w = 0.54 + 0.46 * cos(pi/10 * n);
[H,f] = freqz(b, 1, 512, 8000);
[Hw,f] = freqz(b.*w, 1, 512, 8000);
HdB = 20 * log10(abs(H));
HwdB = 20 * log10(abs(Hw));
hold on;
plot(f, HdB, 'Color', 'Blue');
plot(f, HwdB, 'Color', [204/255 0 51/255]);
grid;
ylabel('Magnitude (dB)');
ylim([-80 5]);
xlabel('Frequency (Hz)');
legend('Rectangular window applied', 'Hamming window applied')
%generate pdf file for use in LaTeX
file = '../figs/lpfHammingfreqresp';
print(gcf,'-dpdf', file);
system(sprintf('pdfcrop %s.pdf %s.pdf', file, file));
