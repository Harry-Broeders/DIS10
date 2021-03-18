ts=0.1;
syms z 
Hz = (z^3-z^2+0.8*z-0.8)/(z^3+0.8*z^2);
[teller, noemer] = numden(Hz);
b = sym2poly(teller)
a = sym2poly(noemer)
sys = tf(b, a, ts)
pzmap(sys)
title('Opgave 4.12');
%generate pdf file for use in LaTeX
file = '../figs/opg4_12a.pdf';
print('-dpdf', file);
system(sprintf('pdfcrop %s %s', file, file));
figure
n = 1001; % voldoende punten veel een mooie plot
[h w] = freqz(b, a, n);
%indien gewenst omrekenen naar dB
%plot(w/pi,20*log10(abs(h)))
plot(w/pi,abs(h))
ax = gca;
ax.YLim = [0 20];
ax.XTick = 0:.25:1;
xlabel('\Omega (\times\pi)')
%ylabel('|H(z)| (dB)')
ylabel('|H(\Omega)|')
title('Opgave 4.12');
%generate pdf file for use in LaTeX
file = '../figs/opg4_12b.pdf';
print('-dpdf', file);
system(sprintf('pdfcrop %s %s', file, file));
z=1; fprintf('|H(0)| = %f\n', abs(subs(Hz)));
z=j; fprintf('|H(1/2\x03C0)| = %f\n', abs(subs(Hz)));
z=-1; fprintf('|H(\x03C0)| = %f\n', abs(subs(Hz)));

