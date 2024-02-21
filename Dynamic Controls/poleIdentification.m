OS = 46;
tp = 1.4;

wd = pi/tp;
zeta = (-log(OS/100))/sqrt(pi^2+(log(OS/100)^2));
wn = wd/sqrt(1-zeta^2);

a = 1;
b = 2*wn*zeta;
c = wn^2;

syms s
eqn = a*s^2+b*s+c;
poles = solve(eqn,s);
poles = double(poles)