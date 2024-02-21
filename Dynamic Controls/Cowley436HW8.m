s = tf('s');

G1 = tf(1,[1 8 15]);
G2 = tf([1 10],[1 8 15]);
G3 = tf([1 3],[1 8 0 0]);
G4 = tf([1 3],[1 8 0 0 0]);
G5 = tf([1 6 9],[1 28 20 0 0]);

figure(1)
rlocus(G1)

figure(2)
rlocus(G2)

figure(3)
rlocus(G3)

figure(4)
rlocus(G4)

figure(5)
rlocus(G5)
