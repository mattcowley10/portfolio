clear all
a = 1;
b = 2;
c = 4;
in = 1;
num = 4;

syms s
eqn = a*s^2+b*s+c;
poles = solve(eqn,s);
poles = double(poles)

wn = sqrt(c);
zeta = b/2/wn;
wd = wn*sqrt(1-zeta^2);

tr = 1.8/wn;
ts = 4.2/zeta/wn;
tp = pi/wd;
POS = 100*exp((-pi*zeta)/sqrt(1-zeta^2));
DCgain = num/wn^2;
SSE = 1-DCgain;
