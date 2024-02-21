clc 
clear all

%Parameters
kr = 0.5;
br = 0.25;
J = 1;
r = 0.4;
m = 0.5;
k = 1;
b = 0.25;
F = 1;

%Transfer Func
s = tf('s');
sys = (b*s*r+k*r)/((J*s^2+b*r^2*s+k*r^2+br*s+kr)*(m*s^2+b*s+k)-(-b*s*r-k*r)^2);
step(sys)
title('Step Response of Disk');
ylabel('Position (rad)');