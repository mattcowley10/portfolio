clc

%Transfer function definition
s = tf('s');

%Motor response characteristics, derived from lab handout
Kc = 20;
Kdc = 1;
tr = 765.817/1000;
OS = (6.205-5)/5;

%System characteristic calculations
wn = 1.8/tr;
syms z
eqn = OS==exp((-pi*z)/sqrt(1-z^2));
zeta = vpasolve(eqn,z);
zeta = double(zeta);

%Closed-loop transfer function definition
num = Kdc*wn^2;
den = [1 2*zeta*wn wn^2];
sysClosed = tf(num,den);
closedInfo = stepinfo(sysClosed)

%Step Response
figure(1)
step(sysClosed);
title("Proportional Closed Loop Step Response")
yline(closedInfo.Peak,':k')
xline(closedInfo.PeakTime,':k')

%Open-loop transfer function derivation
sysOpen = sysClosed/(Kc*(1-sysClosed))
[num, den] = tfdata(sysOpen); %Extracting transfer function data for Simulink Input

%Response of closed-loop transfer function with PD controller
figure(2)
plot(out.pdOutput);
ylabel("Amplitude");
title("Tuned PD Controller Closed Loop Step Response")