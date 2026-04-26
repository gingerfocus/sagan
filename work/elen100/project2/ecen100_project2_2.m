C1=1e-7; C2=1e-7;
M=[-C1 C1 0; 0 0 C2; 0 0 0];

options = odeset('mass', M);
x0=[0 0 0];
[t, x]=ode23t(@transient2_2, [0 0.005], x0, options);

plot(t, x)
xlabel('Time (t)')
ylabel('State Variables (x)')
title('Solution vs Time')
legend('x1', 'x2', 'x3') 
grid on