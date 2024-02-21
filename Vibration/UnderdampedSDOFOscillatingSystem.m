clc; clear all;
c = 2; k = 2400; x0 = 20; v0 = 0; %in mm and mm/s
natFreq = sqrt(k);
dampingRat = c/2/natFreq;
dampedFreq = natFreq * sqrt(1-dampingRat^2);
A = (1/dampedFreq) * sqrt((v0 + dampingRat * natFreq * x0)^2 + (x0*natFreq)^2);
phi = atan((x0*dampedFreq)/(v0+dampingRat*natFreq*x0));
t = 0:0.01:3;

x = A .* exp(-dampingRat * natFreq .* t).*sin(dampedFreq .* t + phi);
envelope1 = A .* exp(-dampingRat * natFreq .* t);
envelope2 = -A .* exp(-dampingRat * natFreq .* t);

hold on
plot(t,x)
plot(t,envelope1,'--')
plot(t,envelope2,'--')
title('Underdamped SDOF System');
xlabel('Time (s)');
ylabel('Displacement (mm)');
legend('Displacement','Decaying Envelope','Decaying Envelope');