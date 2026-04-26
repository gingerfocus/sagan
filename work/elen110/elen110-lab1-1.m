% ELEN 110L, Linear Systems

% Step 1
t = 0:0.0001:2*pi;
f = 60;
A = 480*sqrt(2);

% Step 2
va = A * sin(2 * pi * f * t);
vb = A * sin(2 * pi * f * t + deg2rad(120));
vc = A * sin(2 * pi * f * t + deg2rad(240));

% Step 3 
plot(t,va);

% Step 4 
hold on;

plot(t,vb);
plot(t,vc);

% Step 5
title('Three Phase Voltage'); 
xlabel('time (sev)'); 
ylabel('Voltage (V)'); 

axis([0 0.05 -A A])

% Step 6 
saveas(gcf,'P1_fig1.png');

