lengthRailing = 46/12/3.6; %Length of Railing (inches->m)
timeTarget = 10; %Desired Time for Operation (s)
linVelocity = lengthRailing/timeTarget; %Target Shutter Velocity (m/s)
dOut = 2/12/3.6; %Diameter of Rolling Shutter Shaft (inches->m)
r = dOut/2; %Radius of Rolling Shutter Shaft (m)
wShaftRadS = (linVelocity/r); %Angular Velocity of Shaft (rad/s)
wShaftRPM = wShaftRadS/(2*pi)*60; %Angular Velocity of Shaft (RPM)

gearRat = 2; %Desired Gear Ratio
dMotor = dOut/gearRat; %Diameter of Motor Pinion (m)
motorSpeedRadS = gearRat*wShaftRadS; %Motor Speed (rad/s)
motorSpeedRPM = gearRat*wShaftRPM; %Motor Speed

%Gear Variables
maxMotorSpeed = 250; %Max Motor Speed (rpm)
motorGearDia = 1/12/3.6; %Motor Gear Pitch Diameter (inches->m)
shaftGearDia = 2/12/3.6; %Shaft Gear Diameter (inches->m)

%Shutter Speed Calculations
maxMotorSpeed = maxMotorSpeed*2*pi/60; % rpm->rad/s
maxShaftAngSpeed = maxMotorSpeed*motorGearDia/shaftGearDia; %Max Shaft Angular Speed (rad/s)
shutterVel = (maxShaftAngSpeed*shaftGearDia/2)*3.6*12; %Max Shutter Velocity (m/s->in/s)