% Plotting first 20 Fibonacci numbers
%
% Precondition: none
%
% Postcondition: plot of the first 20 Fibonacci numbers
%

clf;
hold on

F1 = 1; %F(i-2)
F2 = 1; %F(i-1)
for i = 3:20
    Fi = F2 + F1;
    % now thinking about what I need for (i + 1)
    prev_1 = Fi; % current i will be i-1
    prev_2 = F2; % current i-1 will be i-2
    F1 = prev_2;
    F2 = prev_1;
    plot(i,Fi,'ro')
end
xlabel('i')
ylabel('F_i')