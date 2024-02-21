%Defining variables and reading Excel Data 
GEdata = readtable('GEdata.xlsx');
GEhigh = GEdata.High;
GElow = GEdata.Low;
GEdates = GEdata.Date;
GEvolumes = GEdata.Volume;

figure;

%Plotting and Defining labels for High and Low data
subplot(2,1,1)
hold on
plot(GEdates,GEhigh)
plot(GEdates,GElow)
legend('High','Low')
xlabel('Date')
ylabel('Price ($)')
title('GE Stock Price Highs and Lows Over Time')

%Plotting and Defining labels for Volume data
subplot(2,1,2)
plot(GEdates,GEvolumes,'k')
xlabel('Date')
ylabel('Volume')
title('GE Stock Volume Over Time')

%Calculating mean and variance for high, low, and volume data
GEhighmean = mean(GEhigh)
GElowmean = mean(GElow)
GEhighvariance = var(GEhigh)
GElowvariance = var(GElow)
GEvolumemean = mean(GEvolumes)
GEvolumevariance = var(GEvolumes)