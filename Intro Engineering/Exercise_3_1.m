% Exercise 3.1, building on 2.1
% Creating a plot for Antoine's eq. between log10 of saturated pressure in mmHg and
% 1/temperature in Kelvin
%
% Precondition: Make sure that constants A, B, and C are predetermined.
% Postcondition: A plotted graph of the relationship between log10psat and
% 1/T
%

%Clearing plot
clf
%Holding all points
hold on

for i = 0:100 %Range of temperature inputted
    fraction = B / (i + C); %Calculating value of the fraction
    log10psat = A - fraction; %Final calculation of log10psat
    plot(1/(i+273.15),log10psat,'bo') %Converting Celcius to Kelvin and plotting
end

xlabel('1/T')
ylabel('log10psat')
title('Clayperon Plot of Ethanol')