% Calculating sin(x) using a Taylor Series expansion
%
% Precondition: x in radians, where x is the value that you would like to
%               compute the sin of, and n, the number of terms in the Taylor Series
%               expansion.
% Postcondition: The value of sin(x) using n terms in the series will be
%                stored to taylor_ans, and the result using MATLAB's built in function
%                will be stored in ans_matlab. I will also plot the value of  sin(x) vs
%                the  terms in the sum.
%

% Start by clearing the figure
clf
% Don't clear my graph when I add a new plot
hold on

% My Taylor Series accumulator
taylor_ans = 0;

for i = 0:n
    % We will use 2i+1 twice, so let's precompute
    dum = 2*i + 1;
    % Computing the factorial of 2i+1
    % Note that when i = 0, it won't perform the for loop. This is ok since
    % the factorial of 1 is 1.
    n_fact = 1;
    for j = 2:dum
        n_fact = n_fact * j;
    end
    % Calculating the ith Taylor term
    taylor_term = (-1)^(i)*x^(dum)/n_fact;
    % Updating my Taylor sum
    taylor_ans = taylor_ans + taylor_term;
    plot(i, taylor_ans, 'ro')
end
%Labels
xlabel('n')
ylabel('sin(x)')

taylor_ans
ans_matlab = sin(x)