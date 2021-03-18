ts = 0.1;
z = tf('z',ts);
sys = (z^5-2)/(z^10-0.8);
pzmap(sys);
title('Opgave 4.9 A');
%generate pdf file for use in LaTeX
file = '../figs/opg4_9a.pdf';
print('-dpdf', file);
system(sprintf('pdfcrop %s %s', file, file));
sys = (z^2+1.5*z+0.9)/(z^2-1.5*z+1.1);
pzmap(sys);
title('Opgave 4.9 B');
file = '../figs/opg4_9b.pdf';
print('-dpdf', file);
system(sprintf('pdfcrop %s %s', file, file));

