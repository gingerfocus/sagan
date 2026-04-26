r1 = 125650;
r2 = 133470;
c1 = 1e-9;
c2 = 1e-9;
W = 0:0.1:5;
w = 10 .^ W;
h1 = (1) ./ (1 + (1i*w*(r1 * (c1 + c2) + (r2 * c2) )) + ((1i * w).^2 * (r1 * r2 * c1 * c2)));
H1 = 20 * log10(h1);

semilogx(w, H1);
xlabel('Frequency (Rad/s)');
ylabel('H(jω) (Db)');
title('Transfer Function Model');
