m = 0.0001; k = 121;

wn = sqrt(k/m);
w = 1099;

typA = 0.75;

a = typA*9.81;

F = m*a;

f0 = F/m;

x0 = 0; v0 = 0;

A = (v0/wn) - (w/wn)*f0/(wn^2-w^2);

t = 0:0.001:1;

x = A.*sin(wn.*t)+x0.*cos(wn.*t)+(f0/(wn^2-w^2)).*sin(w.*t);
plot(t,x);
