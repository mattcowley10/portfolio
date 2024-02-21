close all; clear all;
s = tf('s');

%PID Controller 1
    tr = 0.85;
    Mp = 5.5;
    
    wn = 1.8/tr;
    zeta = -log(Mp/100)/sqrt(pi^2+(log(Mp/100))^2);
    wd = wn*sqrt(1-zeta^2);
    sd = -wn*zeta+wd*1i;
    Gp = (s+8)/(s*(s+2)*((s+10)^2+0.5^2));
    GpSD = (sd+8)/(sd*(sd+2)*((sd+10)^2+0.5^2));
    
    %PI Design
%         hold on
%         rlocus(Gp)
        zi = 0.01;
        Gi = (s+zi)/s;
        GiSD = (sd+zi)/sd;
%         rlocus(Gi*Gp)
%         hold off

    %PD Design
        alpha = pi - angle(1/GpSD);
        zc = abs(real(sd))+imag(sd)/atan(alpha);
        Gd = s+zc;
        GdSD = sd+zc;

    %Gain Calculation
        K = abs(1/(GpSD*GiSD*GdSD));
    
    %Controller TF
        Gc = K*Gd*Gi

    %Step Response and Info
        Gl = (Gc*Gp)/(1+Gc*Gp);
        step(Gl,6)
        stepinfo(Gl)