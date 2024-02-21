clear, clc;

file = xlsread("AngledRodSim.xlsx");

g = 9.81;
l = 6;
m = 18;
thetaStart = 5;

thetaNum = [5:90];
thetaSim = (360/(2*pi)) .* transpose(file(4:37,19));
angularAccelSim = transpose(file(4:37,11));
angularAccelNum = (3*g/(2*l)) .* sind(thetaNum);
angularVelSim = transpose(file(4:37,5));
angularVelNum = sqrt((3*g/l) .* (cosd(thetaStart) - cosd(thetaNum)));

figure;
hold on;
title("Comparison of Numerical and Experimental Angular Acceleration of a Sliding Rod");
xlabel("Angle (degrees)");
ylabel("Angular Acceleration (rad/s^2)");
plot(thetaSim,angularAccelSim);
plot(thetaNum,angularAccelNum);
legend("Experimental Results","Analytical Results","Location", "northwest");
axis tight;
hold off;

figure;
hold on;
title("Comparison of Numerical and Experimental Angular Velocity of a Sliding Rod");
xlabel("Angle (degrees)");
ylabel("Angular Velocity (rad/s)");
plot(thetaSim,angularVelSim);
plot(thetaNum,angularVelNum);
legend("Experimental Results","Analytical Results","Location", "best");
axis tight;
hold off;