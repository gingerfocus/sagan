% ELEN 110L, Linear Systems

figure;

% Step 1
x = [-10 0 1 2 3 3 4 4 5 10];
y = [0 0 1 0 0 1 1 0 0 0];

% Step 2
plot(x, y);

% Step 3 
title('f(x)');
xlabel('x');
ylabel('y');
grid on;

% Step 4
saveas(gcf,'P2_fig1.png');

% Step 5
figure;

plot(2 * x, 2 * y);

title('g(x)');
xlabel('x');
ylabel('y');
grid on;

saveas(gcf,'P2_fig2.png');

% Step 6, 7 & 8

figure;

f = plot(x, y);

axis([-20 20 -1 3])

title('Animation of f(x) scaling into g(x)');
xlabel('x');
ylabel('y');
grid on;

for i = 1:0.01:2.
    set(f,'XData', i * x);
    set(f,'YData', i * y);
    pause(0.1);
end
