k2 = 10;
k1 = 10;
m1 = 2;
m2 = 1;
c1 = 1;

s = tf('s');
sys = -k2/((m2*s^2-k2)*(m1*s^2+c1*s+k1-k2)-k2^2);

figure(1)
step(sys)