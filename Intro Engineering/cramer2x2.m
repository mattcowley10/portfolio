function x = cramer2x2(A,b)

A = zeros(2);
b = zeros(2,1);  
[m,n] = size(A);  
x = zeros(m,1);  
for i = 1:m
    T = A ;
    T(i,:) = b ;
    x(i) = det(T)/det(A) ;
end

end