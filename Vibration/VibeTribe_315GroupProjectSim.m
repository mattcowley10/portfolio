clear all; clc; close all;

%%%%%%%%%%%%% System Parameters %%%%%%%%%%%
m=.0001; k=120.9; c=0.00; F0=7.3575*10^-4; F01= 2*F0; w=1099.56;

%%%%%%%%%%%Initial Conditions %%%%%%%%%%%%%%
x0=0; v0=0;

%%%%%%%%%%% Variable Calculations %%%%%%%%%%
f0=F0/m;
f01=F01/m;
wn=sqrt(k/m);
z=(c/m)/(2*wn);
wd=wn*sqrt(1-z^2);
znw=(c/m)*w;

%%%%%%%%%%% Equation 1 Relationships %%%%%%%
th=atan(znw/(wn^2-w^2));
X=f0 / sqrt((wn^2-w^2)^2+(znw)^2);
ph=atan2((wd*(x0-X*cos(th))),(v0+((x0-X*cos(th))*z*wn)-w*X*sin(th)));
A=(x0-X*cos(th))/(sin(ph));

%%%%%%%%%%% Defining Time %%%%%%%%%%%%%%%%%%
t=0:.0001:.15;

%%%%%%%%%%% Transient and SS Response %%%%%%
Xt=A.*exp(-z*wn.*t).*sin(wd.*t+ph);
Xs=X.*cos(w.*t-th);
Xtot=Xt+Xs;

%%%%%%%%%%% Figure 3 Plot %%%%%%%%%%%%%%%%%%
figure(1);
plot(t,Xtot)
title("Undamped Harmonic Excitation")
xlabel('Time (s)');
ylabel('Displacement (m)');

%%%%%%%%%%% Damped Response Parameters %%%%%
figure(2);
c=.006;
z=(c/m)/(2*wn);
wd=wn*sqrt(1-z^2);
znw=(c/m)*w;

th=atan(znw/(wn^2-w^2));
X=f0 / sqrt((wn^2-w^2)^2+(znw)^2);
ph=atan2((wd*(x0-X*cos(th))),(v0+((x0-X*cos(th))*z*wn)-w*X*sin(th)));
A=(x0-X*cos(th))/(sin(ph));

Xt=A.*exp(-z*wn.*t).*sin(wd.*t+ph);
Xs=X.*cos(w.*t-th);
Xtot=Xt+Xs;

%%%%%%%%%%%%%%% Figure 4 Damped Plot %%%%%%%%%%%%%%%%
plot(t,Xt)
hold on;
plot(t,Xs)
plot(t,Xtot)
legend(["Transient","Steady-State","Total"])
title("Damped Harmonic Excitation")
xlabel('Time (s)');
ylabel('Displacement (m)');
max(Xs)

%%%%%%%%%%%%%%% Figure 5 Damped Plot %%%%%%%%%%%%%%%%
th=atan(znw/(wn^2-w^2));
X=f01 / sqrt((wn^2-w^2)^2+(znw)^2);
ph=atan2((wd*(x0-X*cos(th))),(v0+((x0-X*cos(th))*z*wn)-w*X*sin(th)));
A=(x0-X*cos(th))/(sin(ph));

Xt=A.*exp(-z*wn.*t).*sin(wd.*t+ph);
Xs=X.*cos(w.*t-th);
Xtot=Xt+Xs;

Xt=A.*exp(-z*wn.*t).*sin(wd.*t+ph);
Xs=X.*cos(w.*t-th);
Xtot=Xt+Xs;
figure(3);
plot(t,Xt)
hold on;
plot(t,Xs)
plot(t,Xtot)
legend(["Transient","Steady-State","Total"])
title("Damped Harmonic Excitation")
xlabel('Time (s)');
ylabel('Displacement (m)');

max(Xs)