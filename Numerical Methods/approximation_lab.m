%Definition of x as a vector and h as a constant
x= -2:0.1:2;
h=0.05;

%Defining approximation equations (forward, backward, central, and actual
%derivative)
forwardapprox=(((x+h).^2+(x+h)-10)-(x.^2+x-10))/h;
backwardapprox=(((x.^2)+x-10)-((x-h).^2+(x-h)-10))/h;
centralapprox=(((x+h).^2+(x+h)-10)-((x-h).^2+(x-h)-10))/(2*h);
derivative=2*x+1;

%Forward Approximation Figure (Figure 1)
figure;
hold on;
plot(x,forwardapprox,'r')
xlabel("x")
ylabel("Slope of f(x)")
title("Forward Approximation for the Derivative of f(x)")

%Backward Approximation Figure (FIgure 2)
figure;
hold on;
plot(x,backwardapprox,'b')
xlabel("x")
ylabel("Slope of f(x)")
title("Backward Approximation for the Derivative of f(x)")

%Central Approximation Figure (Figure 3)
figure;
hold on;
plot(x,centralapprox,'g')
xlabel("x")
ylabel("Slope of f(x)")
title("Central Approximation for the Derivative of f(x)")

%Plotting the Derivative (Figure 4)
figure;
hold on;
plot(x,derivative,'k')
xlabel("x")
ylabel("Slope of f(x)")
title("Derivative of f(x)")

%Approximation Comparison Plot (Figure 5)
figure;
hold on;
plot(x,derivative,'k')
plot(x,forwardapprox,'r')
plot(x,backwardapprox,'b')
plot(x,centralapprox,'g')
legend("Derivative","Forward Approximation", "Backward Approximation", "Central Approximation",'Location','southeast')
xlabel("x")
ylabel("Slope of f(x)")
title("Comparing Approximation Methods for Derivatives")

errorForward=(abs(forwardapprox-derivative)./abs(derivative))
errorBackward=(abs(backwardapprox-derivative)./abs(derivative))
errorCentral=(abs(centralapprox-derivative)./abs(derivative))