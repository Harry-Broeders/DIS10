n = -4:8;
u = 0 * n;
u(n>=0) = 1;
% stem(n, u, 'fill')
% axis([-4 8 -2 2])
% title('u[n]')
% figure;
delta = 0 * n;
delta(n==0) = 1;
% stem(n, delta, 'fill')
% axis([-4 8 -2 2])
% title('delta[n]')
% figure;
r = n;
r(n<0) = 0;
% stem(n, r, 'fill')
% axis([-4 8 -2 10])
% title('r[n]')
x = [0, 0, 0, -2, 2, 2, 2, 2, 0, 0, 0, 0, 0];
figure;
stem(n, x, 'fill')
axis([-4 8 -4 4])
title('Opgave 1.4: x[n]')
figure;
y1 = filter([0, 0, 1], 1, x);
stem(n, y1, 'fill')
axis([-4 8 -4 4])
title('Opgave 1.4a: x[n-2]')
figure;
y2 = fliplr(x);
y2 = [y2(2:end), 0];
stem(n, y2, 'fill')
axis([-4 8 -4 4])
title('Opgave 1.4b: x[3-n]')
figure;
y3 = u .* filter([0, 1], 1, x);
stem(n, y3, 'fill')
axis([-4 8 -4 4])
title('Opgave 1.4c: x[n-1]u[n]')
figure;
y4 = delta .* filter([0, 1], 1, x);
stem(n, y4, 'fill')
axis([-4 8 -4 4])
title('Opgave 1.4d: x[n-1]delta[n]')
figure;
y4 = 0 * n;
y4(7)=x(4);
stem(n, y4, 'fill')
axis([-4 8 -4 4])
title('Opgave 1.4e: x[1-n]delta[n-2]')
figure;
y5 = 3 * filter([0, 1], 1, u);
stem(n, y5, 'fill')
axis([-4 8 -4 4])
title('Opgave 1.6a: 3u[n-1]')
figure;
y6 = 0 * n;
y6(3) = -2;
stem(n, y6, 'fill')
axis([-4 8 -4 4])
title('Opgave 1.6b: -2delta[n+2]')
figure;
y6 = 0 * n;
y6(3) = -2;
stem(n, y6, 'fill')
axis([-4 8 -4 4])
title('Opgave 1.6b: -2delta[n+2]')
figure;
y7 = [r(5:8),4*u(6:13),2]
stem(n, y7, 'fill')
axis([-4 8 -2 6])
title('Opgave 1.6c: r[n-4]-r[n]-4u[n-8]+2delta[n-8]')

