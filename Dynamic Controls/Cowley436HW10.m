clear workspace
s=tf('s');

%PI CONTROLLER #1
sd1 = -4.88+9.39i;
GpSD1 = (sd+8)/((sd+2)*(sd+6)*(sd+10));
alpha1 = pi - angle(GpSD1);
zc1 = real(sd1) + imag(sd1)/tan(alpha1);
GiSD1 = (sd1+zc1)/sd1;
GlSD1 = GiSD1*GpSD1;
Kp1 = abs(-1/GlSD1);
Gc1 = Kp1*(s+zc1)/s

%PI CONTROLLER #2
sd2 = -0.512+2.17i;
GpSD2 = 1/((sd2+1)*(sd2+2)*(sd2^2+5*sd2+15));
alpha2 = pi - angle(GpSD2);
zc2 = real(sd2) + imag(sd2)/tan(alpha2);
GiSD2 = (sd2+zc2)/sd2;
GlSD2 = GiSD2*GpSD2;
Kp2 = abs(-1/GlSD2);
Gc2 = Kp2*(s+zc2)/s

%PI CONTROLLER #3
sd3 = -5+0.35i;
GpSD3 = 25/sd3/(0.1*sd3+1);
alpha3 = pi - angle(GpSD3);
zc3 = real(sd3) + imag(sd3)/tan(alpha3);
GiSD3 = (sd3+zc3)/sd3;
GlSD3 = GiSD3*GpSD3;
Kp3 = abs(-1/GlSD3);
Gc3 = Kp3*(s+zc3)/s

%PI CONTROLLER #4
sd4 = -7.56+10.4i;
GpSD4 = (sd4+100)/((sd4+7.5)*(sd4+15)*(sd4+30)*(sd4+60)*(sd4+120));
alpha4 = pi - angle(GpSD4);
zc4 = real(sd4) + imag(sd4)/tan(alpha4);
GiSD4 = (sd4+zc4)/sd4;
GlSD4 = GiSD4*GpSD4;
Kp4 = abs(-1/GlSD4);
Gc4 = Kp4*(s+zc4)/s

%PID Controller #1
sd = -10+15i;
GpSD = (sd+8)/((sd+2)*(sd+6)*(sd+10));
alpha = pi - angle(GpSD);
zc = real(sd) + imag(sd)/tan(alpha);
GdSD = sd + zc;
Kp = abs(GpSD/GdSD);
Gd = Kp*(s+zc); 

Gi = (s+0.5)/s;

Gc = Gd*Gi

%PID Controller #2
sd = -0.5+5i;
GpSD = 1/((sd+1)*(sd+2)*(sd^2+5*sd+15));
alpha = pi - angle(GpSD);
zc = real(sd) + imag(sd)/tan(alpha);
GdSD = sd + zc;
Kp = abs(GpSD/GdSD);
Gd = Kp*(s+zc);

Gi = (s+0.5)/s;

Gc = Gd*Gi

%PID Controller #3
sd = -8+i;
GpSD = 25/sd/(0.1*sd+1);
alpha = pi - angle(GpSD);
zc = real(sd) + imag(sd)/tan(alpha);
GdSD = sd + zc;
Kp = abs(GpSD/GdSD);
Gd = Kp*(s+zc);

Gi = (s+0.5)/s;

Gc = Gd*Gi

%PID Controller #4
sd = -2.5+50i;
GpSD = (sd+100)/((sd+7.5)*(sd+15)*(sd+30)*(sd+60)*(sd+120));
alpha = pi - angle(GpSD);
zc = real(sd) + imag(sd)/tan(alpha);
GdSD = sd + zc;
Kp = abs(GpSD/GdSD);
Gd = Kp*(s+zc);

Gi = (s+0.5)/s;

Gc = Gd*Gi