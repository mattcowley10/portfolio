theta = 0:1:180;
g = 32.2;
normalAccel = 2 * g .* sin(theta);
tanAccel = g .* cos(theta);
magAccel = sqrt(4 * g.^2 .* (sin(theta).^2) + g^2 .* (cos(theta).^2));

hold on;

plot(theta, normalAccel)