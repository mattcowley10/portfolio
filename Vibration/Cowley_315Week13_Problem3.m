clc; clear all; close all;
global M C K B wd
M = [5 0;0 1]; C = [3 -0.5;-0.5 0.5]; K = [30 -1;-1 1]; B = [1;1]; wd = 4;

x0 = [0 0.1]; v0 = [1 0];

IC = [x0 v0];

tspan = 0:0.01:20;

[t,x] = ode45(@numInt,tspan,IC);

figure(1)
hold on
plot(t,x(:,1));
plot(t,x(:,2));
title('Response of a Damped Two-Degree-of-Freedom System');
xlabel('Time (s)');
ylabel('Displacement (m)');
legend('Mass 1','Mass 2');

function xdot = numInt(t,x)
global M C K B wd
    xdot = [zeros(2,2) eye(2,2); -M\K -M\C]*x + [0;0;M\B]*sin(wd*t);
end