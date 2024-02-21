close all; clear all; clc;
%%%%%%%%%%%%%%%% System Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = 9; %[kg]
ma = 1; %[kg]
k = 24; %[N/m]

%%%%%%%%%%%%%%%% Design of an Undamped Vibration Absorber %%%%%%%%%%%%%%%%
wp = sqrt(k/m);
wa = wp;

ka = wa^2*ma;

beta = wa/wp;
mu = ma/m;
w = 0:0.01:2*wp;
r = w./wa;

magUndamped = abs((1-w.^2./wp^2)./...
    ((1+mu*(beta)^2-(w./wp).^2).*(1-(w./wp).^2)-mu*(beta)^2));

%%%%%%%%%%%%%%%% Optimally Tuned Absorber %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beta = 1/(1+mu);
zeta = sqrt((3*mu)/(8*(1+mu)^3));

magTuned = abs(sqrt(((2.*zeta.*r).^2+(r.^2-beta^2).^2)./...
    ((2.*r.*zeta).^2.*(r.^2-1+mu.*r.^2).^2+(mu.*r.^2.*beta^2-(r.^2-1).*(r.^2-beta^2)).^2)));

%%%%%%%%%%%%%%%% No Absorber %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ma = 0;
mu = ma/m;
magNoAbs = abs((1-w.^2./wp^2)./...
    ((1+mu*(beta)^2-(w./wp).^2).*(1-(w./wp).^2)-mu*(beta)^2));

%%%%%%%%%%%%%%%% Plot %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
ylim([0 8]);
hold on
plot(r,magUndamped);
plot(r,magNoAbs);
plot(r,magTuned);
title('Comparison of Vibration Absorption Cases');
ylabel('Transmissibility, |Xk/F0|')
xlabel('Frequency Ratio, r');
legend('Undamped Absorber','No Absorber','Optimally Tuned Absorber');
