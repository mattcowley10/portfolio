clc; clear all;

syms Ei R1 C1 R2 C2 s

A=[(R1+(1/(s*C1))) -1/(s*C1); -1/(s*C1) (R2+(1/(s*C1)+(1/(s*C2))))];
B=[Ei;0];

num(:,1) = A(:,1);
num(:,2) = B;

I2 = det(num)/det(A);

Eo = simplify((1/(s*C2))*I2);
TF = Eo/Ei

% kt = 2; %N-m/amp
% J = 3; %N-m-s^2/rad
% b = 0.45; %N-m-s/rad
% Ra = 5.5; %Ohms
% 
% s = tf('s');
% sys = kt/(Ra*J*s+Ra*b+kt^2);
% poles = pole(sys)
% zeros = zero(sys)
% pzmap(sys)
% step(sys,10)
