import cmath
import numpy as np
import matplotlib.pyplot as plt

def H(Omega):
    return (2 - 1/2*cmath.e**(-1j*Omega)) / (1 + 3/4*cmath.e**(-1j*Omega))

print('  Ω        H(Ω)      |H(Ω)| arg(H(Ω)')
for Omega in np.arange(0, cmath.pi+0.001, cmath.pi/4):
    print('{:.3f}'.format(Omega),'{:13.3f}'.format(H(Omega)), '{:6.3f}'.format(abs(H(Omega))), '{:6.3f}'.format(cmath.phase(H(Omega))))

Omega = np.linspace(0, cmath.pi, 100)
plt.title('Versterking')
plt.figure(1)
plt.ylim(0, 10.5);
plt.plot(Omega, np.abs(H(Omega)))
plt.xlabel('Ω (radialen/sample)')
plt.xticks([0, 0.25*cmath.pi, 0.5*cmath.pi, 0.75*cmath.pi, cmath.pi], ['0', '1/4 π', '1/2 π', '3/4 π', 'π'])
plt.ylabel('|H(Ω)|')
plt.minorticks_on()
plt.grid(which='major', linestyle='-')
plt.grid(which='minor', linestyle=':')

plt.figure(2)
plt.plot(Omega, np.angle(H(Omega)))
plt.title('Fasedraaiing')
plt.xlabel('Ω (radialen/sample)')
plt.xticks([0, 0.25*cmath.pi, 0.5*cmath.pi, 0.75*cmath.pi, cmath.pi], ['0', '1/4 π', '1/2 π', '3/4 π', 'π'])
plt.ylabel('arg(H(Ω)) (rad)')
plt.minorticks_on()
plt.grid(which='major', linestyle='-')
plt.grid(which='minor', linestyle=':')
plt.show()
