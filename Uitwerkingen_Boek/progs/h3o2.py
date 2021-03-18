import cmath

x = [2, -4, 1, -2, 3, -2, 2]
N = 7
for k in range(N):
    sum = 0
    for n in range(N):
        sum += x[n] * cmath.exp(-1j * 2 * cmath.pi * k * n / N)
    print('a_' + str(k) + ' = {0:.4f}'.format(sum / N))
