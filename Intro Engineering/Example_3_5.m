% Calculating the factorial of a number n
% Precondition: n, the number you wish to compute the factorial of
% Postcondition: ans and n_fact will contain the value of factorial n
%

n_fact = 1;
for i = 2:n
    n_fact = n_fact * i;
end
ans = n_fact