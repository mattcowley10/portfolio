%Part A
theta = 45;
g = 9.82;
v_initial = 100;
time = 0:0.01:20;

velocity_x = v_initial * cos(theta);
velocity_y = v_initial * sin(theta);

x = velocity_x .* time;
y = velocity_y .* time - 0.5 * g .* time.^2;

hold on;
plot(x,y)
ylabel("Height (feet)");
xlabel("Distance (feet)");
title("Week 2 Homework #3 Ball Trajectory");
yline(0);
