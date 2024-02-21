% Excercise 2.3
% This script uses given data to make a linear interpolation. It only works
% with three given data points given that they have a constant slope.
% Preconditions: Pick three data points and define the outside x-values as
%                x1 and x3. Define y-values as y1 and y2 and y3, respectively, where y2 is
%                the corresponding output to x2. 
% Postconditions: Conducts a linear interpolation and outputs a value x2 that
%                 corresponds to y2 as well as the relationship between the
%                 other values.
%

% Calculates the numerator of the interpolation function
numerator = (y2 - y1) * (x3 - x1);

% Calculates the value of the fraction on the left side of interp. eq.
fraction = numerator / (y3 - y1);

% Calculates the interpolated value of x2
x2 = fraction + x1