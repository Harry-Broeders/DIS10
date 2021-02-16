Omega = 0:pi/100:pi;
H = (2 - 1/2*exp(-1i*Omega)) ./ (1 + 3/4*exp(-1i*Omega));

figure(1);
plot(Omega, abs(H));
title('Versterking')
axis([0 pi 0 max(abs(H))*1.05]);
xlabel('\Omega (radialen/sample)');
set(gca, 'XTick', [0:pi/4:pi]);
set(gca, 'XTickLabel', {'0';'1/4\pi';'1/2\pi';'3/4\pi';'\pi'});
ylabel('|H(\Omega)|');
grid on;
grid minor;

figure(2);
plot(Omega, angle(H));
title('Fasedraaiing')
axis([0 pi 0 max(angle(H))*1.05]);
xlabel('\Omega (radialen/sample)');
ylabel('arg(H(\Omega)) (rad)');
set(gca, 'XTick', [0:pi/4:pi]);
set(gca, 'XTickLabel', {'0';'1/4\pi';'1/2\pi';'3/4\pi';'\pi'});
grid on;
grid minor;
