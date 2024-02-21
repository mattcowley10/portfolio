%
% Update the number of cars in Albany and Boston over the course of 52
% weeks.
% Precondition: you must assign the initial number of cars in Albany and
%               Boston to variables a and b, respectively.
% Postcondition: Now, a and b have been modified to show the number of cars
%                moved after 1 year.
%

clf
hold on

for i = 1:52
    car_update
    plot(i, a, 'ro')
    plot(i, b, 'bd')
end

xlabel('Week')
ylabel('Number of Cars')
xlim([0,52])
title('Example 3.2')
legend('Albany', 'Boston')
