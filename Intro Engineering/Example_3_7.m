% Computing the nth Fibonacci number
% Precondition: n, the value of the desired Fibonacci number (n>2)
% Postcondition: ans and Fi contain the value of the nth Fibonacci number
%

F1 = 1; %F(i-2)
F2 = 1; %F(i-1)
for i = 3:n
    Fi = F2 + F1;
    % now thinking about what I need for (i + 1)
    prev_1 = Fi; % current i will be i-1
    prev_2 = F2; % current i-1 will be i-2
    F1 = prev_2;
    F2 = prev_1;
end
ans = Fi