%Performs Cramer's Rule for 3x3 matrix

function x=cramer(A,b)
% x = solution vector
% A = square input matrix
% b = constant input vector
[m,n]=size(A);
[m,p]=size(b);

if m~=3 || n~=3
    error('Input matrix must be 3x3')
end

if p~=1
    error('Constant matrix must be 3x1')
end

d=det(A);

a1=zeros(3,3);
a1(1:3,2:3)=A(1:3,2:3);
a1(1:3,1)=b

a2=zeros(3,3);
a2(1:3,1)=A(1:3,1);
a2(1:3,3)=A(1:3,3);
a2(1:3,2)=b

a3=zeros(3,3);
a3(1:3,1:2)=A(1:3,1:2);
a3(1:3,3)=b

d1=det(a1);
d2=det(a2);
d3=det(a3);

x1=d1/d;
x2=d2/d;
x3=d3/d;

x=[x1;x2;x3];