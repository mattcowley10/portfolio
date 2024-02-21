clear all; close all
clc

A11 = 0.916;
w1 = 1.642;

A12 = 0.084;
w2 = 2.511;

A21 = 0.83477;
A22 = -0.832272;

t = 0:0.01:20;

x1 = A11.*cos(w1.*t)+A12.*cos(w2.*t);
x2 = A21.*cos(w1.*t)+A22.*cos(w2.*t);

figure(1)
hold on
plot(t,x1)
plot(t,x2)
title('Response of a 2DOF Undamped System');
ylabel('Displacement (m)');
xlabel('Time (s)');
legend('Mass 1','Mass 2');