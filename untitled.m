clear all; clc; close all
%Codnitions
global w wn zeta f0

t=0:0.01:2;

m=0.4;
c=19;
k=500;

wn = sqrt(k/m);
zeta = c/(2*wn*m);
w = 10; % forcing freq (rad/s)
F0 = 1; % N
f0 = F0/m;
tspan=[0 t(end)];

x0=0.001;
v0=0.5;

IC=[x0 v0];

% for ii = 1:length(c)
% zeta = c(ii)/(2*wn*m);
% [t,x] = ode45('xddot',tspan,IC);
% Peak(ii) = max(x(:,1));
% end

[t,x]=ode45('xddot',tspan, IC);

figure(1)
% plot(c,Peak,c,0.008*ones(length(c),1),'r--')
Peak = max(x(:,1));
plot(t,x(:,1));
legend('Repsonse')
ylabel('x(t)')
xlabel('time')