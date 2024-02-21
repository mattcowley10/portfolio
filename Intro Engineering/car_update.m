%
% Update the number of cars in Albany and Boston from one week to the next.
% Precondition: you must assign the number of cars in Albany and Boston at
%               the start of the week to a and b, respectively.
% Postcondition: a and b have been modified to reflect the number of cars
%                that moved during the week.
%

% First we calculate the number of cars gained/lost in Boston
%   5% of the cars in Albany (a) are dropped off in Boston (b)
%   3% of the cars in Boston (b) are dropped off in Albany (a)
atob = round(0.05*a) - round(0.03*b);
% Now updating the cars in each location
% (conservation of cars)
b = b + atob
a = a - atob