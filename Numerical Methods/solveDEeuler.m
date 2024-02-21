function answer = solveDEeuler(f, x0, y0, TargetX, n)
    h = abs(TargetX-x0)/n;
    if nargin < 5
        n = 100;
    end
    for i=1:n
        y0 = y0 + h*(f(x0,y0));
        xValue(i)=x0;
        yValue(i)=y0;
        Iteration(i)=i;
        x0 = x0 + h;
    end
Iteration=Iteration';
yValue=yValue';
xValue=xValue';
answer = y0;
table(Iteration,xValue,yValue)
end