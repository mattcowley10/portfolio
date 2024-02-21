clear all; clc; close all;

global m k F w f0 wn c zeta wd x0 v0

%Problem 1 Part a, Analytical Solution

%System Parameters
m = 5; k = 2000; F = 100; w = 30; f0 = F/m; wn = sqrt(k/m);
c = 0; zeta = c/wn/m/2; wd = wn*sqrt(1-zeta^2);

%Initial Conditions
x0 = 0.1; v0 = 0.1;

t = 0:0.001:2;
x1 = (v0/wn).*sin(wn.*t) + (x0-(f0/(wn^2-(w^2)))).*cos(wn.*t) + ...
    (f0/(wn^2-(w^2))).*cos(w.*t);

figure(1)
hold on
plot(t,x1);
title('Response of an Undamped Single Degree of Freedom with Harmonic Force');
ylabel('Displacement (m)');
xlabel('Time (s)');

%Problem 1 Part b, Convolution Integral

syms t tau

h = 1/(m*wn) .* sin(wd.*(t-tau));

input = F .* cos(w.*tau);

CI = input.*h;

CI_int = int(CI,tau,0,t);

t = 0:0.001:2;

x1 = subs(CI_int,t);

phi = atan(wn*x0/v0);
A = sqrt(x0^2+(v0/wn)^2);
xh = A.*sin(wn.*t+phi);

x = xh+x1;

plot(t,x,'--');

%Problem 1, Part c, LaPlace Transform

syms x(t) s Xs

d2x(t) = diff(x(t),t,2);

f1 = m*d2x(t) + k*x(t);
f2 = F*cos(w*t);

eqn1 = f1==f2;
eqn1LT = laplace(eqn1,t,s);
eqn1LT = subs(eqn1LT,laplace(x,t,s),Xs);
eqn1LT = subs(eqn1LT,x(0),x0);
eqn1LT = subs(eqn1LT,subs(diff(x(t),t),0),v0);
Xs = solve(eqn1LT,Xs);

x = ilaplace(Xs);

t = 0:0.001:2;

x = subs(x,t);

plot(t,x,':');

%Problem 1, Part d, Simulink

simOut = sim('Cowley_315Exam2TakeHomeSim.slx', 'SimulationMode', 'normal',...
    'SaveState','on','StateSaveName','xout','SaveOutput','on',...
    'OutputSaveName','yout','SaveFormat','Dataset');

x = simOut.yout.get('x').Values;
plot(x,'-.');

%Problem 1, Part e, ode45

IC = [x0 v0];

[time, ODE] = ode45(@nonlinear,t,IC);

x = ODE(:,1);

plot(time,x,':');

legend('Analytical','Convolution Integral','LaPlace Transform',...
    'Simulink','ode45 Solver');

%Problem 2

syms t n

m = 1; c = 10; k = 1000; x0 = 0; v0 = 0; wn = sqrt(k/m); T = 5; wt = 2*pi/T;
zeta = c/wn/m/2; wd = wn*sqrt(1-zeta^2);

force1 = 4/T*t-1;
force2 = 1-4/T*(t-T/2);

a0 = 2/T * (int(force1,0,T/2) + int(force2,T/2,T));
an = 2/T * (int(force1 * cos(n*wt*t),0,T/2) + int(force2 * cos(n*wt*t),T/2,T));
bn = 2/T * (int(force1 * sin(n*wt*t),0,T/2) + int(force2 * sin(n*wt*t),T/2,T));

theta = atan2(2*zeta*wn*n*wt,wn^2-(n*wt)^2);

x = a0/2/k;
xcn = (an/m)/sqrt((wn^2-(n*wt)^2)^2+(2*zeta*wn*n*wt)^2)*cos(n*wt*t-theta);
xsn = (bn/m)/sqrt((wn^2-(n*wt)^2)^2+(2*zeta*wn*n*wt)^2)*sin(n*wt*t-theta);

x1 = x + symsum(xcn+xsn,n,1,1);
x2 = x + symsum(xcn+xsn,n,1,3);
x3 = x + symsum(xcn+xsn,n,1,5);
x4 = x + symsum(xcn+xsn,n,1,7);

t = 0:0.01:10;

x1 = subs(x1,t);
x2 = subs(x2,t);
x3 = subs(x3,t);
x4 = subs(x4,t);

figure(2)
hold on
plot(t,x1)
plot(t,x2)
plot(t,x3)
plot(t,x4)
title('SDOF System Under a Periodic Forcing Input');
ylabel('Displacement (m)');
xlabel('Time (s)');
legend('One Term','Three Terms','Five Terms','Seven Terms');

%Problem 3, Part a

x0 = 0; v0 = 0;

syms t tau
m = 1; k = 1; c = 0; wn = sqrt(k/m); zeta = c/2/m/wn; wd = wn*sqrt(1-zeta^2);

h = 1/(m*wn) .* sin(wd.*(t-tau));

F1 = tau;
F2 = 1;
F3 = 0;

CI1 = F1.*h;
CI2 = F2.*h;
CI3 = F3.*h;

x1 = int(CI1,tau,0,t);
x2 = int(CI1,tau,0,pi) + int(CI2,tau,pi,t);
x3 = int(CI1,tau,0,pi) + int(CI2,tau,pi,2*pi) + int(CI3,tau,2*pi,t);

t = 0:0.01:20;
x1 = subs(x1,t);
x2 = subs(x2,t);
x3 = subs(x3,t);
x1 = double(x1);
x2 = double(x2);
x3 = double(x3);

x = x1.*(t<pi)+x2.*(t>pi & t<2*pi)+x3.*(t>2*pi);

figure(3)
hold on
plot(t,x)
title('Undamped SDOF System with an Arbitrary Input Response');
xlabel('Time (s)');
ylabel('Displacement (m)');

%Problem 3, Part b

simOut = sim('Cowley_315Exam2TakeHomeSim3.slx', 'SimulationMode', 'normal',...
    'SaveState','on','StateSaveName','xout','SaveOutput','on',...
    'OutputSaveName','yout','SaveFormat','Dataset');

x = simOut.yout.get('x').Values;

plot(x,'--')
legend('Convolution Integral','Simulink');

function thetaDot = nonlinear(t,x) %system of equations for linear model 
global f0 w k m
thetaDot = zeros(2,1);
thetaDot(1) = x(2);
thetaDot(2) = f0*cos(w*t)-(k/m)*x(1);
end