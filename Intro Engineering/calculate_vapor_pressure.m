% Exercise 2.1 Part a
% Uses Antoine's equation to calculate vapor pressure at a given
% temperature.
% Precondition: Make sure constants, A, B, and C are predetermined and
%               that the variable Tsat contains your tempterature in
%               degrees Celcius.
% Postcondition: The vapor pressure at the predetermined temperature will
%                be given at a range of units. (mmHg, atm, and kPa)

% Calculating the fraction in the right side of eq. (1.2)
fraction = B / (Tsat + C);

% Subtracting fraction from A
right_side = A - fraction;
Psat_mmHg = 10^(right_side)
Psat_atm = Psat_mmHg / 760
Psat_kPa = Psat_atm * 101.325