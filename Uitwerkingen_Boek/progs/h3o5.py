import cmath

N = 64
x = [0 for i in range(N)]
for n in range(N):
    x[n] = 1 + cmath.cos(n * cmath.pi / 32) + cmath.sin(n * cmath.pi / 4)
for k in range(N):
    sum = 0
    for n in range(N):
        sum += x[n] * cmath.exp(-1j * 2 * cmath.pi * k * n / N)
    a_k = sum/N
    if (abs(a_k.real) < 1e-9 and abs(a_k.imag) < 1e-9):
        a_k = 0
    print('|a_' + str(k) + '| = {0:.4f}'.format(abs(a_k)), 'arg(a_'+str(k)+') = {0:.4f} pi'.format(cmath.phase(a_k)/cmath.pi))