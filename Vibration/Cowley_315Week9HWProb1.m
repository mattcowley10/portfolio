clear all; close all; clc;

t = 0:0.01:10;

xh = exp(-t).*(sin(t)+cos(t));
xp = (exp(-(t-pi)).*sin(t-pi)).*stepfun(t,pi);

x = xh + xp;

hold on
plot(t,x,'b');
plot(t,xh,'--');
plot(t,xp,'r');
title("Response of a Time Delay Impulse with IC's");
ylabel('Displacement (m)');
xlabel('Time (s)');
legend('Total Response','IC Response','Impulse Response');