function x = GaussSeidel(A, b, es, maxit) 
% Input 
% 		A = coefficient matrix 
%		b = right hand side vector 
% 		es = stopping criterion (default = 50) 
% 		maxit = maximum number of iterations
% Output 
% 		x = solution vector 
 	if nargin<2
        error ('at least 2 input arguments required')
    end
    
    if nargin<4 || isempty(maxit)
        maxit=50;
    end
    
    if nargin<3|| isempty(es) 
        es=0.00001;
    end
    
    [m,n] = size(A);
    
    if m~=n
        error ('Matrix A must be square') 
    end
    
    C = A;

    for i = 1:n
        C(i,i) = 0; 
    end
    
    x(1) = -0.005;
    x(2) = 0.001; 
    x(3) = 0.0002;
    x(4) = 0.03;
    x=x';
    
    for i=1:n
        C(i,1:n) = C(i,1:n)/A(i,i);
    end 
    
    for i=1:n 
        d(i) = b(i)/A(i,i);
    end 
    
    iter = 0; 
    a1=zeros(maxit,1);
    a2=zeros(maxit,1);
    a3=zeros(maxit,1);
    a4=zeros(maxit,1);
    ea1=zeros(maxit,1);
    ea2=zeros(maxit,1);
    ea3=zeros(maxit,1);
    ea4=zeros(maxit,1);
    
    while (1)
        iter=iter+1;
        xold = x; 
        
        for i = 1:n
            x(i) = d(i)-C(i,:)*x;
            if x(i) ~= 0 
                ea(i) = abs((x(i) - xold(i))/x(i))*100;
            end 
        end
            ea1(iter)=ea(1);
            ea2(iter)=ea(2);
            ea3(iter)=ea(3);
            ea4(iter)=ea(4);
            a1(iter)=x(1);
            a2(iter)=x(2);
            a3(iter)=x(3);
            a4(iter)=x(4);
            Iteration(iter)=iter;
            
        if max(ea) <= es || iter >= maxit
            break
        end
    end
    
    Iteration=Iteration';
    tablegraph = table(Iteration,a1,ea1,a2,ea2,a3,ea3,a4,ea4)
    r=6.5;
    E=30e6;
    v=0.3;
    stress = (E/(1-v^2))*((x(3)*(1+v))+(x(4)*((1-v)/r^2)))
    
    
    subplot(2,1,1)
    plot(Iteration, a1, Iteration, a2, Iteration, a3, Iteration, a4)
    title('How Coefficient Approximations Change with Increasing Iterations')
    ylabel('Coefficient Estimate')
    xlabel('Iteration')
    legend('C1', 'C2', 'C3','C4','location', 'east outside')
    
    subplot(2,1,2)
    plot(Iteration, ea1, Iteration, ea2, Iteration, ea3, Iteration, ea4)
    title('How Error Changes with Increasing Iterations')
    ylabel('Absolute Relative Approximate Error')
    xlabel('Iteration')
    legend('Error of C1', 'Error of C2', 'Error of C3','Error of C4','location','east outside')
end