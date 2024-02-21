%Poles of QUBE-Servo (negative-unity feedback)
K = 25;
tau = 0.1;

syms s
charEQ = s^2 + 1/tau*s + K/tau;
s = solve(charEQ,s);
s = double(s)

%Predicted Natural Frequency
wn = sqrt(K/tau)

%Predicted Steady State Gain
Khat = K/wn^2/tau

%Predicted Damping Ratio
zeta = 1/(2*wn*tau)

%Predicted Peak Time
wd = wn*sqrt(1-zeta^2);
tp = pi/wd

%Predicted Percent Overshoot
OS = 100*exp(-(pi*zeta)/sqrt(1-zeta^2))

%Estimation of Steady State Gain, Damping Ratio, and Natural Frequency from
%measured peak time and overshoot
tpMeasured = 0.23;
osMeasured = 35.47;

wnEstimate = 1.8/tp
zetaEstimate = (-log(osMeasured/100))/sqrt(pi^2+(log(osMeasured/100)^2))
kHatEstimate = K/tau/wnEstimate^2

gainError = abs(kHatEstimate-Khat)/Khat*100
dampError = abs(zetaEstimate-zeta)/zeta*100
wnError = abs(wnEstimate-wn)/wn*100