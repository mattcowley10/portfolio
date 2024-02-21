%Case 1 Initial Conditions
x01 = 1; %mm
%Case 2 Initial Conditions
x02 = -1; %mm
v0 = 0; %mm/s

m = 1; %kg
k = 4; %N/m

wn = sqrt(k/m);
per = 2 * pi / wn;

t = 0:0.1:2*per;

%Case 1
A1 = (1/wn) * sqrt(wn^2 * x01^2 + v0^2);
%Case 2
A2 = (1/wn) * sqrt(wn^2 * x02^2 + v0^2);

phi1 = atan(wn * x01 / v0);
phi2 = atan(wn * x02 / v0);

x1 = A1 * sin(wn * t + phi1); 
x2 = A2 * sin(wn * t + phi2); 

close all;
hold on
title("SDOF Undamped Spring-Mass System");
ylabel("Displacement (mm)");
xlabel("Time (s)");
plot(t, x1,'DisplayName','Case 1')
plot(t, x2,'DisplayName','Case 2')
hold off
legend('Location','east')