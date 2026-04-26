%% ECEN 110L, Linear Systems
%% Lab 2: Signal Transformations and Sounds                                    .

figure;

%% 3. Sounds: Adding Harmonics
% Step 1

t = 0:0.0001:5
f = cos(2 * pi * 55 * t); % too low for me to hear

plot(t, f);
title('f(t)');
grid on;
axis([0 0.05 -1 1]);

sound(f);
pause(5);

% Step 2
g = cos(2 * pi * 880 * t);

figure;

plot(t, g);
title('g(t)');
grid on;
axis([0 0.05 -1 1]);

sound(g);
pause(5);

% Step 3
h = normalize(g + f, 'range', [-1,1]);

figure;

plot(t, h);
title('h(t)');
grid on;
axis([0 0.05 -1 1]);

saveas(gcf,'Lab2-P3.png');

sound(h);
pause(5);
