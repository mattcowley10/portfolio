r = 0.02;
l = 0.08;
h = 0.038;
theta = 0:360;
omega1 = 1000;
omega2 = 3000;
omega3 = 5000;

vSlider1 = r .* omega1 .* (cosd(theta) - (sind(h - r .* cosd(theta)) ./ sqrt(l^2 - (h - r .* cosd(theta)).^2)));
vSlider2 = r .* omega2 .* (cosd(theta) - (sind(h - r .* cosd(theta)) ./ sqrt(l^2 - (h - r .* cosd(theta)).^2)));
vSlider3 = r .* omega3 .* (cosd(theta) - (sind(h - r .* cosd(theta)) ./ sqrt(l^2 - (h - r .* cosd(theta)).^2)));

hold on
plot(theta, vSlider1)
plot(theta, vSlider2)
plot(theta, vSlider3)
yline(0)
xlim([0 360]);

title("Slider-Crank Mechanism: How Slider Velocity Changes with Angle at Different Angular Velocities");
ylabel("Slider Velocity (m/s)");
xlabel("Angle with Horizontal (degrees)");
legend("1000 RPM","3000 RPM","5000 RPM",'Location','best');