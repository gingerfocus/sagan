w0 = [1 10 100 500 1000 5000 10000 100000];
v0 = [1.650 1.650 1.610 1.15 0.691 0.110 0.032 0.001];
V0 = v0 / 2.03
H0 = 20 * log10(V0);

figure;
hold on;
set(gca, 'XScale', 'log');

semilogx(w0, H0);

r1 = 125650;
r2 = 133470;
c1 = 1e-9;
c2 = 1e-9;

W = 0:0.1:5;
w = 10 .^ W;
h1 = (1) ./ (1 + (1i*w*(r1 * (c1 + c2) + (r2 * c2) )) + ((1i * w).^2 * (r1 * r2 * c1 * c2)));
H1 = 20 * log10(h1);

semilogx(w, H1);
hold off;

xlabel('Frequency (Rad/s)');
ylabel('H(jω) (Db)');
title('Transfer Function Model');
