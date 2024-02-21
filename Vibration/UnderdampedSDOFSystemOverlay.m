clc; clear all;
x0 = 1; v0 = 1; %in mm and mm/s
natFreq = 2;
zeta1 = 0.01;
zeta2 = 0.2;
zeta3 = 0.1;
zeta4 = 0.4;
zeta5 = 0.8;

dampedFreq1 = natFreq * sqrt(1-zeta1^2);
A1 = (1/dampedFreq1) * sqrt((v0 + zeta1 * natFreq * x0)^2 + (x0*natFreq)^2);
phi1 = atan((x0*dampedFreq1)/(v0+zeta1*natFreq*x0));
t = 0:0.1:30;
x1 = A1 .* exp(-zeta1 * natFreq .* t).*sin(dampedFreq1 .* t + phi1);

dampedFreq2 = natFreq * sqrt(1-zeta2^2);
A2 = (1/dampedFreq2) * sqrt((v0 + zeta2 * natFreq * x0)^2 + (x0*natFreq)^2);
phi2 = atan((x0*dampedFreq2)/(v0+zeta2*natFreq*x0));
x2 = A2 .* exp(-zeta2 * natFreq .* t).*sin(dampedFreq2 .* t + phi2);

dampedFreq3 = natFreq * sqrt(1-zeta3^2);
A3 = (1/dampedFreq3) * sqrt((v0 + zeta3 * natFreq * x0)^2 + (x0*natFreq)^2);
phi3 = atan((x0*dampedFreq3)/(v0+zeta3*natFreq*x0));
x3 = A3 .* exp(-zeta3 * natFreq .* t).*sin(dampedFreq3 .* t + phi3);

dampedFreq4 = natFreq * sqrt(1-zeta4^2);
A4 = (1/dampedFreq4) * sqrt((v0 + zeta4 * natFreq * x0)^2 + (x0*natFreq)^2);
phi4 = atan((x0*dampedFreq4)/(v0+zeta4*natFreq*x0));
x4 = A4 .* exp(-zeta4 * natFreq .* t).*sin(dampedFreq4 .* t + phi4);

dampedFreq5 = natFreq * sqrt(1-zeta5^2);
A5 = (1/dampedFreq5) * sqrt((v0 + zeta5 * natFreq * x0)^2 + (x0*natFreq)^2);
phi5 = atan((x0*dampedFreq5)/(v0+zeta5*natFreq*x0));
x5 = A5 .* exp(-zeta5 * natFreq .* t).*sin(dampedFreq5 .* t + phi5);

hold on
plot(t,x1)
plot(t,x2)
plot(t,x3)
plot(t,x4)
plot(t,x5)
title('Underdamped SDOF System with Varying Damping Ratio');
xlabel('Time (s)');
ylabel('Displacement (mm)');
legend('Damping Ratio = 0.01','Damping Ratio = 0.1','Damping Ratio = 0.2','Damping Ratio = 0.4','Damping Ratio = 0.8')