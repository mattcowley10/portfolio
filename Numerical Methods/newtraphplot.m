x=1:4;
y_error=[126.0875 10.5680 0.1305 2.0466e-05];
y_xr=[-114.9977 -128.5868 -128.7548 -128.7549];

subplot(2,1,1)
    plot(x,y_error,'blue')
    title('The Change in Relative Error for Each Iteration of the Newton Raphson Method')
    ylabel('Absolute Relative Approximate Error (%)')
    xlabel('Iteration')
subplot(2,1,2)
    plot(x,y_xr,'green')
    title('The Change in Root Estimate for Each Iteration of the Newton Raphson Method')
    ylabel('Root Estimate')
    xlabel('Iteration')