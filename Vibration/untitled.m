clear all; close all; clc;
m = 1; %kg
k = 4; %N/m
Period = 2*pi*sqrt(m/k);
t = 0:0.05:2*Period;

%Case 1:
x0 = 0.001; %m
v0 = 0; %m/s
x = sqrt();
plot(t,x);
hold on;

%Case 2:
x0 = -0.001; %m
v0 = 0; %m/s
x = x0*cos(2*t);
plot(t,x);
legend('Case 1', 'Case 2');
hold off;

