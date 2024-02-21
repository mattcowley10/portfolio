clear all; clc;

m = 0.4; c =10; k = 500; w = 10; F = 1; wn = sqrt(k/m); %system parameters
cons = 0.008; %response constraint
t = 0:0.01:2; %time

x0 = 0.001; v0 = 0.5; %initial conditions

zeta = c/(2*m*wn); %damping coefficient
f0 = F/m; %force/mass
wd = wn * sqrt(1-zeta^2); %damped frequency

X = f0/sqrt((wn^2-(w^2))^2+(2*zeta*wn*w)^2); %steady state magnitude
theta = atan(2*zeta*wn*w/(wn^2-(w^2))); %steady state phase shift
phi = atan((wd*(x0-X*cos(theta)))/(v0+(x0-X*cos(theta))*zeta*wn-w*X*sin(theta))); %transient phase shift
A = (x0-X*cos(theta))/sin(phi); %transient amplitude

x = A*exp(-zeta.*wn.*t).*sin(wd.*t+phi) + X.*cos(w.*t-theta); %underdamped displacement response

%Plotting Original Response where C = 10 kg/s
figure(1)
hold on
plot(t,x);
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Original Response');
yline(cons,'r--');
legend('Response','Maximum Allowable Deflection');

%Finding Maximum deflection for each respective 'c' value
c = 0:0.01:20;
xMax = zeros(length(c),1);
for ii = 1:length(c)
    zeta(ii) = c(ii)/(2*m*wn);
    wd(ii) = wn * sqrt(1-zeta(ii)^2);
    X(ii) = f0/sqrt((wn^2-(w^2))^2+(w*zeta(ii)*wn*w)^2);
    theta(ii) = atan(2*zeta(ii)*wn*w/(wn^2-(w^2))); %steady state phase shift
    phi(ii) = atan((wd(ii)*(x0-X(ii)*cos(theta(ii))))/(v0+(x0-X(ii)*cos(theta(ii)))...
        *zeta(ii)*wn-w*X(ii)*sin(theta(ii)))); %transient phase shift
    A(ii) = (x0-X(ii)*cos(theta(ii)))/sin(phi(ii)); %transient amplitude
    x = A(ii)*exp(-zeta(ii).*wn.*t).*sin(wd(ii).*t+phi(ii)) + X(ii).*...
        cos(w.*t-theta(ii));
    
    xMax(ii) = max(x);
end

%Plotting Max Deflection with Respect to 'c' Value
figure(2)
plot(c,xMax);
yline(cons,'r');
title('Change in Maximum Deflection with Respect to Dampening Coefficient');
xlabel('Dampening Coefficient, c (kg/s)');
ylabel('Maximum Displacement of Disk (m)');
legend('Respective Dampening Coefficients','Maximum Allowable Deflection');

%Calculating Response of System with New 'c' Value
c = 17.07; %found using graphical method
zeta = c/(2*m*wn);
wd = wn * sqrt(1-zeta^2); %damped frequency
X = f0/sqrt((wn^2-(w^2))^2+(w*zeta*wn*w)^2); %steady state magnitude
theta = atan(2*zeta*wn*w/(wn^2-(w^2))); %steady state phase shift
phi = atan((wd*(x0-X*cos(theta)))/(v0+(x0-X*cos(theta))*zeta*wn-w*X*sin(theta))); %transient phase shift
A = (x0-X*cos(theta))/sin(phi); %transient amplitude
x = A*exp(-zeta.*wn.*t).*sin(wd.*t+phi) + X.*cos(w.*t-theta); %underdamped displacement response

%Plotting new response
figure(3)
hold on
plot(t,x);
xlabel('Time (s)');
ylabel('Displacement (m)');
title('New Response');
yline(cons,'r--');
legend('Response','Maximum Allowable Deflection');