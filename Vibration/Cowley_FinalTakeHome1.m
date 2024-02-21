close all; clear all; clc;
global M C K F m1 m2 k1 k2 c1 c2 w F10 F20 x10 x20 v10 v20 x0 v0
%%%%%%%%%%%%%%%% System Parameters %%%%%%%%%%%%%%%%%%%
m1 = 9; %[kg]
m2 = 1; %[kg]
k1 = 24; %[N/m]
k2 = 3; %[N/m]
c1 = 2.4; %[N-s/m]
c2 = 0.3; %[N-s/m]
tspan = 0:0.01:50; %[s]
k = [k1 k2];
m = [m1 m2];
c = [c1 c2];

%%%%%%%%%%%%%%%% Forcing Inputs %%%%%%%%%%%%%%%%%%%%%%
w = 1; %[rad/s]
F10 = 0; %[N]
F20 = 3; %[N]

%%%%%%%%%%%%%%%% Initial Conditions %%%%%%%%%%%%%%%%%%
x10 = 0.1; %[m]
x20 = 0; %[m]
v10 = 1; %[m/s]
v20 = -1; %[m/s]

%%%%%%%%%%%%%%%%% Numerical Integration Analysis %%%%%%
M = [m1 0;0 m2];
C = [c1+c2 -c2;-c2 c2];
K = [k1+k2 -k2;-k2 k2];
F = [F10 F20]';
B = [1 0;0 1];

x0 = [x10 x20]; v0 = [v10 v20];

IC = [x0 v0];

[t,xNumInt] = ode45(@numInt,tspan,IC);

%%%%%%%%%%%%%%%% Simulink Analysis %%%%%%%%%%%%%%%%%%%
simOut = sim('Cowley_TakeHomeFinalSim.slx', 'SimulationMode', 'normal',...
    'SaveState','on','StateSaveName','xout','SaveOutput','on',...
    'OutputSaveName','yout','SaveFormat','Dataset');

x1 = simOut.yout.get('x1').Values;
x2 = simOut.yout.get('x2').Values;

%%%%%%%%%%%%%%%% Modal Analysis %%%%%%%%%%%%%%%%%%%%%%
invM = inv(sqrt(M));
Ktild = invM * K * invM;
[e_vec, e_val] = eig(Ktild);
[lambda, I] = sort(diag(e_val));

wn = sqrt(lambda);
D = diag(lambda);

P = e_vec(:,I);

S = invM*P;
invS = inv(S);

x0 = x0';
v0 = v0';

rx0 = invS*x0;
rv0 = invS*v0;

Ctild=invM*C*invM;
zetaMat=diag(P'*Ctild*P);
zeta=zetaMat./(2*sqrt(diag(D)));

f = P'*invM*B*F;

for ii = 1:length(M)
    wd(ii) = wn(ii)*sqrt(1-zeta(ii)^2);
    theta(ii) = atan2(2*zeta(ii)*wn(ii)*w,wn(ii)^2-w^2);
    R(ii) = f(ii)/sqrt((wn(ii)^2-w^2)^2+(2*zeta(ii)*wn(ii)*w)^2);
    phi(ii) = atan2(wd(ii)*(rx0(ii)-R(ii)*cos(theta(ii))),rv0(ii)+...
        (rx0(ii)-R(ii)*cos(theta(ii)))*zeta(ii)*wn(ii)...
        -w*R(ii)*sin(theta(ii)));
    A(ii) = (rx0(ii)-R(ii)*cos(theta(ii)))/sin(phi(ii));
    rTrans(ii,:) = A(ii).*exp(-zeta(ii).*wn(ii).*t).*sin(wd(ii).*t+phi(ii));
    rSS(ii,:) = R(ii).*cos(w.*t-theta(ii));
    r(ii,:) = rTrans(ii,:)+rSS(ii,:);
end

xModal = S*r;

%%%%%%%%%%%%%%%% Plots %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)

subplot(2,1,1)
hold on
plot(t,xNumInt(:,1));
plot(t,xModal(1,:),'--');
plot(x1);
title('Response of 2 DOF System Using Numerical Integration, Modal Analysis, and Simulink');
xlabel('Time (s)');
ylabel('Displacement (m)');
legend('Numerical Integration','Modal Analysis','Simulink Results');

subplot(2,1,2)
hold on
plot(t,xNumInt(:,2));
plot(t,xModal(2,:),'--');
plot(x2);
xlabel('Time (s)');
ylabel('Displacement (m)');
legend('Numerical Integration','Modal Analysis','Simulink Results');

%%%%%%%%%%%%%%%% Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%
function xdot = numInt(t,x)
global M C K F w
    xdot = [zeros(2,2) eye(2,2);-M\K -M\C]*x...
        +[0;0;inv(M)*F]*cos(w*t);
end