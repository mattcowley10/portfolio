%
% Calculating the value of the series Ai from 1 to 10 with each element of
% the sequence computed recurrently.
% Precondition: none
% Postcondition: at the conclusion of the loop total and ans will contain
%                the value of the sum.
%

a = 1;
% Start with total = a1
total = a;
% Then begin loop with a2
for i = 2:10
    a = a/2;
    total = total + a;
end
ans = total