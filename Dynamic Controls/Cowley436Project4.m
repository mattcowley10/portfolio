close all; clear all;
s = tf('s');

%PID Controller 1
    ts = 4;
    tr = 0.15;
    
    wn = 1.8/tr;
    zeta = 4.2/ts/wn;
    wd = wn*sqrt(1-zeta^2);
    sd = -wn*zeta+wd*1i;
    Gp = 1/((s+5)*(s+10)*(s+15));
    GpSD = 1/((sd+5)*(sd+10)*(sd+15));

    %PI Design
        hold on
        rlocus(Gp)
        zi = 0.7;
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