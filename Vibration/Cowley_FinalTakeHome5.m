close all; clc;
global M C K F m1 m2 k1 k2 c1 c2 w F10 F20 x10 x20 v10 v20 x0 v0
%%%%%%%%%%%%%%%% System Parameters %%%%%%%%%%%%%%%%%%%
m1 = 9; %[kg]
m2 = 1; %[kg]
k1 = 24; %[N/m]
k2 = 3; %[N/m]
c1 = 0; %[N-s/m]
c2 = 0; %[N-s/m]
tspan = 0:0.01:50; %[s]

%%%%%%%%%%%%%%%% Forcing Inputs %%%%%%%%%%%%%%%%%%%%%%
F10 = 1; %[N]
F20 = 0; %[N]
w = 0;

%%%%%%%%%%%%%%%% Initial Conditions %%%%%%%%%%%%%%%%%%
x10 = 0; %[m]
x20 = 0; %[m]
v10 = F10/m1; %[m/s]
v20 = 0; %[m/s]

%%%%%%%%%%%%%%%%% Numerical Integration Analysis %%%%%%
M = [m1 0;0 m2];
C = [c1+c2 -c2;-c2 c2];
K = [k1+k2 -k2;-k2 k2];
F = [F10 F20]';

x0 = [x10 x20]; v0 = [v10 v20];

IC = [x0 v0];

[t,xNumInt] = ode45(@numInt,tspan,IC);

%%%%%%%%%%%%%%%% Plot %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
hold on
plot(t,xNumInt(:,1));
plot(t,xNumInt(:,2));
title('Impulse Response of an Undamped 2DOF System');
xlabel('Time (s)');
ylabel('Displacement');
legend('Mass 1','Mass 2');

%%%%%%%%%%%%%%%% Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%
function xdot = numInt(t,x)
global M C K F w
    xdot = [zeros(2,2) eye(2,2);-M\K -M\C]*x...
        +[0;0;inv(M)*F]*cos(w*t);
end