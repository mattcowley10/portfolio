clear all; close all;
M = [1 0;0 4];
K = [3 -1;-1 1];

x0 = [0.1;1];
v0 = [0;0];

zeta = [0.3;0.3];

InvSqM = inv(sqrt(M));
Ktild = InvSqM*K*InvSqM;

alpha = 0.175321;
beta = 0.328589;

propC = alpha*M + beta*K;

[e_vec, e_val] = eig(Ktild);
[lambda, I] = sort(diag(e_val));

wn = sqrt(lambda);
D = diag(lambda);

P = e_vec(:,I);

S = InvSqM * P;
invS = inv(S);

r0 = invS * x0;
rd0 = invS * v0;

n = 2;

t = 0:0.01:20;

for ii = 1:n
    undampedR(ii,:) = sqrt((r0(ii))^2 + (rd0(ii))^2/wn(ii)) .* sin(wn(ii).* t + atan2(wn(ii)*r0(ii),rd0(ii)));
    
    wd(ii) = wn(ii)*sqrt(1-zeta(ii)^2);
    A(ii) = sqrt(((rd0(ii)+zeta(ii)*wn(ii)*r0(ii))^2 + (r0(ii)*wd(ii))^2)/wd(ii)^2);
    phi(ii) = atan2(r0(ii)*wd(ii),rd0(ii)+zeta(ii)*wn(ii)*r0(ii));
    
    dampedR(ii,:) = A(ii).*exp(-zeta(ii).*wn(ii).*t).*sin(wd(ii).*t+phi(ii));
end

undampedX = S*undampedR;
dampedX = S*dampedR;

figure(1)

subplot(2,1,1)
plot(t,undampedX);
title('Undamped Response of a Two-Degree-of-Freedom System');
ylabel('Displacement (m)');
xlabel('Time (s)');
legend('Mass 1','Mass 2');

subplot(2,1,2)
plot(t,dampedX);
title('Damped Response of a Two-Degree-of-Freedom System');
ylabel('Displacement (m)');
xlabel('Time (s)');
legend('Mass 1','Mass 2');