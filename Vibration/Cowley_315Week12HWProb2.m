clear all; close all;
clc

t = 0:0.01:10;
r1 = 2.*cos(sqrt(2).*t);
r2 = 0.*t;

x1 = (2/3).*cos(sqrt(2).*t);
x2 = 2.*cos(sqrt(2).*t);

figure(1)
hold on
plot(t,r1);
plot(t,r2);
title('Modal Response of a 2DOF System');
xlabel('Time (s)');
ylabel('r-Coordinate');
legend('Mass 1','Mass 2');

figure(2)
hold on
plot(t,x1)
plot(t,x2)
title('Physical Response of a 2DOF System');
xlabel('Time (s)');
ylabel('Displacement (m)');
legend('Mass 1','Mass 2');