theta = 0:0.05:pi;
g = 32.2;
w = 5;
m = w / g;
normalAccel = 2 * g .* sin(theta);
tanAccel = g .* cos(theta);
magAccel = sqrt(4 * g.^2 .* (sin(theta).^2) + g^2 .* (cos(theta).^2));
velocity = sqrt(6 * g .* sin(theta));
tension = m .* velocity.^2 + w.*sin(theta);

hold on;
plot(theta, normalAccel)
plot(theta, tanAccel)
plot(theta, magAccel)
yline(0);
ylabel("Acceleration (ft/s^2)");
xlabel("Angle (radians)");
title("Acceleration of a 5-Pound Pendulum from Rest");
legend('Normal Accel.','Tangential Accel.','Acceleration Mag.','Location','best');
hold off

figure

hold on
plot(theta, velocity);
yline(0);
xlabel("Angle (radians)");
ylabel("Velocity (ft/s)");
title("Velocity of a 5-Pound Pendulum from Rest");
yline(0);
hold off

figure

hold on
plot(theta, tension);
xlabel("Angle (radians)");
ylabel("Tension (pounds)");
title("Tension of a 5-Pound Pendulum from Rest");
yline(0);
hold off