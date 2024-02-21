close all; clear all;
m1 = 75; m2 = 100; m3 = 3000; k1 = 10000; k2 = 20000;

M = [m1 0 0; 0 m2 0; 0 0 m3];
K = [k1 -k1 0;-k1 k1+k2 -k2; 0 -k2 k2];

x0 = zeros(3,1);
v0 = [0;0;1];

InvSqM = inv(sqrt(M));
Ktild = InvSqM*K*InvSqM;

[e_vec, e_val] = eig(Ktild);
[lambda, I] = sort(diag(e_val));

wn = sqrt(lambda);
D = diag(lambda);

P = e_vec(:,I);

S = InvSqM * P;
invS = inv(S);

r0 = invS * x0;
rd0 = invS * v0;

n = 3;

t = 0:0.01:5;

for ii = 1:n
    r(ii,:) = sqrt((r0(ii))^2 + (rd0(ii))^2/wn(ii)) .* sin(wn(ii).* t + atan2(wn(ii)*r0(ii),rd0(ii)));
end

x = S*r;

figure(1)
plot(t,x);
title('Undamped Response of a Three-Degree-of-Freedom System');
ylabel('Displacement (m)');
xlabel('Time (s)');
legend('Torque Converter','Transmission','Vehicle');