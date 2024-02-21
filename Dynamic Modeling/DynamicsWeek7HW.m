%Variable Definitions and Unit Conversions
wp = 50;
g = 32.2;
mp = wp / g;
wb = 2 / 16;
mb = wb / g;
L = 6;
bulletSpeed = 1000 * 5280 / 3600;

%Part A Vectors
speedVectorMPH = 0:0.5:2300;
speedVectorFtPerSec = speedVectorMPH * 5280 / 3600;

%Part B Vectors
boxWeightVector = 25:0.5:75;
boxMassVector = boxWeightVector/32.2;

%Part C Vectors
lengthVector = 3:0.1:9;

%A
initialVelocityA = (mb / (mb + mp)) .* speedVectorFtPerSec;
maxAngleA = acosd(1 - (initialVelocityA.^2 / g / L));
subplot(3,1,1);
plot(speedVectorMPH,maxAngleA)
title("Part A: How Max Angle Changes in Relation to Bullet Velocity");
ylabel("Angle (degrees)");
xlabel("Bullet Speed (MPH)");
axis([0 2300 0 55]);

%B
combinedMass = boxMassVector + mb;
initialVelocityB = mb * bulletSpeed ./ combinedMass;
maxAngleB = acosd(1 - initialVelocityB.^2 / (g * L));
subplot(3,1,2);
plot(boxWeightVector,maxAngleB);
title("Part B: How Max Angle Changes in Relation to Box Weight");
ylabel("Angle (degrees)");
xlabel("Box Weight (lbs.)");

%C
initialVelocityC = mb * bulletSpeed / (mb + mp);
maxAngleC = acosd(1 - initialVelocityC .^ 2 ./ (g .* lengthVector));
subplot(3,1,3);
plot(lengthVector, maxAngleC);
title("Part C: How Max Angle Changes in Relation to Cable Length");
ylabel("Angle (degrees)");
xlabel("Cable Length (feet)");