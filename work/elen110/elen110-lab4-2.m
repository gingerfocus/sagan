%% ECEN 110L, Linear Systems Lab 4

% Step 1
dt = 0.001;
t = -1:dt:1;

% Step 2
figure;

f = rectpuls(t, 1);

subplot(3, 1, 1);
plot(t, f, 'red', 'LineWidth', 2);

axis([-1 1 0 1])
title('f(t)');
grid on;

g = rectpuls(t, .5);

subplot(3, 1, 2);
plot(t, g, 'blue', 'LineWidth', 2);
axis([-1 1 0 1])
title('g(t)');
grid on;

% Part 2
subplot(3, 1, 3);
hold on;

title('Animation of convoluting f(x) into g(x)');
xlabel('x');
ylabel('y');
axis([-1 1 0 1])
grid on;

% data buffer
conv_v2 = t * 0;

plot(t, f, 'red', 'LineWidth', 2);
sliding = plot(t, g, 'blue', 'LineWidth', 2);
animation = plot(t, conv_v2, 'cyan', 'LineWidth', 2);

for k = 1:length(t)
    tau = k * dt - 1;

    g_flip = rectpuls(tau - t, 0.5);

    % move sliding window
    set(sliding, 'YData', g_flip);

    conv_v2(k) = trapz(t, f .* g_flip);

    set(animation,'XData', t);
    set(animation,'YData', conv_v2);

    pause(0.01);
end

saveas(gcf,'Lab4-P1.png');

