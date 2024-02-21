%Making Music with MatLab
clear all; close all; clc

F_s = 8000; %Sampling Frequency [Hz]
Ts = 1/F_s;

t = 0:Ts:.5; %Time vector with the sampling interval of Ts

A4 = sin(2*pi*440*t);
B4 = sin(2*pi*493.88*t);
C5 = sin(2*pi*523.25*t);
D5 = sin(2*pi*587.33*t);
E4 = sin(2*pi*329.63*t);
E5 = sin(2*pi*659.25*t);
E6 = sin(2*pi*1318.51*t);
G4 = sin(2*pi*392*t);
G5 = sin(2*pi*783.99*t);
B4f = sin(2*pi*466.16*t);
F5 = sin(2*pi*698.46*t);
F5s = sin(2*pi*739.99*t);
C5s = sin(2*pi*554.37*t);
E5f = sin(2*pi*622.25*t);
E4f = sin(2*pi*311.13*t);

Line1 = [E4 A4 C5 B4 A4 E5 D5 B4];
Line2 = [A4 C5 B4 G4 B4f E4 E4 E4];
Line3 = [A4 C5 B4 A4 E5 G5 F5s F5 C5s];
Line4 = [F5 E5 E5f E4f C5 A4 A4 C5];

youreAWizardHarry = [Line1 Line2 Line3 Line4];

audiowrite('Cowley_HarryPotter.wav',youreAWizardHarry,F_s);