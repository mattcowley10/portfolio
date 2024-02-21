x0 = 0; v0 = 0;

syms t tau
m = 1; k = 1; c = 0; wn = sqrt(k/m); zeta = c/2/m/wn; wd = wn*sqrt(1-zeta^2);

h = 1/(m*wn) .* sin(wd.*(t-tau));

F1 = tau;
F2 = 1;
F3 = 0;

CI1 = F1.*h;
CI2 = F2.*h;
CI3 = F3.*h;

x1 = int(CI1,tau,0,t);
x2 = int(CI1,tau,0,pi) + int(CI2,tau,pi,t);
x3 = int(CI1,tau,0,pi) + int(CI2,tau,pi,2*pi) + int(CI3,tau,2*pi,t);

t = 0:0.01:20;
x1 = subs(x1,t);
x2 = subs(x2,t);
x3 = subs(x3,t);
x1 = double(x1);
x2 = double(x2);
x3 = double(x3);

x = x1.*(t<pi)+x2.*(t>pi & t<2*pi)+x3.*(t>2*pi);

hold on
figure(1)
plot(t,x)

simOut = sim('Cowley_315Exam2TakeHomeSim3.slx', 'SimulationMode', 'normal',...
    'SaveState','on','StateSaveName','xout','SaveOutput','on',...
    'OutputSaveName','yout','SaveFormat','Dataset');

x = simOut.yout.get('x').Values;
plot(x,'--');