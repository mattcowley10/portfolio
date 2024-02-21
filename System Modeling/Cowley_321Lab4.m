clear all; close all; clc;

%System Parameters
m = 2; k = 4; alpha = 0.05; F = 2;

%Forcing Input, denominator of tf
den4 = m^2;
den3 = 0;
den2 = 2*m*alpha*k + 2*m*k;
den1 = 0;
den0 = 2*alpha*k^2 + k^2;

den = [den4 den3 den2 den1 den0];

%X1 displacement numerator, tf
x1DispNum4 = 0;
x1DispNum3 = 0;
x1DispNum2 = m;
x1DispNum1 = 0;
x1DispNum0 = alpha*k + k;

%x2 displacement numerator, tf
x2DispNum4 = 0;
x2DispNum3 = 0;
x2DispNum2 = 0;
x2DispNum1 = 0;
x2DispNum0 = alpha*k;

%x1 velocity numerator, tf
x1VelNum4 = 0;
x1VelNum3 = m;
x1VelNum2 = 0;
x1VelNum1 = alpha*k + k;
x1VelNum0 = 0;

%x2 velocity numerator, tf
x2VelNum4 = 0;
x2VelNum3 = 0;
x2VelNum2 = 0;
x2VelNum1 = alpha*k;
x2VelNum0 = 0;

%spring force numerator, tf
springNum4 = 0;
springNum3 = 0;
springNum2 = alpha*k*m;
springNum1 = 0;
springNum0 = alpha*k^2;

x1DispNum = [x1DispNum4 x1DispNum3 x1DispNum2 x1DispNum1 x1DispNum0];
x2DispNum = [x2DispNum4 x2DispNum3 x2DispNum2 x2DispNum1 x2DispNum0];
x1VelNum = [x1VelNum4 x1VelNum3 x1VelNum2 x1VelNum1 x1VelNum0];
x2VelNum = [x2VelNum4 x2VelNum3 x2VelNum2 x2VelNum1 x2VelNum0];
springNum = [springNum4 springNum3 springNum2 springNum1 springNum0];

%transfer functions
dispX1 = tf(x1DispNum,den);
dispX2 = tf(x2DispNum,den);
velX1 = tf(x1VelNum,den);
velX2 = tf(x2VelNum,den);
spring = tf(springNum,den);

%time and step options
tend = 120;
tstep = 0.01;
t = 0:tstep:tend;
opt = stepDataOptions;
opt.StepAmplitude = F;

%plots
subplot(3,2,1)
step(dispX1,t,opt);
title('Displacement of Mass 1');
xlabel('Time');
ylabel('Displacement (m)');

subplot(3,2,2)
step(dispX2,t,opt);
title('Displacement of Mass 2');
xlabel('Time');
ylabel('Displacement (m)');

subplot(3,2,3)
step(velX1,t,opt);
title('Velocity of Mass 1');
xlabel('Time');
ylabel('Velocity (m/s)');

subplot(3,2,4)
step(velX2,t,opt);
title('Velocity of Mass 2');
xlabel('Time');
ylabel('Velocity (m/s)');

subplot(3,2,[5,6])
step(spring,t,opt);
title('Interaction Force between Two Masses');
xlabel('Time');
ylabel('Force (N)')

x1DispMax = max(step(dispX1,opt))
x2DispMax = max(step(dispX2,opt))
x1VelMax = max(step(velX1,opt))
x2VelMax = max(step(velX2,opt))
forceMax = max(step(spring,opt))