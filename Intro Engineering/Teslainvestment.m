%Defining variables and reading Excel Data 
tesladata = readtable('TSLA.csv');
teslahigh = tesladata.High;
teslalow = tesladata.Low;
tesladates = tesladata.Date;
teslavolume = tesladata.Volume;

figure;

%Plotting and Defining labels for High and Low data
subplot(2,1,1)
hold on
plot(tesladates,teslahigh)
plot(tesladates,teslalow)
legend('High','Low','location','southeast')
xlabel('Date')
ylabel('Price ($)')
title('Tesla Stock Price Highs and Lows Over Time')

%Plotting and Defining labels for Volume data
subplot(2,1,2)
plot(tesladates,teslavolume,'k')
xlabel('Date')
ylabel('Volume')
title('Tesla Stock Volume Over Time')

%Calculating mean and variance for high, low, and volume data
teslahighmean = mean(teslahigh)
teslalowmean = mean(teslalow)
teslahighvariance = var(teslahigh)
teslalowvariance = var(teslalow)
teslavolumemean = mean(teslavolume)
teslavolumevariance = var(teslavolume)