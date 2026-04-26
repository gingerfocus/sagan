%% ECEN 110L, Linear Systems Lab 4

% Step 1
dt = 0.01;
t = -10:dt:10;

% Step 2
figure;

f = rectpuls(t, 1);

subplot(3, 1, 1);
plot(t, f, 'red', 'LineWidth', 2);

axis([-3 3 0 1])
title('f(t)');
grid on;

g = rectpuls(t, 1);

subplot(3, 1, 2);
plot(t, g, 'blue', 'LineWidth', 2);
axis([-3 3 0 1])
title('g(t)');
grid on;

h = conv(f, g, 'same') * dt;
subplot(3, 1, 3);
plot(t, h, 'cyan', 'LineWidth', 2);
axis([-3 3 0 1])
title('h(t)');
grid on;


%% Step 3
dt = 0.01;
t = -10:dt:10;

figure;

f = rectpuls(t, 1);

subplot(3, 1, 1);
plot(t, f, 'red', 'LineWidth', 2);

axis([-3 3 0 1])
title('f(t)');
grid on;

g = tripuls(t, 2);

subplot(3, 1, 2);
plot(t, g, 'blue', 'LineWidth', 2);
axis([-3 3 0 1])
title('g(t)');
grid on;

h = conv(f, g, 'same') * dt;
subplot(3, 1, 3);
plot(t, h, 'cyan', 'LineWidth', 2);
axis([-3 3 0 1])
title('h(t)');
grid on;

%% Step 4
dt = 0.01;
t = -10:dt:10;

figure;

f = tripuls(t, 2);

subplot(3, 1, 1);
plot(t, f, 'red', 'LineWidth', 2);

axis([-3 3 0 1])
title('f(t)');
grid on;

g = tripuls(t, 2);

subplot(3, 1, 2);
plot(t, g, 'blue', 'LineWidth', 2);
axis([-3 3 0 1])
title('g(t)');
grid on;

h = conv(f, g, 'same') * dt;
subplot(3, 1, 3);
plot(t, h, 'cyan', 'LineWidth', 2);
axis([-3 3 0 1])
title('h(t)');
grid on;

