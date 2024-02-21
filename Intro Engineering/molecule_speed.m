% Exercise 2.2
% Calculates the speed of a molecule given a certain molecular weight and
% temperature using eq. (1.5)
% Precondition: Must define the molecular weight of the molecule (MW) in
%               amu as well as the temperature of the system in Celcius
%               (T).
% Postcondition: Results in the speed of the molecule in meters per second
%

% Definition of R gas constant and Avogadro's number Navo
R = 8.134;
Navo = 6.022e+23;

% Definition of constant Kb
Kb = R / Navo;

% Conversion from Celcius to Kelvin
T = 273.15 + T;

% Calculation of the numerator in the speed eq.
numerator = 3 * Kb * T;

% Calculation of the fraction underneath the sqrt
fraction = numerator / MW;

% Final speed calculation in m/s
speed = sqrt(fraction)