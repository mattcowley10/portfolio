function root = bisect(func, xlower, xupper, es, maxit)
% Inputs: 
%   func: some inline function
%   xlower: lower bound guess
%   xupper: uppper bound guess
%   es: specified stopping tolerance for error
%   maxit: maximum number of iterations allowed
% Outputs:
%   root: root of the function between guesses
%   ea: absolute relative approximate percent error
%   sf: number of sigficant figures/correct digits in root calculation
%   iter: total number of iterations for the while loop
    if func(xlower) * func(xupper) > 0 % prereq. so function can run. bisection can't run with positive outputs
        error('Function outputs have same signs. Bisection cannot occur') % error statement if above is true
    end
    
    if nargin < 5 % if number of inputs is less than 5...
        maxit = 50; % then max iterations will be 50
    end
    if nargin < 4 % if number of inputs is less than 4...
        es = 0.001; % then stopping tolerance will be  0.001
    end
    iter=0; %starting point for number of iterations
    xroot=xlower; %starting point for xroot
    xrootmat=zeros([1 maxit]);
    errormat=zeros([1 maxit]);
    for i=1:maxit %for loop until iteration are max. Runs until stopping criterion is met
        xoldroot=xroot; %replaces xroot from last loop with new xroot
        xroot = (xupper+xlower)/2; %defines new xroot
        iter=iter+1; %counter for iterations
        if xroot~=0 %if statement that starts error calculations
            ea=(abs(xroot-xoldroot)/abs(xroot))*100; %absolute relative error calculations
            sf=floor(2-log(2*ea)); %calculates number of significant figures in root calculation
            if sf<0
                sf=sf*0;
            end
        else
            error('Absolute value of upper and lower guesses cannot be equal') %must have this error message because ea is not defined if xroot=0
        end
        test=func(xlower)*func(xroot); %test function
        if test<0 %if test output is less than 0...
            xupper=xroot; %xroot becomes our new upper guess
        elseif test>0 %if our test output is greater than 0...
            xlower=xroot; %xroot becomes our new lower guess
        else %if our test function is equal to zero...
            ea=0; %then our error is zero and we have found our root
        end
        xrootmat(1,i)=xroot;
        errormat(1,i)=ea;
        if ea<=es || iter>=maxit %if the abs. rel. approx. error <= the stopping criterion or # of iterations >= the max # of inters...
            break %terminates while loop if stopping tolerance is met or max iters. are exceeded
        end
    end
    iter%shows total number of iterations
    ea
    sf
    itervec=1:iter;
    assignin('base','A',xrootmat(itervec))
    assignin('base','root',xroot)
    assignin('base','B',errormat(itervec))
    assignin('base','itervec',itervec)
    root=xroot
    
    subplot(2,1,1)
    plot(itervec,xrootmat(itervec)), 
    title('How Estimates of x Change as Iterations Increase'), 
    xlabel('Iterations'), 
    ylabel('Estimates of x'), 
    
    subplot(2,1,2)
    plot(itervec,errormat(itervec)) 
    title('How Error Changes as Iterations Increase') 
    xlabel('Iterations')
    ylabel('Absolute Relative Approximate Error')
