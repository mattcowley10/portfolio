function root = mynewton(func,guess,es,maxit,h)
%Inputs
%   func: function of which we are finding the root
%   h: approximation difference for differentiation
%   guess: guess for root
%   es: stopping error tolerance
%   maxit: maximum number of iterations
%Outputs
%   root: root of the function
%   ea: absolute relative approximate error
%   sf: number of significant figures/correct digits in root calculation
%   iter: total number of iterations ran by algorithm

if nargin < 5; %if the number of inputs is less than 4
    h=0.001; %default max iterations is 100
end

if nargin < 4; %if the number of inputs is less than 3
    maxit=100;%default stopping tolerance is an absolute relative approx. error of 0.001
end

if nargin < 3;
    es=0.001;
end

iter=0;
xold=guess;
while (1)
    derivAtX=(func(xold+h)-func(xold))/h;
    x=xold-(func(xold)/derivAtX); %newton-raphson formula
    if derivAtX==0
        error("Evaluation of derivative at x cannot be zero for Newton Raphson Method")
    end
    iter=iter+1; %iteration counter
    if xold~=0
        ea=(abs(x-xold)/abs(xold))*100 %absolute relative error calculations
    else
        error("Guess cannot be zero for Newton Raphson method")
    end
    sf=floor(2-log(2*ea)) %calculates number of significant figures in root calculation
    if ea<=es || iter>=maxit %if the abs. rel. approx. error <= the stopping criterion or # of iterations >= the max # of inters...
        break %terminates while loop if stopping tolerance is met or max iters. are exceeded
    end
    x=xold;
end
iter
root=x
