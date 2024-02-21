%
% Calculating the value of the series Ai from 1 to 10 with each element of
% the sequence computed directly.
% Precondition: none
% Postcondition: at the conclusion of the loop total and ans will contain
%                the value of the sum.

a1 = 1;
total = 0;
for i = 1:10
    a = a1 * 0.5 ^ (i-1);
    total = total + a;
end
ans = total