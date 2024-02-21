clc; clear all;
v0x = 40; v0y = 0; %initial condition
H = 1.85; m = 0.145; Cd = 0.4; rho = 1.225; A = 0.00426; g = 9.81;%parameter values
ts = 0.1;
tf = 60;

%Simulate Model
simOut = sim('Cowley_321Lab2Sim.slx', 'SimulationMode', 'normal',...
    'SaveState','on','StateSaveName','xout','SaveOutput','on',...
    'OutputSaveName','yout','SaveFormat','Dataset');

%Get output variables
Vx = simOut.yout.get('Vx').Values;
Vy = simOut.yout.get('Vy').Values;
V = simOut.yout.get('||V||').Values;
x = simOut.yout.get('x').Values;
y = simOut.yout.get('y').Values;


%Plots
figure(1)
hold on
plot(Vx)
plot(Vy)
plot(V)
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity of a Baseball over Time')
legend('Horizontal Velocity Comp.','Vertical Velocity Comp.',...
    'Total Velocity');

figure(2)
hold on
plot(x)
plot(y)
ylabel('Position (m)');
xlabel('Time (s)');
title('Position of a Baseball over Time');
legend('Horizontal Position','Vertical Position');