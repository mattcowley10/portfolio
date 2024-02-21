m = 7.5;
k = 0.295;
g = 9.81;
theta = 0:180;

tangentO = 2 .* m .* g .* cosd(theta);
normalO = 3 .* m .* g .* sind(theta);
totalO = sqrt(tangentO.^2 + normalO.^2);

hold on;

plot(theta, tangentO);
plot(theta, normalO);
plot(theta, totalO);
title("Reactive Forces on a Pendulum Bearing as Angle Increases");
xlabel("Angle (degrees)");
ylabel("Force (N)");
legend("Tangent Reactive Force","Normal Reactive Force","Total Reactive Force", "Location", "best");

hold off;