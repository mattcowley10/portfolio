function [root,iter,ea] = newtraph(func,dfunc,xr,maxit,es)
% newtraph(func,dfunc,xr,es,maxit):
% uses Newton-Raphson method to find root of a function
% inputs:
% func = name of function
% dfunc = name of derivative of function
% xr = initial guess
% es = stopping error as a percent (OPTIONAL)
% maxit = maximum allowable iterations (OPTIONAL)
% outputs:
% root = real root
% iter = number of iterations completed to find root
% ea = approximate error in root
% if necessary, assign default values
if nargin<4, maxit=50; end % if maxit is blank, set it to 50
if nargin<5, es=0.0001; end % if es is blank, set it to 0.01%
% Newton-Raphson Code
iter = 0;
xrmat=zeros([1,maxit]);
eamat=zeros([1,maxit]);
for i=1:maxit
 xrold = xr;
 xr=xrold-(func(xrold)/dfunc(xrold));
 iter = iter + 1;
 if xr~=0
     ea=(abs((xr-xrold)/xr))*100;
 end
 xrmat(1,i)=xr;
 eamat(1,i)=ea;
 if iter >= maxit, break, end
end
root = xr;
iter
ea
itervec=1:iter;

subplot(2,1,1)
    plot(itervec,xrmat(itervec))
    title('How Estimates of x Change as Iterations Increase'), 
    xlabel('Iterations'), 
    ylabel('Estimates of x'),
subplot(2,1,2)
    plot(itervec,eamat(itervec))
    title('How Error Changes as Iterations Increase') 
    xlabel('Iterations')
    ylabel('Absolute Relative Approximate Error')