% Exercise 3.2, building on 2.2
% Building a plot that compares the molecule speed between water and
% ethanol at temperatures between 0 and 100 degrees Celcius
%
% Precondition: none
%
% Postcondition: a plot that shows a comparison between the molecular
%                speeds of water and ethanol at different temperatures
%

% Clearing and holding
clf
hold on

%Defining constants
R = 8.314;
Navo = 6.022e+23;
Kb = R / Navo;
MWwater = 18;
MWethanol = 46;
m_water = MWwater / Navo;
m_ethanol = MWethanol / Navo;

for i = 0:100 %Loop for plot of water, input values
    K = i + 273.15; %Conversion to Kelvin for computation
    numerator = 3 * Kb * K;
    fraction_water = numerator / m_water;
    speed_water = sqrt(fraction_water);
    
    %Loop for plot of ethanol
    fraction_ethanol = numerator / m_ethanol;
    speed_ethanol = sqrt(fraction_ethanol);
    
    %Plot for data points
    plot(i,speed_water,'ro')
    plot(i,speed_ethanol,'bd')
end

xlabel('Temperature (C)')
ylabel('Speed (m/s)')
title('Molecular Speeds of Different Species')
legend('Water', 'Ethanol')