close all; clear all; clc;
global M C K F m1 m2 k1 k2 c1 c2 w F10 F20 x10 x20 v10 v20 x0 v0
%%%%%%%%%%%%%%%% System Parameters %%%%%%%%%%%%%%%%%%
m1 = 9; %[kg]
m2 = 1; %[kg]
k1 = 24; %[N/m]
k2 = 3; %[N/m]
c1 = 0; %[N-s/m]
c2 = 0; %[N-s/m]

M = [m1 0;0 m2];
C = [c1+c2 -c2;-c2 c2];
K = [k1+k2 -k2;-k2 k2];
F = [F10 F20]';

tspan = 0:0.01:50; %[s]

% %%%%%%%%%%%%%%%% Forcing Inputs (Problem 2) %%%%%%%%%%%%%%%%%%%%%%
% w = 0; %[rad/s]
% F10 = 0; %[N]
% F20 = 0; %[N]
% F = [F10 F20]';
% 
% %%%%%%%%%%%%%%%% Numerical Integration (Problem 2) %%%%%%%%%%%%%%%
% 
% x10 = 0.2357; %[m]
% x20 = 0.7071; %[m]
% v10 = 0; %[m/s]
% v20 = 0; %[m/s]
% 
% x0 = [x10 x20]; v0 = [v10 v20];
% IC = [x0 v0];
% 
% [t,xNumInt] = ode45(@numInt,tspan,IC);
% 
% %%%%%%%%%%%%%%%% Plot (Problem 2) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(1)
% hold on
% plot(t,xNumInt(:,1));
% plot(t,xNumInt(:,2));
% title('Response of an Undamped 2DOF System');
% xlabel('Time (s)');
% ylabel('Displacement');
% legend('Mass 1','Mass 2');

% %%%%%%%%%%%%%%%% Forcing Inputs (Problem 3) %%%%%%%%%%%%%%%%%%%%%%
% w = 2; %[rad/s]
% F10 = 0; %[N]
% F20 = 1; %[N]
% F = [F10 F20]';
% 
% x10 = 0; %[m]
% x20 = 0; %[m]
% v10 = 0; %[m/s]
% v20 = 0; %[m/s]
% 
% %%%%%%%%%%%%%%%% Numerical Integration (Problem 3) %%%%%%%%%%%%%%%
% x0 = [x10 x20]; v0 = [v10 v20];
% IC = [x0 v0];
% 
% [t,xNumInt] = ode45(@numInt,tspan,IC);
% 
% %%%%%%%%%%%%%%%% Plot (Problem 3) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(2)
% hold on
% plot(t,xNumInt(:,1));
% plot(t,xNumInt(:,2));
% title('Response of an Undamped 2DOF System');
% xlabel('Time (s)');
% ylabel('Displacement');
% legend('Mass 1','Mass 2');

%%%%%%%%%%%%%%%% Forcing Inputs (Problem 4) %%%%%%%%%%%%%%%%%%%%%%
w = 2; %[rad/s]
F10 = 3; %[N]
F20 = 1; %[N]
F = [F10 F20]';

x10 = 0; %[m]
x20 = 0; %[m]
v10 = 0; %[m/s]
v20 = 0; %[m/s]

%%%%%%%%%%%%%%%% Numerical Integration (Problem 4) %%%%%%%%%%%%%%%
x0 = [x10 x20]; v0 = [v10 v20];
IC = [x0 v0];

[t,xNumInt] = ode45(@numInt,tspan,IC);

%%%%%%%%%%%%%%%% Plot (Problem 4) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3)
hold on
plot(t,xNumInt(:,1));
plot(t,xNumInt(:,2));
title('Response of an Undamped 2DOF System');
xlabel('Time (s)');
ylabel('Displacement');
legend('Mass 1','Mass 2');

%%%%%%%%%%%%%%%% Function %%%%%%%%%%%%%%%%%%%%%%%%%%%
function xdot = numInt(t,x)
global M C K F w
    xdot = [zeros(2,2) eye(2,2);-M\K -M\C]*x...
        +[0;0;inv(M)*F]*cos(w*t);
end