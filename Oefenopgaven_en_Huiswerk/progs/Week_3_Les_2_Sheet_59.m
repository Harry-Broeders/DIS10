fs = 1000
f = 0:fs/4000:fs/2;
H = 1 ./ (1 - 1.5*exp(-1i*2*pi*f/fs) + 0.85*exp(-2i*2*pi*f/fs));

figure(1);
plot(f, abs(H));
title('Versterking')
xlabel('f (Hz)');
ylabel('|H(f)|');
grid on;
grid minor;

figure(2);
plot(f, angle(H));
title('Fasedraaiing')
xlabel('f (Hz)');
ylabel('arg(H(f)) (rad)');
grid on;
grid minor;
