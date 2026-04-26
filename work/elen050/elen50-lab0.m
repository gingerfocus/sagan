clear
close all
clc

%% Part 1:
% Plot f(t) from t = 0 to t =10 using time steps of 0.01. Name this plot as f = exp(-t/3). Add x
% and y labels, and a plot title that is f = exp(-t/3). You will see an exponential decay.
t = 0:0.01:10;
f = @(x) exp(-x/3);

figure;
plot(t, f(t));
xlabel('t');
ylabel('f(t)');
title('f = exp(-t/3)');

%% Part 2
% Plot g(a) from a = 0 to a = 12π where a has 241 linearly spaced elements between 0 and 12π.
% Name the plot as g = cos(a). Add x and y labels, and a plot title that is g = cos(a). You will
% see a sinusoidal oscillation.
a = linspace(0, 12*pi, 241);
g = @(x) cos(x);

figure;
plot(a, g(a));
xlabel('a');
ylabel('g(a)');
title('g = cos(a)');
%grid on;

%% Part 3
% Let a = w*t, w = 3, and y being the product of f and g. Plot y(t) from t=0 to t=10, using time
% steps of 0.01. Name this plot as y = f*g. Add x and y labels, and a plot title that is y = f*g.
% You will see a decaying oscillation.
w = 3;
a = w .* t;
y = f(a) .* g(a);

figure;
plot(t, y);
xlabel('t');
ylabel('y(t)');
title('y = f*g');
grid on;

%% Problem 2
% A student took three courses and received an A- (score 3.7) in a 4 unit course, a B (score 3.0) in a
% 5 unit course, and a C+ (score 2.3) in a 3 unit course. Calculate the term GPA. Display the term GPA with only 2 places after
% the decimal (hint: use the appropriate format command).
scores = [3.7, 3.0, 2.3];
units = [4, 5, 3];

termGPA = sum(scores .* units) / sum(units);

fprintf('Term GPA: %.2f\n', termGPA);
