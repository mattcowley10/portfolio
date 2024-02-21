function ans = 4thRungeKutta(f,x0,y0,TargetX,n)
    h = abs(TargetX-x0)/n;
    
    for i=1:n
        k1=f(x0,y0);
        k2=f(x0 + 0.5*h, y0 + 0.5*k1*h);
        k3=f(x0 + 0.5*h, y0 + 0.5*k2*h);
        k4=f(x0 + 0.5*h, y0 + k3*h);
        y0=y0 + 1/6*(k1+2*k2+2*k3+k4);
        yValue(i)=y0;
        Iteration(i)=i;
        x0 = x0 + h;
        xValue(i)=x0;
    end
    
Iteration=Iteration';
yValue=yValue';
xValue=xValue';
ans = y0;
table(Iteration,xValue,yValue)
end