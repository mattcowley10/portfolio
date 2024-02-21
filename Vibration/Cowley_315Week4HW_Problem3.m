k = 100; m =10; %system values
x0 = 0; v0 = 10; %initial values
x1 = 2; %desired response

%Calculations to solve for damping ratio graphically
wn = sqrt(k/m);
zeta = [0:0.0001:1];
A = (v0/wn) .* exp(-(zeta./sqrt(1-zeta.^2)).*atan(sqrt(1-zeta.^2)./zeta));

%Graphing relationship between damping ratio and amplitude
figure(1)
plot(zeta,A);
yline(2);
xline(zeta(3546));
title('Solving for Damping Ratio, Grid Search Method');
ylabel('Amplitude (mm)');
xlabel('Damping Ratio');

%Indexing damping ratio as a constant to graph response plot
zeta1 = zeta(3546);
wd = wn * sqrt(1-zeta1^2);
A1 = (1/wd) .* sqrt((v0 + zeta1*wn*x0)^2 + (x0*wd)^2);
t = [0:0.01:5];
phi = atan((x0 * wd)/(v0 + zeta1 * wn * x0));
x = A1 .* exp(-zeta1 .* wn .* t) .* sin(wd .* t + phi);
envelope1 = A1 .* exp(-zeta1 .* wn .* t);
envelope2 = -A1 .* exp(-zeta1 .* wn .* t);

%Plotting damped response from zero to five seconds
figure(2)
hold on
plot(t,x);
plot(t,envelope1,'r--');
plot(t,envelope2,'r--');
title('Vibrating Response of an Underdamped System');
xlabel('Time (s)');
ylabel('Displacement (mm)');
legend('Damped System','Envelope','Envelope');