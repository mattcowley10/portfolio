% Exercise 2.1 Part b
% Uses Antoine's equation to calculate temperature at a given
% vapor pressure.
% Precondition: Make sure constants, A, B, and C are predetermined and
%               that the variable Psat contains your vapor pressure in
%               mmHg.
% Postcondition: The temperature at the predetermined vapor pressure will
%                be given at a range of units. (Celcius, Kelvin)

% Calculating the denominator of the fraction in the Antoine Eq.
denominator =  A - log10(Psat);

% Value of the whole fraction
fraction =  B / denominator;

%Value of Temp. in Celcius
Tsat_Celcius = fraction - C

%Kelvin
Tsat_Kelvin = Tsat_Celcius + 273.15
