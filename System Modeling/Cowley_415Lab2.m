figure(1)
hold on
plot(suctionHead,Flow);
plot(dischargeHead,Flow);
xlabel('Pressure (psig)');
ylabel('Volumetric Flow Rate (GPM)');
title('How Pressure Loss in a Centrifugal Pump Affects Volumetric Flow Rate');
legend('Suction Head','Discharge Head','Location','best')

figure(2)
hold on
plot(Torque,Flow);
xlabel('Torque (ft-lb)');
ylabel('Volumetric Flow Rate (GPM)');
title('How Torque of a Centrifugal Pump Affects Volumetric Flow Rate');