N = 64;
n = [0:1:N-1];
x_n = 1 + cos(n*pi/32) + sin(n*pi/4);
a_k = fft(x_n)/N;
for i = 1:length(a_k)
    if abs(real(a_k(i)))<1e-9 && abs(imag(a_k(i)))<1e-9
        a_k(i) = 0;
    end
    fprintf("a_%d = %.4f%+.4fj, |a_%d| = %.4f, arg(a_%d) = %.4f pi\n", i-1, real(a_k(i)), imag(a_k(i)), i-1, abs(a_k(i)), i-1, angle(a_k(i))/pi)
end
