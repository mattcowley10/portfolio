function x = myGaussSeidel(A,b,maxit,es)
% Input
% A = coefficient matrix
% b = right hand side vector
% es = stopping criterion (default = 50)
% maxit = maximum number of iterations
% Output
% x = solution vector

if nargin<2 %default nargin
    error ('at least 2 input arguments required')
end

if nargin<3 || isempty(maxit) %default nargin for max # of iterations
    maxit=100;
end

if nargin<4 || isempty(es) %default nargin for stopping error
    es=0.00001;
end

[m,n] = size(A); %defines size of coefficient matrix

if m~=3 || n~=3
    error('Matrix A must be 3x3') % displays error message if matrix is not  3x3
end

x=zeros(3,1);
iter=0;% initial number of iterations

iter1=1:maxit;
x1iter=zeros([1 maxit]);
x2iter=zeros([1 maxit]);
x3iter=zeros([1 maxit]);
xe=zeros([3 maxit]);

for i=1:maxit
    iter=iter+1;
    xold=x;
    x(1,1)=(b(1,1)-(A(1,2)*x(2,1))-(A(1,3)*x(3,1)))/(A(1,1));%Gauss Seidel formula for x1
    x1iter(1,i)=x(1,1)
    x(2,1)=(b(2,1)-(A(2,1)*x(1,1))-(A(2,3)*x(3,1)))/(A(2,2));%Gauss Seidel formula for x2
    x2iter(1,i)=x(2,1)
    x(3,1)=(b(3,1)-(A(3,1)*x(1,1))-(A(3,2)*x(2,1)))/(A(3,3));%Gauss Seidel formula for x3
    x3iter(1,i)=x(3,1)
    
    if x~=0
        ea=((abs(x-xold))./(abs(x))).*100;  %error approxmation formula
        xe(1:3,i)=ea;
    end

    if max(ea)<=es||iter>=maxit %stopping criterion
        break
    end
    
end

subplot(2,1,1)
plot(iter1,x1iter,'blue',iter1,x2iter,'green',iter1,x3iter,'black')
title('Change in Approximations of x per Iteration')
ylabel('Approximation of x')
xlabel('Iteration')
legend('x1','x2','x3','Location','best')

subplot(2,1,2)
plot(iter1,xe)
title('Change in Error per Iteration')
ylabel('Absolute Relative Approximate Error')
xlabel('Iteration')
legend('Error of x1','Error of x2','Error of x3')