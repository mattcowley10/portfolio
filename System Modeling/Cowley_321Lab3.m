Ra = 8.4; La = 0.0016; kb = 0.042; kt = 0.042; Jm = 4e-6; md = 0.053;
rd = 0.0248; d = 0; vt = 3; %system parameters

Jl = 0.5 * md * rd^2;
J = Jl + Jm; %total inertia of mechanical system

%Simulate Model
simOut = sim('Cowley_321Lab3Sim.slx', 'SimulationMode', 'normal',...
    'SaveState','on','StateSaveName','xout','SaveOutput','on',...
    'OutputSaveName','yout','SaveFormat','Dataset');

%Get output variables
current = simOut.yout.get('i').Values;
angularVelocity = simOut.yout.get('w').Values;

figure(1)
plot(current)
xlim([0 1])
xlabel('Time (s)');
ylabel('Current (A)');
title('Armature Current when 3V Input is Applied to a DC Motor')

figure(2)
plot(angularVelocity)
xlim([0 1])
xlabel('Time (s)');
ylabel('Angular Velocity (rad/s)');
title('Angular Velocity when 3V Input is Applied to a DC Motor')