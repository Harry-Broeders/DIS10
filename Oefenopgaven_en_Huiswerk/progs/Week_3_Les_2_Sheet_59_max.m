fs = 1000.0;
f = 0:fs/10000000:fs/2;
H = 1 ./ (1 - 1.5*exp(-1i*2*pi*f/fs) + 0.85*exp(-2i*2*pi*f/fs));
Habs = 1 ./ sqrt((1 - 1.5*cos(2*pi*f/fs) + 0.85*cos(4*pi*f/fs)).^2+(1.5*sin(2*pi*f/fs) - 0.85*sin(4*pi*f/fs)).^2);
[Hmax, imax] = max(Habs);
f_Hmax = imax/10000
Hmax

fs = 1000;
syms f_;
H_ = (1 - 1.5*cos(2*pi*f_/fs) + 0.85*cos(4*pi*f_/fs))^2+(1.5*sin(2*pi*f_/fs) - 0.85*sin(4*pi*f_/fs)).^2
H_simplified = simplify(H_)
H_derived = diff(H_simplified)
f_H_max = solve(H_derived == 0)
double(f_H_max(3))
