import cmath
import numpy as np
import matplotlib.pyplot as plt

fs = 1000

def H(f):
    return 1 / (1 - 1.5*cmath.e**(-1j*2*cmath.pi*f/fs) + 0.85*cmath.e**(-2j*2*cmath.pi*f/fs))

print('    f        H(f)      |H(f)| arg(H(f)')
for f in np.arange(0, fs/2+0.001, fs/8):
    print('{:7.3f}'.format(f),'{:13.3f}'.format(H(f)), '{:6.3f}'.format(abs(H(f))), '{:6.3f}'.format(cmath.phase(H(f))))

f = np.linspace(0, fs/2, 2000)
plt.title('Versterking')
plt.figure(1)
plt.plot(f, np.abs(H(f)))
plt.xlabel('f (Hz)')
plt.ylabel('|H(f)|')
plt.minorticks_on()
plt.grid(which='major', linestyle='-')
plt.grid(which='minor', linestyle=':')

plt.figure(2)
plt.plot(f, np.angle(H(f)))
plt.title('Fasedraaiing')
plt.xlabel('f (Hz)')
plt.ylabel('arg(H(f)) (rad)')
plt.minorticks_on()
plt.grid(which='major', linestyle='-')
plt.grid(which='minor', linestyle=':')
plt.show()
