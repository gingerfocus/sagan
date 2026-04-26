%% ECEN 110L, Linear Systems
%% Lab 2: Signal Transformations and Sounds                                    .

figure;
% xlabel('t');
% ylabel('x(t)');

%% 1. Signal Transformation

% Step 1
t = [-10 0 1 2 3 3 4 4 5 10];
x = [0 0 1 0 0 1 1 0 0 0];

% Step 2
subplot(2, 3, 1);

% Step 3
plot(t, x);
axis([-6 6 -2 4])
title('x(t)');
grid on;

% Step 4
subplot(2, 3, 2);
plot(-t, x);
axis([-6 6 -2 4])
title('y_1(t)');
grid on;

% Step 5
subplot(2, 3, 3);
plot(t, -x);
axis([-6 6 -2 4]);
title('y_2(t)');
grid on;

% Step 6
subplot(2, 3, 4);
plot(t-3, x+2);
axis([-6 6 -2 4])
title('y_3(t)');
grid on;

% Step 7
subplot(2, 3, 5);
plot(3*t, x/2);
axis([-6 15 -2 6])
title('y_4(t)');
grid on;

% Step 8
subplot(2, 3, 6);
plot((t+2)/2, (x-1));
axis([-6 6 -2 4])
title('y_5(t)');
grid on;

saveas(gcf,'Lab2-P1.png');
