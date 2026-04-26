%% ECEN 110L, Linear Systems
%% Lab 2: Signal Transformations and Sounds                                    .

%% 2. Sounds: Listening to Signals
% Step 1 & 2
t1 = (-0.1):0.001:0.1;
f1 = exp(10 * t1) .* cos(2 * pi * 100 * t1);

figure;

plot(t1, f1);
title('f1(t)');
grid on;
axis([-0.1 0.1 -2 2]);

% Step 3
t2 = -2:0.001:2;
f2 = exp(10 * t2) .* cos(2 * pi * 100 * t2);

sound(f2)
pause(2)

% Step 4
f2 = normalize(f2, 'range', [-1,1]);

% Step 5
f3 = flip(f2);

figure;

plot(t2, f3);
title('f2(-t)');
grid on;
axis([-2 2 -1 1]);

sound(f3)
pause(2)

% Step 6
f4 = downsample(f2,2);

figure;

plot(-1:0.001:1, f4);
title('f2(2*t)');
grid on;
axis([-1 1 -1 1]);

saveas(gcf,'Lab2-P1.png');

sound(f4)
pause(2)
