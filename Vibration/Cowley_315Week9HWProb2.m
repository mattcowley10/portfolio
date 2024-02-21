clear all; close all; clc;

t = 0:0.01:20;

x1 = t - sin(t);
x2 = 1+pi.*cos(t-pi)+sin(t-pi)-sin(t)-cos(t-pi);
x3 = pi.*cos(t-pi)+sin(t-pi)-sin(t)+cos(t-2*pi)-cos(t-pi);

x = x1.*(t>=0 & t<pi) + x2.*(t>=pi & t<2*pi) + x3.*(t>=2*pi);

hold on
plot(t,x,'.');
plot(t,x1);
plot(t,x2);
plot(t,x3);
title('Time Delay Response of a System with an Arbitrary Force Input');
xlabel('Time (s)');
ylabel('Displacement (m)');
legend('Total Response','First Input','Second Input','Third Input');