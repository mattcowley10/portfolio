x=-200:1:-100;
y=f(x);

figure
hold on
plot(x,y,'b')
yline(0)

title('Trunnion Contraction Distance as it Relates to Temperature')
ylabel('Distance (mm)')
xlabel('Temperature (Celcius)')
legend('Contraction Distance','x Axis')