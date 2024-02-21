function ans = solveDEmidpoint(f,x0,y0,TargetX,n)
    h = abs(TargetX-x0)/n;
    
    for i=1:n
        k1=f(x0,y0);
        k2=f(x0 + 0.5*h, y0 + 0.5*k1*h);
        y0=y0 + k2*h;
        yValue(i)=y0;
        Iteration(i)=i;
        x0 = x0 + h;
        xValue(i)=x0;
    end
    
Iteration=Iteration';
yValue=yValue';
xValue=xValue';
answer = y0;
table(Iteration,xValue,yValue)
end