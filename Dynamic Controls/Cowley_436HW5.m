clc; clear all

GpNum = 20;
GpDen = [1 5 16];
Gp = tf(GpNum,GpDen);

Kc = tf(5);

GcNum = [1 20.1 2];
GcDen = [1 0];
Gc = tf(GcNum,GcDen);

HyNum = 1;
HyDen = [0.001 5];
Hy = tf(HyNum,HyDen);

YR = feedback(Kc*Gc*Gp,Hy,-1)

ER = feedback(1,Kc*Gc*Gp*Hy,-1)

UR = feedback(Kc*Gc,Gp*Hy,-1)

YV = feedback(1,Hy*Kc*Gc*Gp,1)

EV = feedback(Hy,Kc*Gc*Gp,1)