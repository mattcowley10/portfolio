theta = 1:1:90;
radiusAfterRelease = 10000./(32.2 .* theta);
radiusAtApex = (10000 .* ((cos(theta)).^2)) ./ 32.2;

subplot(2,1,1);
plot(theta, radiusAfterRelease);
xlabel("Angle (degrees)");
ylabel("Radius of Curvature (feet)");
title("Ball Trajectory Part B");

subplot(2,1,2);
plot(theta, radiusAtApex);
xlabel("Angle (degrees)");
ylabel("Radius of Curvature (feet)");
