function I = trap(func, a, b, n, varargin)
    % trap: composite trapezoidal rule quadrature
    % I = trap(func, a ,b,n,p1,p2,...): composite trapezoid rule 
    % input: 
    % func = name of function to be integrated 
    % a, b = integration limits 
    % n = number of segments (default = 100) 
    % p1, p2, ...=additional parameters used by func 
    % output: 
    % I = integral estimate 
    if nargin<3, error ('at least 3 input arguments required'), end 
    if nargin<4 | isempty(n), n=100, end; 
    truevalue = integral(func,a,b);
    h=(b-a)/n; 
    RelApproxError(1)=NaN;
    for i=1:n
        x = a;
        h=(b-a)/i;
        s = func(a, varargin{:});
        nValue(i)=i;
        for j=1:i-1
            x = x+h;
            s = s+2*func(x, varargin{:});
        end
        s = s+func(b, varargin{:});
        I = double((b-a)*s/(2*i));
        Value(i) = I;
        Et = truevalue - I;
        TrueError(i) = Et;
        et = abs((truevalue - I)/truevalue)*100;
        RelTrueError(i)=et;
        if i>1
            ea = abs((Value(i)-Value(i-1))/Value(i-1))*100;
            RelApproxError(i) = ea;
        end
    end
    nValue=nValue';
    Value=Value';
    TrueError=TrueError';
    RelTrueError=RelTrueError';
    RelApproxError=RelApproxError';
    table(nValue, Value, TrueError, RelTrueError, RelApproxError)
    
    hold on
    
    subplot(2,1,1)
    plot(nValue,Value)
    xlabel("Number of Segments")
    ylabel("Integral Approximation")
    title("How Integral Approximation Changes with Number of Trapezoids")
    
    subplot(2,1,2)
    plot(nValue,RelApproxError,nValue,RelTrueError)
    xlabel("Number of Segments")
    ylabel("Percentage (%)")
    title("How Error Changes with Number of Trapezoids")
    legend("Absolute Relative Approximate Error","Absolute Relative True Error",'Location','best')
    
end