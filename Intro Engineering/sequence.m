%
% Calculating the value of Ai+1 = Ai/2 where A1 = 1 both directly and
% recurrently. The recurrent calculation will not be printed, but used to
% check the correctness of the direct calculations. 
% Precondition: none
% Postcondition: at the conclusion of the loop, a will contain the value
%                of A10.
%

% a1 for use in direct calculations
a1 = 1;
% initial value of b for recurrent calculations
b = 1; 

for i = 2:10
    b = b/2;
    a = a1*0.5^(i-1)
    % Checking that both compute the same value
    check = b - a
end
    