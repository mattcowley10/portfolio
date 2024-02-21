clear; clc;
%Problem 2.2
s = tf('s');
Gp2 = 1/((s+1)*(s+2)*(s^2+5*s+15));
sd = -0.318+2.34i;
Gp2 = 1/((sd+1)*(sd+2)*(sd^2+5*sd+15));
Gp2 = abs(Gp2);
Kp2 = double(1/Gp2)

%Problem 2.3
Gp3 = 25/(s*(0.1*s+1));
sd = -5+0.277i;
Gp3 = 25/(sd*(0.1*sd+1));
Gp3 = abs(Gp3);
Kp3 = double(1/Gp3)

%Problem 2.4
Gp4 = (s+100)/((s+7.5)*(s+15)*(s+30)*(s+60)*(s+120));
sd = -3.8+16.5i;
Gp4 = (sd+100)/((sd+7.5)*(sd+15)*(sd+30)*(sd+60)*(sd+120));
Gp4 = abs(Gp4);
Kp4 = double(1/Gp4)

%Problem 3.2
Gp2 = 1/((s+1)*(s+2)*(s^2+5*s+15));
sd = -0.5+5i;
Gp2 = 1/((sd+1)*(sd+2)*(sd^2+5*sd+15));
alpha2 = pi-angle(Gp2)
Zc2 = 0.5+5/tan(alpha2)
Kd2 = abs((1/((sd+Zc2)*Gp2)))
Gc2 = Kd2*(s+Zc2)

%Problem 3.3
Gp3 = 25/(s*(0.1*s+1));
sd = -8+i;
Gp3 = 25/(sd*(0.1*sd+1));
alpha3 = pi-angle(Gp3)
Zc3 = 8+1/tan(alpha3)
Kd3 = double(abs((1/((sd+Zc3)*Gp3))))
Gc3 = Kd3*(s+Zc3)

%Problem 3.4
Gp4 = (s+100)/((s+7.5)*(s+15)*(s+30)*(s+60)*(s+120));
sd = -2.5+50i;
Gp4 = (sd+100)/((sd+7.5)*(sd+15)*(sd+30)*(sd+60)*(sd+120));
alpha4 = pi-angle(Gp4)
Zc4 = 2.5+50/tan(alpha4)
Kd4 = abs((1/((sd+Zc4)*Gp4)))
Gc4 = Kd4*(s+Zc4)