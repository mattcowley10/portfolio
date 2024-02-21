x=1:3;
y_error1=[10.8841 0.1050 1.7352e-06];
y_xr1=[14.5877 14.5725 14.5725];
y_error2=[1.5609 0.0608 9.0855e-05];
y_xr2=[39.3852 39.3613 39.3613];

subplot(2,2,1)
    plot(x,y_error1,'blue')
    title('The Change in Relative Error for Each Iteration of the Newton Raphson Method (Root 1)')
    ylabel('Absolute Relative Approximate Error (%)')
    xlabel('Iteration')
subplot(2,2,2)
    plot(x,y_xr1,'blue')
    title('The Change in Root Estimate for Each Iteration of the Newton Raphson Method (Root 1)')
    ylabel('Root Estimate')
    xlabel('Iteration')
subplot(2,2,3)
    plot(x,y_error2,'red')
    title('The Change in Relative Error for Each Iteration of the Newton Raphson Method (Root 2)')
    ylabel('Absolute Relative Approximate Error (%)')
    xlabel('Iteration')
subplot(2,2,4)
    plot(x,y_xr2,'red')
    title('The Change in Root Estimate for Each Iteration of the Newton Raphson Method (Root 2)')
    ylabel('Root Estimate')
    xlabel('Iteration')