b = 0.25 * sinc(0.25 * [-10:10]);
[H,f] = freqz(b, 1, 512, 8000);
HdB = 20 * log10(abs(H));
plot(f, HdB, 'Color', [204/255 0 51/255]);
grid;
ylabel('Magnitude (dB)');
ylim([-45 5]);
xlabel('Frequency (Hz)');
%generate pdf file for use in LaTeX
file = '../figs/lpfvbfreqresp';
print(gcf,'-dpdf', file);
system(sprintf('pdfcrop %s.pdf %s.pdf', file, file));