W = 0:0.1:5;
w = 10 .^ W;

function out = addRandomTolerance(x)
    tolerance = 0.8 + (rand() * 0.4);
    out = x * tolerance;
end

figure;
hold on;
set(gca, 'XScale', 'log');

for k=1:10
    r1 = addRandomTolerance(125000);
    r2 = addRandomTolerance(133000);
    c1 = addRandomTolerance(1e-9);
    c2 = addRandomTolerance(1e-9);
    
    h1 = (1) ./ (1 + (1i*w*(r1 * (c1 + c2) + (r2 * c2) )) + ((1i * w).^2 * (r1 * r2 * c1 * c2)));
    H1 = 20 * log10(h1);

    semilogx(w, H1); 
end

hold off;

xlabel('Frequency (Rad/s)');
ylabel('H(jω) (Db)');
title('Transfer Function Model');
