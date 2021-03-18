ts=0.1;
syms z 
Hz = (z+1)/(z-0.8);
[teller, noemer] = numden(Hz);
b = sym2poly(teller);
a = sym2poly(noemer);
figure
n = 1001; % voldoende punten veel een mooie plot
[h w] = freqz(b, a, n);
%indien gewenst omrekenen naar dB
%plot(w/pi,20*log10(abs(h)))
plot(w/pi,abs(h))
ax = gca;
ax.YLim = [0 10];
ax.XTick = 0:.25:1;
xlabel('\Omega (\times\pi)')
%ylabel('|H(z)| (dB)')
ylabel('|H(\Omega)|')
title('Opgave 4.14 amplitude');
%generate pdf file for use in LaTeX
file = '../figs/opg4_14c.pdf';
print('-dpdf', file);
system(sprintf('pdfcrop %s %s', file, file));
figure
plot(w/pi,angle(h))
ax = gca;
ax.YLim = [-pi pi];
ax.XTick = 0:.25:1;
xlabel('\Omega (\times\pi)')
%ylabel('|H(z)| (dB)')
ylabel('\Phi_H(\Omega)')
title('Opgave 4.14 fase');
%generate pdf file for use in LaTeX
file = '../figs/opg4_14d.pdf';
print('-dpdf', file);
system(sprintf('pdfcrop %s %s', file, file));
z=1; 
fprintf('|H(0)| = %f\n', abs(subs(Hz)));
fprintf('Phi_H(0) = %f\n', angle(subs(Hz)));
z=j; 
fprintf('|H(1/2\x03C0)| = %f\n', abs(subs(Hz)));
fprintf('Phi_H(1/2\x03C0) = %f\n', angle(subs(Hz)));
z=-1; 
fprintf('|H(\x03C0)| = %f\n', abs(subs(Hz)));
fprintf('Phi_H(\x03C0) = %f\n', angle(subs(Hz)));

