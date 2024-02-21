clear all; close all; clc;

%System Parameters
m = 1500; mw = 118; Ig = 2160; a = 1.4; b = 1.7; bs = 860; bt = 10; ks = 36500;
kt = 190000;

%State matrices
A = [0 1 0 0 0 0 0 0;-2*ks/m -2*bs/m ks/m bs/m ks/m bs/m ks*(b-a)/m b*bs/m...
    ;0 0 0 1 0 0 0 0;ks/mw bs/mw (-ks-kt)/mw (-bs-bt)/mw 0 0 -ks*b/mw -b*bs/mw...
    ;0 0 0 0 0 1 0 0;ks/mw bs/mw 0 0 (-ks-kt)/mw (-bs-bt)/mw ks*a/mw bs*a/mw...
    ;0 0 0 0 0 0 0 1;ks*(b-a)/Ig bs*(b-a)/Ig -b*ks/Ig -b*bs/Ig a*ks/Ig a*bs/Ig...
    -ks*(b^2+a^2)/Ig -bs*(b^2+a^2)/Ig];

B = zeros(8,4);
B(4,1) = kt/mw;
B(4,3) = bt/mw;
B(6,2) = kt/mw;
B(6,4) = bt/mw;

C = [1 0 0 0 0 0 0 0;0 0 0 0 0 0 1 0;0 1 0 0 0 0 0 0;0 0 0 0 0 0 0 1;...
    0 0 0 0 kt bt 0 0;0 0 kt bt 0 0 0 0;ks bs 0 0 -ks -bs ks*a bs*a;...
    ks bs -ks -bs 0 0 -ks*b -bs*b];

D = zeros(8,4);
D(5,2) = -kt;
D(5,4) = -bt;
D(6,1) = -kt;
D(6,3) = -bt;

%Creating system
sys = ss(A,B,C,D,...
    'StateName',{'x','v','xb','vb','xf','vf','\theta','\omega'},...
    'StateUnit',{'m','m/s','m','m/s','m','m/s','rad','rad/s'},...
    'InputName',{'yb','yf','vb','vf'},...
    'InputUnit',{'m','m','m/s','m/s'},...
    'OutputName',{'x','theta','v','omega','fgf','fgb','fsf','fsb'},...
    'OutputUnit',{'m','rad','m/s','rad/s','N','N','N','N'});

ts = 0.01; tf = 15;
tspan = 0:ts:tf;
x0 = [0 0 0 0 0 0 0 0];

%Input matrices for simulation
uss = 0.1524;
u(1,:) = uss*zeros(length(tspan),1);
u(2,:) = uss*ones(length(tspan),1);
u(3,:) = uss*zeros(length(tspan),1);
u(4,:) = uss*zeros(length(tspan),1);

%Curb Simulation
y1 = lsim(sys,u,tspan,x0);

%Maximum Forces
fMaxFrontT1 = max(abs(y1(:,5)));
fMaxBackT1 = max(abs(y1(:,6)));
fMaxFrontS1 = max(abs(y1(:,7)));
fMaxBackS1 = max(abs(y1(:,8)));

%Plotting y1 Curb Simulation
figure(1)
subplot(4,2,1)
plot(tspan,y1(:,1));
title('Displacement of the Car')
ylabel(sys.OutputUnit(1,1));
xlabel('Time (s)');
grid on

subplot(4,2,2)
plot(tspan,y1(:,2));
title('Angular Displacement of the Car')
ylabel(sys.OutputUnit(2,1));
xlabel('Time (s)');
grid on

subplot(4,2,3)
plot(tspan,y1(:,3));
title('Velocity of the Car')
ylabel(sys.OutputUnit(3,1));
xlabel('Time (s)');
grid on

subplot(4,2,4)
plot(tspan,y1(:,4));
title('Angular Velocity of the Car')
ylabel(sys.OutputUnit(4,1));
xlabel('Time (s)');
grid on

subplot(4,2,5)
plot(tspan,y1(:,5));
title('Force on the Ground, Front Tire')
ylabel(sys.OutputUnit(5,1));
xlabel('Time (s)');
grid on

subplot(4,2,6)
plot(tspan,y1(:,6));
title('Force on the Ground, Back Tire')
ylabel(sys.OutputUnit(6,1));
xlabel('Time (s)');
grid on

subplot(4,2,7)
plot(tspan,y1(:,7));
title('Force on the Suspension, Front Tire')
ylabel(sys.OutputUnit(7,1));
xlabel('Time (s)');
grid on

subplot(4,2,8)
plot(tspan,y1(:,8));
title('Force on the Suspension, Back Tire')
ylabel(sys.OutputUnit(8,1));
xlabel('Time (s)');
grid on

%Input matrices for simulation
grade = 5.71; m = tand(grade);
vel = 12; delay = (a+b)/vel;

ussF = m.*vel.*tspan;
ussB = m.*vel.*(tspan-delay).*stepfun(tspan,delay);
ussVF = m.*vel.*ones(length(tspan),1);
ussVB = m.*vel.*stepfun(tspan,delay);

u1(1,:) = ussB;
u1(2,:) = ussF;
u1(3,:) = ussVF;
u1(4,:) = ussVB;

%Ramp Simulation
y2 = lsim(sys,u1,tspan);

%Maximum Forces
fMaxBackT2 = max(abs(y2(:,5)));
fMaxFrontT2 = max(abs(y2(:,6)));
fMaxBackS2 = max(abs(y2(:,7)));
fMaxFrontS2 = max(abs(y2(:,8)));

%Plotting y2 Ramp Simulation
figure(2)
subplot(4,2,1)
plot(tspan,y2(:,1));
title('Displacement of the Car')
ylabel(sys.OutputUnit(1,1));
xlabel('Time (s)');
grid on

subplot(4,2,2)
plot(tspan,y2(:,2));
title('Angular Displacement of the Car')
ylabel(sys.OutputUnit(2,1));
xlabel('Time (s)');
grid on

subplot(4,2,3)
plot(tspan,y2(:,3));
title('Velocity of the Car')
ylabel(sys.OutputUnit(3,1));
xlabel('Time (s)');
grid on

subplot(4,2,4)
plot(tspan,y2(:,4));
title('Angular Velocity of the Car')
ylabel(sys.OutputUnit(4,1));
xlabel('Time (s)');
grid on

subplot(4,2,5)
plot(tspan,y2(:,5));
title('Force on the Ground, Front Tire')
ylabel(sys.OutputUnit(5,1));
xlabel('Time (s)');
grid on

subplot(4,2,6)
plot(tspan,y2(:,6));
title('Force on the Ground, Back Tire')
ylabel(sys.OutputUnit(6,1));
xlabel('Time (s)');
grid on

subplot(4,2,7)
plot(tspan,y2(:,7));
title('Force on the Suspension, Front Tire')
ylabel(sys.OutputUnit(7,1));
xlabel('Time (s)');
grid on

subplot(4,2,8)
plot(tspan,y2(:,8));
title('Force on the Suspension, Back Tire')
ylabel(sys.OutputUnit(8,1));
xlabel('Time (s)');
grid on