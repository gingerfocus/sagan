%% ECEN 110L, Linear Systems Lab 3

% Step 1
t = -1:0.001:5;

% Step 2
figure;

x = (10 * heaviside(t)) - (20*heaviside(t-2)) + (10*heaviside(t-4));
axis([-1 5 -12 12])
title('x(t)');
grid on;

% Step 3
plot(t, x, 'cyan', 'LineWidth', 2);

% Step 4
figure;

y = 10 * rectpuls(t-1, 2) - 10 * rectpuls(t-3, 2);

plot(t, y, 'cyan', 'LineWidth', 2);
axis([-1 5 -12 12])
title('Creating Plot with Rectpuls');
xlabel('t');
ylabel('y(t)');
saveas(gcf,'Lab3-P1.png');

%% Step 5
figure;
subplot(1, 2, 1);

t = -5:0.001:10;

f = ((1/2) .^ t) .* heaviside(t);
plot(t, f, 'cyan', 'LineWidth', 2);

xlabel('t');
ylabel('f(t)');
axis([-5 10 0 1]);

subplot(1, 2, 2);

h = rectpuls(t/3 - 1/2);
plot(t, h, 'cyan', 'LineWidth', 2);

xlabel('t');
ylabel('h(t)');
axis([-5 10 0 1]);

saveas(gcf,'Lab3-P2.png');
