m = 1007; k = 400000; c = 20000; Y = 0.01; wb = 5.8;%system parameters
x0 = 0; v0 = 0.1; %initial conditions

t = 0:0.01:10; %time

simOut = sim('Cowley_315Week8HWSim.slx',t);

x = simOut.yout.get('x').Values;

figure(1)
hold on
plot(x);
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Reponse of a SDOF Spring, Mass, Damper System');

maxResp = max(x)