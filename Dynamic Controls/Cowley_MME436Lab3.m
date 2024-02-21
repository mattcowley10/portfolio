%Defining Constants
J = 0.01; %kg*m^2
b = 0.1; %N*m*s
K = 0.01; %N*m/A
R = 1; %Ohm
L = 0.5; %Henry

%Task 1: Determining TF of a DC Motor Velocity Servo

s = tf('s');
sys = K/(J*L*s^2 + (J*R+b*L)*s + (b*R+K^2));

%Task 2
%Determining the Poles and Zeroes of the TF
openPoles = pole(sys)
openZeros = zero(sys)

%Displaying poles and Zeroes in the Complex Plane
figure(1)
pzmap(sys)
title('Poles and Zeros for Open Loop System')

%Plotting Root Locus of the TF
figure(2)
rlocus(sys)
title('Root Locus for Open Loop System')

%Task 3
%Converting Open Loop System to a Closed Loop System
clsys = feedback(sys,1)

%Task 4
%Computing Step Response and System Specs
figure(3)
step(sys)
title('Open Loop Step Response')
openInfo = stepinfo(sys)

%Task 5
%Model Closed Loop System (P Control)

Kp = 100;
clsys = feedback(sys*Kp,1)

figure(4)
step(clsys)
title('P Control Step Response')

figure(5)
pzmap(clsys)
title('Poles and Zeros for P Control System')
pInfo = stepinfo(clsys)

%Model Closed Loop System (PD Control)
Kp = 100;
Kd = 10;
clsys = feedback(sys*(Kp+Kd*s),1)

figure(6)
step(clsys)
title('Step Response for PD Control System')

figure(7)
pzmap(clsys)
title('Poles and Zeros for PD Control System')

pdInfo = stepinfo(clsys)

%Model Closed Loop System (PI Control)
Kp = 100;
Ki = 0.01;
clsys = feedback(sys*(Kp+Ki/s),1)

figure(8)
step(clsys)
title('Step Response of PI Control System')

piInfo = stepinfo(clsys)

figure(9)
pzmap(clsys)
title('Poles and Zeros of PI Control System')

%Model Closed Loop System (PID Control)
Kp = 2000;
Kd = 500;
Ki = 10;
clsys = feedback(sys*(Kp+Kd*s+Ki/s),1)

figure(10)
step(clsys)
title('Step Response of PID Control System')

figure(11)
pzmap(clsys)
title('Poles and Zeros of PID Control System')

pidInfo = stepinfo(clsys)