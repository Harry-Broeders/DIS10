N = 8;
n = [0:1:N-1]';
x_n = 5 + sin(n*pi/2) + cos(n*pi/4)
a_k = fft(x_n)/N

figure(1);
set(gcf, 'Position', [0 0 700 400])
stem(n, real(a_k), 'filled', 'black');
hold on;
axis([-0.5 7.5 -0.5 5.5]);
grid on;
xlabel('k');
set(gcf,'color','white');
set(gca,'color','white');
set(gcf,'InvertHardCopy','off');
legend('Re\{a_k\}', 'Location','Northeast');
set(gca,'FontSize',14);

figure(2);
set(gcf, 'Position', [0 0 700 400])
stem(n, imag(a_k), 'filled', 'black');
hold on;
axis([-0.5 7.5 -1 1]);
grid on;
xlabel('k');
set(gcf,'color','white');
set(gca,'color','white');
set(gcf,'InvertHardCopy','off');
legend('Im\{a_k\}', 'Location','Northeast');
set(gca,'FontSize',14);

