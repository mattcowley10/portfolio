%Computing the nth Fibonacci number using equation 2.1
%Precondition: you must assign a value to n before running this script
%Postcondition: the result is stored in ans

s5 = sqrt(5);
t1 = (1 + s5) / 2;
t2 = (1 - s5) / 2;
dfib = t1^n - t2^n;
ans = dfib / s5