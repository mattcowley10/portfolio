close all; clear all;
s = tf('s');

%PID Controller 1
    tr = 0.1;
    Mp = 7.5;
    
    wn = 1.8/tr;
    zeta = -log(Mp/100)/sqrt(pi^2+(log(Mp/100))^2);
    wd = wn*sqrt(1-zeta^2);
    sd = -wn*zeta+wd*1i;
    Gp = (s+100)/((s+7.5)*(s+15)*(s+30)*(s+60)*(s+120));
    GpSD = (sd+100)/((sd+7.5)*(sd+15)*(sd+30)*(sd+60)*(sd+120));
    
    %PI Design
        hold on
        rlocus(Gp)
        zi = 5.67;
        Gi = (s+zi)/s;
        GiSD = (sd+zi)/sd;
        rlocus(Gi*Gp)
        hold off

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
        step(Gl)
        stepinfo(Gl)